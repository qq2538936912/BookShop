<template>
    <header>
        <div class="container clear">
            <div class="fixed">
                <div>
                    <el-menu class="el-menu-demo" mode="horizontal">
                        <el-menu-item @click="$router.push('/')">首页</el-menu-item>
                        <el-menu-item @click="$router.push('/classification/1')">分类</el-menu-item>
                        <el-menu-item >书库</el-menu-item>
                        <el-menu-item>排行</el-menu-item>
                        <el-menu-item>漫画</el-menu-item>
                        <el-menu-item>包月</el-menu-item>
                    </el-menu>
                    <el-autocomplete placeholder="请输入内容"  popper-class="my-autocomplete" v-model="input">
                        <i :class="{change:bol}" class="el-icon-search el-input__icon" slot="suffix"></i>
                        <template slot-scope="{item}">
                            <div class="name">{{ item.value }}</div>
                            <span class="addr">{{ item.address }}</span>
                        </template>
                    </el-autocomplete>
                    <el-button @click="$router.push('/search/' + input)" type="primary">搜索</el-button>
                    <div class="info">
					<span class="span2">
                                 <div class="phone" v-if="this.user">
                                     <span @click="$router.push('/user/' + user.phone)">{{user.phone}}</span>
                                 </div>
                                <span @click="login = true" id="login">登录</span>
                                <el-dialog :visible.sync="login" title="登录">
                                    <el-form :model="form">
                                        <el-form-item :label-width="formLabelWidth" label="手机号">
                                            <el-input autocomplete="off" v-model="form.phone"></el-input>
                                        </el-form-item>
                                        <el-form-item :label-width="formLabelWidth" label="密码">
                                            <el-input autocomplete="off" v-model="form.userpass"></el-input>
                                        </el-form-item>
                                    </el-form>
                                    <el-dialog
                                            :visible.sync="forgetpassword"
                                            append-to-body
                                            title="忘记密码"
                                            width="35%">
                                        <el-form :model="form2">
                                            <el-form-item :label-width="formLabelWidth" label="手机号">
                                                <el-input autocomplete="off" v-model="form2.phone"></el-input>
                                            </el-form-item>
                                            <el-form-item :label-width="formLabelWidth" label="旧密码">
                                                <el-input autocomplete="off" v-model="form2.userpass"></el-input>
                                            </el-form-item>
                                            <el-form-item :label-width="formLabelWidth" label="新密码">
                                                <el-input autocomplete="off" v-model="form2.newpassone"></el-input>
                                            </el-form-item>
                                            <el-form-item :label-width="formLabelWidth" label="确认新密码">
                                                <el-input autocomplete="off" v-model="form2.newpasstwo"></el-input>
                                            </el-form-item>
                                        </el-form>
                                        <div class="dialog-footer" slot="footer">
                                            <el-button @click="forgetpassword = false">取 消</el-button>
                                            <el-button @click="forgetpassword2(forgetpassword = false)" type="primary">确 定</el-button>
                                        </div>
                                    </el-dialog>

                                    <el-dialog
                                            :visible.sync="registeraccount"
                                            append-to-body
                                            title="注册"
                                            width="35%">
                                        <el-form :model="form3">
                                            <el-form-item :label-width="formLabelWidth" label="用户名">
                                                <el-input autocomplete="off" v-model="form3.username"></el-input>
                                            </el-form-item>
                                            <el-form-item :label-width="formLabelWidth" label="手机号">
                                                <el-input autocomplete="off" v-model="form3.phone"></el-input>
                                            </el-form-item>
                                            <el-form-item :label-width="formLabelWidth" label="密码">
                                                <el-input autocomplete="off" v-model="form3.userpass"></el-input>
                                            </el-form-item>
                                        </el-form>
                                        <div class="dialog-footer" slot="footer">
                                            <el-button @click="registeraccount = false">取 消</el-button>
                                            <el-button @click="registeraccount2(registeraccount = false)" type="primary">确 定</el-button>
                                        </div>
                                    </el-dialog>
                                    <div class="dialog-footer" slot="footer">
                                        <el-button @click="forgetpassword = true" type="primary">忘记密码</el-button>
                                        <el-button @click="registeraccount = true" type="primary">注册账号</el-button>
                                        <el-button @click="login = false">取 消</el-button>
                                        <el-button @click="login2(login = false)" type="primary">确 定</el-button>
                                    </div>
                                </el-dialog>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </header>
</template>

<script>
    import axios from "axios";
    export default {
        name: "login",
        data() {
            return {
                user: [],
                input: "",
                user2:[],
                phone: "",
                formLabelWidth: '100px',
                dialogTableVisible: false,
                login: false,
                forgetpassword: false,
                registeraccount: false,
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
            }
        },
        mounted(){
            if (this.user){
                document.getElementById("login").style.visibility="hidden";
            }
            this.user = JSON.parse(window.sessionStorage.getItem("user"));
            if (this.user){
                document.getElementById("login").style.visibility="hidden";
            }
        },
        created() {
            this.user = JSON.parse(window.sessionStorage.getItem("user"));
        },
        methods:{
            login2(login = false){
                axios.get("/api/SelectByPhoneUserServlet?phone=" + this.form.phone + "&userpass=" + this.form.userpass).then(e =>{
                    this.user = e.data;
                    if (this.user===null){
                        alert("账号或者密码错误");
                    }
                    else {
                        document.getElementById("login").style.visibility="hidden";
                        window.sessionStorage.setItem("user",JSON.stringify(this.user));
                    }
                });
            },
            registeraccount2(registeraccount = false){
                if (this.form3.username===""||this.form3.userpass===""||this.form3.phone===""){
                    alert("有空值");
                    return;
                }
                else {
                    axios.post("/api/AddUserServlet?username=" + this.form3.username + "&userpass=" + this.form3.userpass + "&phone=" +this.form3.phone)
                }
            },
            forgetpassword2(forgetpassword = false) {
                if (this.form2.newpasstwo === "" || this.form2.userpass === "" || this.form2.phone === "" || this.form2.newpassone === "") {
                    alert("有空值");
                    return;
                } else {
                    axios.get("/api/SelectByPhoneUserServlet?phone=" + this.form2.phone + "&userpass=" + this.form2.userpass).then(e => {
                        this.user2 = e.data;
                        if (this.user2 !== null) {
                            axios.post("/api/UpdateUserpassServlet?userpass=" + this.form2.newpassone + "&phone=" + this.form2.phone)
                        } else {
                            alert("错误");
                        }
                    });
                }
            }
         },
    }
</script>
<style lang="scss" scoped>
    @import "../../style/nav";
    .info {
        float: right;
        padding: 17px 25px 15px 0;
        width: 90px;
    }

    .span2:hover {
        color: blue;
    }

    .el-menu::after,
    .el-menu::before {
        display: block !important;
    }

    .pic {
        margin-top: 10px;
        width: 100px;
        height: 100px;
        margin-left: 20px;
        margin-right: 50px;
    }

    .span1 {
        text-align: center;
        padding: 10px 10px 10px 10px;
    }
    .el-input{
        width: 200px;
    }
</style>
