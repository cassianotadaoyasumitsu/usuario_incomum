<template>
  <div>
    <div v-if="isKeeped" @click="deleteKeep()">
    <i class="fas fa-bookmark">Unkeep</i><span class="numero">{{ count }}</span>
   </div>
    <div v-else @click="registerKeep()">
    <i class="far fa-bookmark">Keep</i><span class="numero">{{ count }}</span>
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
      keepList: []  // いいね一覧を格納するための変数　{ id: 1, user_id: 1, post_id: 1 } がArrayで入る
    }
  },
  // 算出プロパティ ここではkeepListが変更される度に、count、iskeepd が再構築される (watchで監視するようにしても良いかも)
  computed: {
    // いいね数を返す
    count() {
      return this.keepList.length
    },
    // ログインユーザが既にいいねしているかを判定する
    isKeeped() {
      if (this.keepList.length === 0) { return false }
      return Boolean(this.findKeepId())
    }
  },
  // Vueインスタンスの作成・初期化直後に実行される
  created: function() {
    this.fetchKeepByPostId().then(result => {
      this.keepList = result
    })
  },
  methods: {
    // rails側のindexアクションにリクエストするメソッド
    fetchKeepByPostId: async function() {
      const res = await axios.get(`/api/v1/keeps/?post_id=${this.postId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    // rails側のcreateアクションにリクエストするメソッド
    registerKeep: async function() {
      const res = await axios.post('/api/v1/keeps', { post_id: this.postId })
      if (res.status !== 201) { process.exit() }
      this.fetchKeepByPostId().then(result => {
      this.keepList = result
      })
    },
    // rails側のdestroyアクションにリクエストするメソッド
    deleteKeep: async function() {
      const keepId = this.findKeepId()
      const res = await axios.delete(`/api/v1/keeps/${keepId}`)
      if (res.status !== 200) { process.exit() }
      this.keepList = this.keepList.filter(n => n.id !== keepId)
    },
    // ログインユーザがいいねしているkeepモデルのidを返す
    findKeepId: function() {
      const keep = this.keepList.find((keep) => {
        return (keep.user_id === this.userId)
      })
      if (keep) { return keep.id }
    }
  }
}
</script>
