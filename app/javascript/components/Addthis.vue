<template>
  <AddThis publicId="ra-605df3add1f6a00c"
   :data-url="url"
   :async="true"
  />
</template>

<script>
  import AddThis from 'vue-simple-addthis-share/src/AddThis.vue'

  export default {
    props: {
    url: {type: String}
    },
    components: {
      AddThis
    }
  }
</script>
