<template>
    <div>

        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect1">
            <el-menu-item index="1" @click="$router.push('/')">首页</el-menu-item>
            <el-menu-item index="2">分类</el-menu-item>
            <el-menu-item index="3">排行</el-menu-item>
            <el-menu-item index="4">企业服务</el-menu-item>
            <el-menu-item index="5">征文大赛</el-menu-item>
            <el-menu-item index="6">下载</el-menu-item>
            <div>
                <div class="main2">
                    <el-input v-model="input" placeholder="请输入内容"></el-input>
                    <el-button type="primary" @click="$router.push('/search/' + input)">搜索</el-button>
                    <div class="login">
                        <el-button type="primary">登录</el-button>
                    </div>
                </div>
            </div>
        </el-menu>
        <div class="classification">
            <ul>频道
                <li v-for="classifications in classification" :key="classifications" @click="bt(classifications.classificationNo)">{{classifications.name}}</li>
            </ul>
            <ul>类型
                <li v-for="booktypes in booktype" :key="booktypes" @click="selectbyname(booktypes.name)">{{booktypes.name}}</li>
            </ul>
        </div>
        <div>
            <ul v-for="books in book" :key="books" class="books">
            <li>图书名称：{{books.bookName}}</li>
            <li>作者：{{books.author}}</li>
            <li>封面图：</li><img :src="'/api/' + books.cover" class="cimgs" @click="$router.push('/shop/' + books.productNo)">
            <li>图书简介：{{books.content}}</li>
            </ul>
        </div>
    </div>
</template>

<script>
    import axios from "axios";
    export default {
        name: "classification",
        data(){
            return{
                activeIndex: "",
                input: "",
                booktype: [],
                book:[],
                classification: [],
                handleSelect1: ""
            }
        },
        created() {
            axios.get("/api/SelectAllClassificationServlet").then(e =>{
                this.classification = e.data;
            });
            axios.get("/api/SelectByClassificationNoTypeServlet?classificationNo=" + this.$route.params.params).then(e =>{
                this.booktype = e.data;
            });
            axios.get("/api/SelectByClassificationNoServlet?classificationNo=" + this.$route.params.params).then(e =>{
                this.book = e.data;
            });
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
        }
    }
</script>

<style scoped>
    .classification li{
        display: inline-block;
        padding-left: 50px;
        padding-right: 10px;
    }
</style>