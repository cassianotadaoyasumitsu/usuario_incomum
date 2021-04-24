<template>
  <div>
    <div v-if="isShared" @click="deleteShare()">
      いいねを取り消す {{ count }}
    </div>
    <div v-else @click="registerShare()">
      いいねする {{ count }}
    </div>
  </div>
</template>

<script>
// axios と rails-ujsのメソッドインポート
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
// CSRFトークンの取得とリクエストヘッダへの設定をしてくれます
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  // propsでrailsのviewからデータを受け取る
  props: ['userId', 'postId'],
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
    // ログインユーザが既にいいねしているかを判定する
    isLiked() {
      if (this.shareList.length === 0) { return false }
      return Boolean(this.findShareId())
    }
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function() {
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
    },
    // ログインユーザがいいねしているshareモデルのidを返す
    findShareId: function() {
      const share = this.shareList.find((share) => {
        return (share.user_id === this.userId)
      })
      if (share) { return share.id }
    }
  }
}
</script>
