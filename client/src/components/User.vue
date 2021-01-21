<template>
    <div>

        <el-tabs :tab-position="tabPosition" style="height: 500px;">
            <el-tab-pane label="用户管理">
            <div>
                <div>
                    <div>
                        <el-tag>用户名</el-tag>
                    </div>
                    <el-input v-model="user.username" placeholder="请输入内容"></el-input>
                </div>
            <div>
                <div>
                    <el-tag>手机号</el-tag>
                </div>
                    <el-input v-model="user.phone" placeholder="请输入内容"></el-input>
                </div>
             <div>
                <div>
                    <el-tag>注册时间</el-tag>
                </div>
                    {{user.createtime}}
                </div>
                    <el-button @click="updateuser(user.userno,user.username,user.userpass,user.phone)" >修改</el-button>
                    <el-button @click="dropout">退出登录</el-button>

        </div>
            </el-tab-pane>
            <el-tab-pane label="我的购物车">
                <div><!-- v-for="c in cart" :key="c.cartNo"-->
                    <div>
                        <div>
                            <cartbook></cartbook>
<!--                            <el-tag>书名</el-tag>-->
<!--                            {{c.bookName}}-->
<!--                            <el-tag>价格</el-tag>-->
<!--                            {{c.cprice}}-->
<!--                            <el-tag>数量</el-tag>-->
<!--                            {{c.booknum}}-->
<!--                            <el-tag>注册时间</el-tag>-->
<!--                            {{c.created}}-->
                        </div>
                    </div>
                </div>
            </el-tab-pane>
            <el-tab-pane label="我的订单">
                <div v-for="o in order" :key="o.orderNo">
                        <div>
                        <el-tag>订单号</el-tag>
                        {{o.orderNo}}
                        <el-tag>书名</el-tag>
                        {{o.bookName}}
                        <el-tag>付款</el-tag>
                        {{o.payment_number}}
                        <el-tag>数量</el-tag>
                        {{o.productnum}}
                        <el-tag>价格</el-tag>
                        {{o.amount}}
                        <el-tag>状态</el-tag>
                        {{o.status}}
                        <el-tag>备注</el-tag>
                        {{o.remarks}}

                    </div>
                </div>
            </el-tab-pane>
            <el-tab-pane label="我的收货地址" >
                    <div v-for="ar in address" :key="ar.addressNo">
                        <div>
                            <el-tag>收货名</el-tag>
                        <el-input v-model="ar.consignee" placeholder="请输入内容"></el-input>
                            <el-tag>收货地址</el-tag>
                        <el-input v-model="ar.detail_address" placeholder="请输入内容"></el-input>
                            <el-tag>手机号</el-tag>
                            <el-input v-model="ar.tel" placeholder="请输入内容"></el-input>
                        <el-button @click="updateaddress(ar.addressNo,ar.consignee,ar.detail_address,ar.tel)">修改</el-button>
                        <el-button @click="deladdress(ar.addressNo)">删除</el-button>
                        </div>
                    </div>
            </el-tab-pane>
        </el-tabs>
    </div>
</template>

<script>
    import axios from "axios";
    import cartbook from "./user/CartBook"
    export default {
        name: "user",
        components: {
            cartbook
        },
        data(){
            return{
                tabPosition: 'left',
                user: [],
                cart: [],
                order: [],
                address: []
            }
        },
        mounted() {
            axios.get("/api/SelectByPhoneServlet?phone=" + this.$route.params.phone).then(e =>{
                this.user = e.data;
                axios.get("/api/SelectByUserNoServlet?userNo=" + this.user.userno).then(e =>{
                    this.cart = e.data;
                    this.cart.forEach(o =>{
                        axios.get("/api/SelectByProductNoCommoditieServlet?productNo=" + o.productNo).then(e =>{
                            o.bookName = e.data.bookName;
                        });
                    })
                });
                axios.get("/api/SelectByUserNoorderServlet?userNo=" + this.user.userno).then(e =>{
                    this.order = e.data;
                    this.order.forEach(o =>{
                        axios.get("/api/SelectByProductNoCommoditieServlet?productNo=" + o.productNo).then(e =>{
                            o.bookName = e.data.bookName;
                        });
                    })
                });
                axios.get("/api/SelectByUserNoAddressServlet?userNo=" + this.user.userno).then(e =>{
                    this.address = e.data;
                });
            });
        },
        methods:{
            deladdress(addressNo){
                axios.post("/api/DeleteAddressServlet?addressNo=" + addressNo).then(e =>{
                    alert("删除成功")
                    axios.get("/api/SelectByUserNoAddressServlet?userNo=" + this.user.userno).then(e =>{
                        this.address = e.data;
                    });
                });
            },
            updateaddress(addressNo,consignee,detail_address,tel){
                axios.post("/api/UpdateAddressServlet?addressNo=" + addressNo + "&consignee=" + consignee + "&detail_address=" + detail_address + "&tel=" + tel).then(e =>{
                    alert("修改成功")
                    axios.get("/api/SelectByUserNoAddressServlet?userNo=" + this.user.userno).then(e =>{
                        this.address = e.data;
                    });
                });
            },
            updateuser(userno,username,userpass,phone){
                axios.post("/api/UpdateUserServlet?userno=" + userno + "&username=" + username + "&userpass=" + userpass + "&phone=" + phone).then(e =>{
                    alert("修改成功")
                    axios.get("/api/SelectByPhoneServlet?phone=" + this.$route.params.phone).then(e =>{
                        this.user = e.data;
                    });
                });
            },
            dropout(){
                window.sessionStorage.setItem("user",JSON.stringify(""));
                this.$router.push('/');
            }
        }
    }
</script>

<style scoped>

</style>