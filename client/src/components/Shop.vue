<template>
        <div>
            <login></login>
            <shopbody></shopbody>
        </div>
</template>

<script>
    import axios from "axios";
    import login from "./main/Login"
    import shopbody from "./shop/ShopBody"
    export default {
        name: "shop",
        components:{
            login,shopbody
        },

    };
</script>

<style scoped>

</style>