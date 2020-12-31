<template>
    <div>
        <div>
            <el-menu class="el-menu-demo" mode="horizontal">
                <el-menu-item>首页</el-menu-item>
                <el-menu-item @click="$router.push('/classification')">分类</el-menu-item>
                <el-menu-item>排行</el-menu-item>
                <el-menu-item>企业服务</el-menu-item>
                <el-menu-item>征文大赛</el-menu-item>
                <el-menu-item>下载</el-menu-item>
                <div>
                    <div class="main2">
                        <el-input v-model="input" placeholder="作者/书名"></el-input>
                        <el-button type="primary"  @click="$router.push('/search/' + input)">搜索</el-button>
                        <div class="login">
                                <div v-if="user.phone===form.phone" class="phone">
                                {{user.phone}}
                            </div>

                            <div>
                                <el-button type="text" @click="login = true" id="login">登录</el-button>

                                <el-dialog title="外层 Dialog" :visible.sync="login">

                                    <el-form :model="form">
                                        <el-form-item label="手机号" :label-width="formLabelWidth">
                                            <el-input v-model="form.phone" autocomplete="off"></el-input>
                                        </el-form-item>
                                        <el-form-item label="密码" :label-width="formLabelWidth">
                                            <el-input v-model="form.userpass" autocomplete="off"></el-input>
                                        </el-form-item>
                                    </el-form>

                                    <el-dialog
                                            width="35%"
                                            title="内层 Dialog"
                                            :visible.sync="forgetpassword"
                                            append-to-body>
                                        <el-form :model="form2">
                                            <el-form-item label="手机号" :label-width="formLabelWidth">
                                                <el-input v-model="form2.phone" autocomplete="off"></el-input>
                                            </el-form-item>
                                            <el-form-item label="旧密码" :label-width="formLabelWidth">
                                                <el-input v-model="form2.userpass" autocomplete="off"></el-input>
                                            </el-form-item>
                                            <el-form-item label="新密码" :label-width="formLabelWidth">
                                                <el-input v-model="form2.newpassone" autocomplete="off"></el-input>
                                            </el-form-item>
                                            <el-form-item label="确认新密码" :label-width="formLabelWidth">
                                                <el-input v-model="form2.newpasstwo" autocomplete="off"></el-input>
                                            </el-form-item>
                                        </el-form>
                                        <div slot="footer" class="dialog-footer">
                                            <el-button @click="forgetpassword = false">取 消</el-button>
                                            <el-button type="primary" @click="forgetpassword2(forgetpassword = false)">确 定</el-button>
                                        </div>
                                    </el-dialog>

                                    <el-dialog
                                            width="35%"
                                            title="内层 Dialog"
                                            :visible.sync="registeraccount"
                                            append-to-body>
                                        <el-form :model="form3">
                                            <el-form-item label="用户名" :label-width="formLabelWidth">
                                                <el-input v-model="form3.username" autocomplete="off"></el-input>
                                            </el-form-item>
                                            <el-form-item label="手机号" :label-width="formLabelWidth">
                                                <el-input v-model="form3.phone" autocomplete="off"></el-input>
                                            </el-form-item>
                                            <el-form-item label="密码" :label-width="formLabelWidth">
                                                <el-input v-model="form3.userpass" autocomplete="off"></el-input>
                                            </el-form-item>
                                        </el-form>
                                        <div slot="footer" class="dialog-footer">
                                            <el-button @click="registeraccount = false">取 消</el-button>
                                            <el-button type="primary" @click="registeraccount2(registeraccount = false)">确 定</el-button>
                                        </div>
                                    </el-dialog>

                                    <div slot="footer" class="dialog-footer">
                                        <el-button @click="login = false">取 消</el-button>
                                        <el-button type="primary" @click="login2(login = false)">确 定</el-button>
                                        <el-button type="primary" @click="forgetpassword = true">忘记密码</el-button>
                                        <el-button type="primary" @click="registeraccount = true">注册账号</el-button>
                                    </div>

                                </el-dialog>
                                </div>
                            </div>
                    </div>
                </div>
            </el-menu>
        </div>
        <div>
                <el-carousel type="card" :interval="5000" arrow="always" height="50" indicator-position="outside">
                    <el-carousel-item v-for="commodity in commodities" :key="commodity">
                        <img :src="'/api/' + commodity.cover" @click="$router.push('/shop/' + commodity.productNo)" class="img">
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
                                <p>封面图：</p><img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.productNo)">
                                <p>图书简介：{{commodity.content}}</p>

                            </el-aside>
                            <el-container>
                                <div class="bestseller">
                                    <span class="banyan">榜单</span>
                                    <ul v-for="bestsellers in bestseller" :key="bestsellers" >
                                        <li @click="$router.push('/shop/' + bestsellers.productNo)">{{bestsellers.bookName}}</li>
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
                             <p>封面图：</p><img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.productNo)">
                             <p>图书简介：{{commodity.content}}</p>

                         </el-aside>
                         <el-container>
                             <div class="bestseller">
                                 <span class="banyan">榜单</span>
                                 <ul v-for="bestsellers in bestseller" :key="bestsellers">
                                     <li @click="$router.push('/shop/' + bestsellers.productNo)">{{bestsellers.bookName}}</li>
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
                             <p>封面图：</p><img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.productNo)">
                             <p>图书简介：{{commodity.content}}</p>

                         </el-aside>
                         <el-container>
                             <div class="bestseller">
                                 <span class="banyan">榜单</span>
                                 <ul v-for="bestsellers in bestseller" :key="bestsellers">
                                     <li @click="$router.push('/shop/' + bestsellers.productNo)">{{bestsellers.bookName}}</li>
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
                restaurants: [],
                state2: '',
                formLabelWidth: '100px',
                dialogTableVisible: false,
                login: false,
                forgetpassword: false,
                registeraccount: false,
                user: [],
                user2:[],
                phone: "",
                commodities:[],
                girlcommodities:[],
                boycommodities:[],
                bestseller:[],
                form: {
                    phone: "",
                    userpass: "",
                },
                form2:{
                    phone: "",
                    userpass: "",
                    newpassone: "",
                    newpasstwo: "",
                },
                form3:{
                    username: "",
                    userpass: "",
                    phone: ""
                },
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
        methods:{
            login2(login = false){
                axios.get("/api/SelectByPhoneUserServlet?phone=" + this.form.phone).then(e =>{
                     this.user = e.data;
                     document.getElementById("login").style.visibility="hidden";
                });
            },
            registeraccount2(registeraccount = false){
                    axios.post("/api/AddUserServlet?username=" + this.form3.username + "&userpass=" + this.form3.userpass + "&phone=" +this.form3.phone)
            },
            forgetpassword2(forgetpassword = false){
                axios.get("/api/SelectByPhoneUserServlet?phone=" + this.form2.phone + "&userpass=" + this.form2.userpass).then(e =>{
                    this.user2 = e.data;
                    if (this.user2!=null){
                        axios.post("/api/UpdateUserpassServlet?userpass=" + this.form2.newpassone + "&phone=" + this.form2.phone)
                    }
                    else {
                        alert("错误")
                    }
                });

            },
        }
    }
</script>
<style>
    .el-menu{
        padding-bottom: 10px;
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
        padding-left: 60px;
        padding-top: 0px;
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

    .el-button{
        margin: 0px;
    }

    .cimgs{
        width: 200px;
        height: 200px;
        padding-left: 70px;
    }

    .img{
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

    .el-input{
        width: 200px;
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

    .phone{
        padding: 0;
        margin: 0;
        font-family: "Helvetica Neue";
        font-size: 25px;
    }

</style>
