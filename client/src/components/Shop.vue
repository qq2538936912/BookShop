<template>
        <div>
            <div>
                <el-menu class="el-menu-demo" mode="horizontal">
                    <el-menu-item @click="$router.push('/')">首页</el-menu-item>
                    <el-menu-item @click="$router.push('/classification')">分类</el-menu-item>
                    <el-menu-item>排行</el-menu-item>
                    <el-menu-item>企业服务</el-menu-item>
                    <el-menu-item>征文大赛</el-menu-item>
                    <el-menu-item>下载</el-menu-item>
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
            </div>
             <div>
                <el-container>
                    <img :src="imgurl" class="cimg" >
                    <div>
                        <el-header>{{commoditie.bookName}}</el-header>
                        <el-header>作者：{{commoditie.author}}</el-header>
                        <p class="price" >价格：{{commoditie.price}}</p>
                        <el-button type="primary" size="small">购买</el-button>
                        <p class="content">{{commoditie.content}}</p>
                    </div>
                </el-container>
            </div>
        <div>
            <el-container>
                 <el-main>书圈</el-main>
             </el-container>
        </div>
            <div class="block">
                <el-pagination
                        layout="prev, pager, next"
                        :total="1000">
                </el-pagination>
            </div>
    </div>
</template>

<script>

    import axios from "axios";

    export default {
        name: "shop",
        data() {
            return {
                input: "",
                commoditie:[],
                imgurl: "",
            }
        },
        created() {
            axios.get("/api/SelectByProductNoCommoditieServlet?productNo=" + this.$route.params.productNo).then(e =>{
                this.commoditie = e.data;
                this.imgurl = "/api/" + e.data.cover;
            });
        }
    };
</script>
<style>
    .cimg{
        padding-top: 60px;
        padding-left: 7px;
        padding-right: 40px;
        padding-bottom: 70px;
    }
    .content{
        text-indent: 45px
    }

    .price{
        padding-left: 605px;
        font-size: 15px;
    }

    .price .el-button{
        margin-left: 610px;
    }

    .el-input{
        width: 200px;
    }
</style>