<template>
    <el-row>
        <el-col :span="19">
            <div class="leixing">
                <div class="daohang2" v-for="c in commoditie" :key="c">
                    <div class="tup" >
                        <img :src="'/api/' + c.cover"  @click="$router.push('/shop/' + c.productNo)">
                    </div>
                    <div class="rong">
                        <h2>图书名称：{{c.bookName}}</h2>
                        <p class="p">作者：{{c.author}}</p>
                        <span>图书简介：{{c.content}}</span>
<!--                        <button class="bg" >-->
<!--                            <router-link  :to="'/ShopBody'" >立即阅读</router-link>-->
<!--                        </button>-->
<!--                        <button class="bg2">-->
<!--                            <router-link  :to="'y'" >查看目录</router-link>-->
<!--                        </button>-->
                    </div>
                </div>
            </div>
        </el-col>
    </el-row>
</template>

<script>
    import axios from "axios";

    export default {
        name: "searchbody",
        data(){
            return{
                name: "search",
                input: "",
                commoditie:[],
            }
        },
        created() {
            axios.get("/api/SelectByBookNameBookProductServlet",{
                params:{
                    bookName: this.$route.params.params,
                    author: this.$route.params.params
                }
            }).then(e =>{
                this.commoditie = e.data;
            });
        },
        methods:{
            search(){
                axios.get("/api/SelectByBookNameBookProductServlet",{
                    params:{
                        bookName: this.input,
                        author: this.input
                    }
                }).then(e =>{
                    this.commoditie = e.data;
                });
            }
        }
    }
</script>

<style scoped>

    h3{
        margin-bottom:10px;
    }
    h3:hover{
        color:red;
    }
    p{
        margin-bottom: 5px;
    }

    .daohang span{
        float:left;
        margin-left:20px;
    }
    span:hover{
        color:orangered;
    }
    .daohang1 span{
        margin-right:30px;
    }
    .daohang2{
        width:500px;
        height: 230px;
        padding:1px;
        margin-bottom:10px;
        float: left;
    }
    .daohang2 .bg{
        color:beige;
        background-color:orangered;
        width:130px;
        color:#ffffff;
        border: 2px solid orangered;
        margin-top:10px;
        margin-right:10px;
        height: 30px;
    }
    .daohang2 .bg2{
        width:130px;
        height: 30px;
    }
    .daohang2 p{
        margin-top:10px;
    }
    .tup{
        float:left;
        width:170px;
        margin-right:10px;
        height:230px;
    }
    .rong{
        float:left;
        width:300px;
        height:230px;
    }
    .tup img{
        width: 160px;
    }
    .leixing{
        margin-top: 65px;
        /*border: #121212 solid;*/
        width: 100%;
    }
</style>