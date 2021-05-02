<template>
    <div v-if="show">
       <button @click="rerender">re-render</button>
    </div>
</template>
<script>
    export default {
        data(){
            return {show:true}
        },
        methods:{
            rerender(){
                this.show = false
                this.$nextTick(() => {
                    this.show = true
                    console.log('re-render start')
                    this.$nextTick(() => {
                        console.log('re-render end')
                    })
                })
            }
        }
    }
</script>
