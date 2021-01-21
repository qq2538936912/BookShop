<template>
        <div>
            <login></login>
            <classbody></classbody>
        </div>
</template>

<script>
    import axios from "axios";
    import login from "./main/Login";
    import classbody from "./class/ClassBody"
    export default {
        name: "classification",
        components:{
            login,classbody
        },

    }
</script>

<style lang="scss" scoped>

</style>