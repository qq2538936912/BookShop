<template>
    <div class="main">
        <el-row>
            <el-col :span="5">
                <div class="grid-content bg-purple">
                    <div class="div1">
                        <div class="felei">全部分类</div>
                        <el-menu>
                            <div class="felei1">
                                <el-menu-item  :key="c.classificationNo" @click="bt(c.classificationNo)" v-for="c in classification">
                                    {{c.name}}
                                </el-menu-item>
                            </div>
                            <div class="felei2" >
                                <el-menu-item :key="b.booktypeNo" @click="selectbyname(b.name)" v-for="b in booktype">
                                    {{b.name}}
                                </el-menu-item>
                            </div>
                        </el-menu>
                    </div>
                </div>
            </el-col>
            <el-col :span="19">
                <div class="leixing">
                    <div class="daohang">
                        <div class="lei">
                            <div class="lei1">按频道：</div>
                            <div class="lei2" :key="c.classificationNo" @click="bt(c.classificationNo)"  v-for="c in classification">
                                <span>{{c.name}}</span>
                            </div>
                        </div>
                        <div class="lei" >
                            <div class="lei1">按类型：</div>
                            <div :key="b.booktypeNo" @click="selectbyname(b.name)" class="lei2" v-for="b in booktype">
                                <span>{{b.name}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="daohang1">
                        <span>热度排序<p class="el-icon-bottom"></p></span>
                        <span>更新时间<p class="el-icon-top"></p></span>
                    </div>

                    <div :key="b.bookNo" class="daohang2" v-for="b in book" >
                        <div class="tup" >
                            <img :src="'/api/' + b.cover"  @click="$router.push('/shop/' + b.productNo)">
                        </div>
                        <div class="rong">
                            <h2>图书名称：{{b.bookName}}</h2>
                            <p class="p">作者：{{b.author}}</p>
                            <span>图书简介：{{b.content}}</span>
<!--                            <button class="bg" >-->
<!--                                <router-link  :to="'/ShopBody'" >立即阅读</router-link>-->
<!--                            </button>-->
<!--                            <button class="bg2">-->
<!--                                <router-link  :to="'y'" >查看目录</router-link>-->
<!--                            </button>-->
                        </div>
                    </div>
                </div>
            </el-col>
        </el-row>
    </div>
</template>

<script>
    import axios from "axios";
    export default {
        name: "classbody",
        data(){
            return{
                booktype: [],
                book:[],
                classification: [],
            }
        },
        created() {
            axios.get("/api/SelectAllClassificationServlet").then(e =>{
                this.classification = e.data;
            });
            axios.get("/api/SelectByClassificationNoTypeServlet?classificationNo=" + this.$route.params.params).then(e =>{
                this.booktype = e.data;
            });
            if (!this.$route.params.params2){
                axios.get("/api/SelectByClassificationNoServlet?classificationNo=" + this.$route.params.params).then(e =>{
                    this.book = e.data;
                });
            }
            if (this.$route.params.params2){
                axios.get("/api/SelectByNameServlet?name=" + this.$route.params.params2).then(e =>{
                    this.book = e.data;
                });
            }
        },
        methods:{
            bt(classificationNo){
                axios.get("/api/SelectByClassificationNoTypeServlet?classificationNo=" + classificationNo).then(e =>{
                    this.booktype = e.data;
                });
                axios.get("/api/SelectByClassificationNoServlet?classificationNo=" + classificationNo).then(e =>{
                    this.book = e.data;
                });
            },
            selectbyname(name){
                axios.get("/api/SelectByNameServlet?name=" + name).then(e =>{
                    this.book = e.data;
                });
            },
        },
    }
</script>

<style scoped>
    .felei{
        width: 240px;
    }
    .main{
        margin-left:20px;
        margin-right:20px;
        margin-top:20px;

        background-color: #F6F6F6;
    }
    .el-row {
        margin-bottom: 20px;
    }

    .el-col {
        border-radius: 4px;
    }

      .bg-purple {
          margin-right: 10px;
          background-color: #F6F6F6;
      }
    .felei{
        background-color: gainsboro;
        height:30px;
        font-size:20px;
        font-weight: bold;
        text-align: center;
        padding:10px 0px 10px 0px
    }
    .div2{
        margin-top:20px;
    }
    .felei1{
        width:240px;
    }
    .felei2{
        width: 120px;
        float: left;

    }
    .div22{
        height: 150px;
        margin-left:5px;
        margin-right:5px;
        margin-top:10px;
    }
    .tupian{
        float:left;
        background-size:100px 150px;
        height:150px;
        width:100px;

    }
    .tupian2 {
        float: left;
        height: 150px;
        margin-left: 10px;
        width: 100px;
    }
    h3{
        margin-bottom:10px;
    }
    h3:hover{
        color:red;
    }
    p{
        margin-bottom: 5px;
    }


      .bg-purple-light {

      }
    .grid-content {
        border-radius: 4px;
        min-height: 36px;
    }
    .row-bg {
        padding: 10px 0;
        background-color: #f9fafc;
    }
    .daohang{
        border-bottom:1px solid gray;
        margin-top: 70px;

    }
    .lei{
        width:800px;
        height:30px;
    }
    .lei1{
        float:left;
    }
    .lei2{
        float:left;
    }
    .daohang span{
        float:left;
        margin-left:20px;
    }
    span:hover{
        color:orangered;
    }
    .daohang1{
        padding:10px 0px 10px 0px;
        margin-bottom: 10px;
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
    .rong h2,.rong .p{

    }
    .bottom{
        float: left;
        width:100px;
    }
    .tup img{
        width: 160px;
    }
</style>