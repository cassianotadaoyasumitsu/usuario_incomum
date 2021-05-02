<template>
  <div class="share-this">
    <!-- This is the placement code ShareThis provides. -->
    <div class="sharethis-inline-share-buttons" :data-url= "url" @click="registerShare()"></div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
// CSRFトークンの取得とリクエストヘッダへの設定をしてくれます
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  props: {
    url:String,
    postId: Number
  },
  data() {
    return {
      shareList: []  // いいね一覧を格納するための変数　{ id: 1, user_id: 1, post_id: 1 } がArrayで入る
    }
  },
  // 算出プロパティ ここではshareListが変更される度に、count、isshared が再構築される (watchで監視するようにしても良いかも)
  computed: {
    // いいね数を返す
    count() {
      return this.shareList.length
    },
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function() {
    console.log(this);
    this.fetchShareByPostId().then(result => {
      this.shareList = result
    })
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    fetchShareByPostId: async function() {
      const res = await axios.get(`/api/shares/?post_id=${this.postId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    // rails側のcreateアクションにリクエストするメソッド
    registerShare: async function() {
      console.log(this.postId);
      const res = await axios.post('/api/shares', { post_id: this.postId })
      if (res.status !== 201) { process.exit() }
      this.fetchShareByPostId().then(result => {
        this.shareList = result
      })
    },
    // rails側のdestroyアクションにリクエストするメソッド
    deleteShare: async function() {
      const shareId = this.findShareId()
      const res = await axios.delete(`/api/shares/${shareId}`)
      if (res.status !== 200) { process.exit() }
      this.shareList = this.shareList.filter(n => n.id !== shareId)
    }
  },
  mounted() {
    const st = window.__sharethis__

    if (!st) {
      const script = document.createElement('script')
      script.src =
        'https://platform-api.sharethis.com/js/sharethis.js#property=6086c37a5bceea0018b2b0a0>&product=sop'
      document.body.appendChild(script)

    } else if (typeof st.initialize === 'function') {
      st.href = window.location.href
      st.initialize()
    }
  }
}
</script>

