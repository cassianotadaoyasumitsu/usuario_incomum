<template>
  <div class="d-flex align-items-center mb-3">
    <input type="text" :placeholder="url" class="search-form-control form-control mr-1" readonly >
    <a href="#"
      v-clipboard:copy= "url"
      v-clipboard:success="onCopy"
      v-clipboard:error="onError"><i class="far fa-clipboard" style="color: gray;font-size:28px;"></i></a>
   </div>
</template>

<script>
import axios from 'axios'
export default {
  props: {
    url: { type: String}
  },
  methods: {
    onCopy: function (e) {
      alert('You just copied: ' + e.text)
    },
    onError: function (e) {
      alert('Failed to copy texts')
    }
  }
}
</script>
