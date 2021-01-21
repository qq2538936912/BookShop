<template>
    <div>
        <div>
            <login></login>
            <index></index>
            <copyright></copyright>
        </div>

    </div>
</template>

<script>
    import axios from "axios";
    import copyright from './main/Copyright'
    import login from "./main/Login"
    import index from "./main/Index"

    export default {
        name: 'main',
        components:{
            copyright,login,index
        },

    }
</script>
<style scoped>

</style>
