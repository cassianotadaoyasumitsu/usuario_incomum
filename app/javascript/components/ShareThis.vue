<template>
  <div class="share-this">
    <!-- This is the placement code ShareThis provides. -->
    <div class="sharethis-inline-share-buttons" :data-url= "url"></div>
  </div>
</template>

<script>
export default {
  props:{
    url: { type: String},
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

