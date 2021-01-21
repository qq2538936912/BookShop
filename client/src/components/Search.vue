<template>
    <div>
        <login></login>
        <searchbody></searchbody>
<!--        <div v-for="c in commoditie" :key="c">-->
<!--            <p>图书名称：{{c.bookName}}</p>-->
<!--            <p>作者：{{c.author}}</p>-->
<!--            <p>封面图：</p><img :src="'/api/' + c.cover"  @click="$router.push('/shop/' + c.productNo)">-->
<!--            <p>图书简介：{{c.content}}</p>-->
<!--        </div>-->
    </div>
</template>

<script>
    import axios from "axios";
    import login from "./main/Login"
    import searchbody from  "./search/SearchBody"
    export default {
        name: 'search',
        components:{
            login,searchbody
        },

    }
</script>

<style scoped>

</style>