<template>
    <ShareThis :url="url" />
</template>

<script>
import ShareThis from '../components/ShareThis.vue'

export default {
  props: {
    url: { type: String}
  },
  components: { ShareThis }
}
</script>
