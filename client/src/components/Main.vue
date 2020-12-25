<template>
    <div>
        <div>
            <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
                <el-menu-item index="1"><a href="#" target="_blank">首页</a></el-menu-item>
                <el-menu-item index="2"><a href="#" target="_blank">分类</a></el-menu-item>
                <el-menu-item index="3"><a href="#" target="_blank">排行</a></el-menu-item>
                <el-menu-item index="4"><a href="#" target="_blank">企业服务</a></el-menu-item>
                <el-menu-item index="5"><a href="#" target="_blank">征文大赛</a></el-menu-item>
                <el-menu-item index="6"><a href="#" target="_blank">下载</a></el-menu-item>
                <div>
                    <div class="main2">
                        <el-autocomplete
                                popper-class="my-autocomplete"
                                v-model="state"
                                :fetch-suggestions="querySearch"
                                placeholder="请输入内容"
                                @select="handleSelect"
                                class="main3">
                            <i
                                    class="el-icon-edit el-input__icon"
                                    slot="suffix"
                                    @click="handleIconClick">
                            </i>
                            <template slot-scope="{ item }">
                                <div class="name">{{ item.value }}</div>
                                <span class="addr">{{ item.address }}</span>
                            </template>
                        </el-autocomplete>
                        <div class="login"><el-button type="primary">登录</el-button></div>
                    </div>
                </div>
            </el-menu>
        </div>
        <div>
                <el-carousel type="card" :interval="5000" arrow="always" height="50" indicator-position="outside">
                    <el-carousel-item v-for="commodity in commodities" :key="commodity">
                        <img :src="'/api/' + commodity.cover">
                    </el-carousel-item>
                </el-carousel>
        <div>
             <div>
                <el-container>
                        <el-header>出版图书</el-header>
                        <el-header>小说|励志|文学|经济管理|更多</el-header>
                        <el-container>
                            <el-aside width="500px" v-for="commodity in commodities" :key="commodity">
                                <p>图书名称：{{commodity.bookName}}</p>
                                <p>作者：{{commodity.author}}</p>
                                <p>封面图：</p><img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.id)">
                                <p>图书简介：{{commodity.content}}</p>
                                <p>价格：{{commodity.price}}</p>
                            </el-aside>
                            <el-container>
                                <div class="bestseller">
                                    <span class="banyan">榜单</span>
                                    <ul v-for="bestsellers in bestseller" :key="bestsellers">
                                        <li>{{bestsellers.bookName}}</li>
                                    </ul>
                                </div>
                            </el-container>

                        </el-container>
                    </el-container>


                 <el-container>
                     <el-header>男生频道</el-header>
                     <el-header>玄幻|奇幻|武侠|更多</el-header>
                     <el-container>
                         <el-aside width="500px" v-for="commodity in boycommodities" :key="commodity">
                             <p>图书名称：{{commodity.bookName}}</p>
                             <p>作者：{{commodity.author}}</p>
                             <p>封面图：</p><img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.id)">
                             <p>图书简介：{{commodity.content}}</p>
                             <p>价格：<span>{{commodity.price}}</span></p>
                         </el-aside>
                         <el-container>
                             <div class="bestseller">
                                 <span class="banyan">榜单</span>
                                 <ul v-for="bestsellers in bestseller" :key="bestsellers">
                                     <li>{{bestsellers.bookName}}</li>
                                 </ul>
                             </div>
                         </el-container>

                     </el-container>
                 </el-container>


                 <el-container>
                     <el-header>女生频道</el-header>
                     <el-header>现代言情|古代言情|幻想言情|青春校园|更多</el-header>
                     <el-container>
                         <el-aside width="500px" v-for="commodity in girlcommodities" :key="commodity">
                             <p>图书名称：{{commodity.bookName}}</p>
                             <p>作者：{{commodity.author}}</p>
                             <p>封面图：</p><img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.id)">
                             <p>图书简介：{{commodity.content}}</p>
                             <p>价格：{{commodity.price}}</p>
                         </el-aside>
                         <el-container>
                             <div class="bestseller">
                                 <span class="banyan">榜单</span>
                                 <ul v-for="bestsellers in bestseller" :key="bestsellers">
                                     <li @click="$router.push('/shop/' + commodity.id)">{{bestsellers.bookName}}</li>
                                 </ul>
                             </div>
                         </el-container>
                     </el-container>
                 </el-container>
                </div>
            </div>
        </div>
            <copyright></copyright>
    </div>
</template>

<script>
    import copyright from './Copyright'
    import axios from "axios";

    export default {
        name: 'main',
        components:{
            copyright
        },
        data() {
            return {
                input: "",
                commodities:[],
                girlcommodities:[],
                boycommodities:[],
                bestseller:[],
                activeIndex: '1',
                activeIndex2: '1',
                state: "",
                querySearch: ""
            };
        },
        created(){
            axios.get("/api/SelectRandomCommoditieServlet").then(e =>{
                 this.commodities = e.data;
            });
            axios.get("/api/SelectGirlCommoditieServlet").then(e =>{
                 this.girlcommodities = e.data;
            });
            axios.get("/api/SelectBoyCommoditieServlet").then(e =>{
                this.boycommodities = e.data;
            });
            axios.get("/api/SelectBestsellerCommoditieServlet").then(e =>{
                this.bestseller = e.data;
            });

        },
        methods: {
            handleSelect(key, keyPath) {
                console.log(key, keyPath);
            },handleIconClick(){
                console.log("")
            }
        }
    }
</script>
<style>
    .el-carousel__item h3 {
        color: #475669;
        font-size: 18px;
        opacity: 0.75;
        line-height: 300px;
        margin: 0;
    }

    .el-carousel__item:nth-child(2n) {
        background-color: #99a9bf;
    }

    .el-carousel__item:nth-child(2n+1) {
        background-color: #d3dce6;
    }
    .el-header, .el-footer {
        color: #333;
        text-align: center;
        line-height: 60px;
    }

    .el-aside {
        background-color: #D3DCE6;
        color: #333;
        font-size: 10px;
        /*text-align: center;*/
        /*line-height: 200px;*/
    }

    .el-main {
        background-color: #E9EEF3;
        color: #333;
        text-align: center;
        line-height: 160px;
    }

    body > .el-container {
        margin-bottom: 40px;
    }

    .el-container:nth-child(5) .el-aside,
    .el-container:nth-child(6) .el-aside {
        line-height: 260px;
    }
    .el-container:nth-child(7) .el-aside {
        line-height: 320px;
    }
    .el-container{
        padding-left: 50px;
    }
    .el-aside{
        padding-left: 60px;
        padding-top: 0px;
    }

    .cimgs{
        width: 200px;
        height: 200px;
        padding-left: 70px;
    }

    img{
        height: 100%;
        width: 100%;
    }

    a {
        text-decoration: none
    }

    .bestseller{
        height: 650px;
        background-color: #E9EEF3;
        margin-left: 0px;
        font-size: 20px;
    }

    ul{
        padding-left: 0px;
    }

    li{
        list-style-type: none;
    }

    .bestseller .banyan{
        font-size: 30px;
        margin-left: 100px;
    }

    p span ,p{
        font-size: 20px;
    }

    .login{
        float: right;
    }

    .main2{
        padding-top: 10px;
    }

    .main3{
        padding-left: 150px;
    }
</style>
