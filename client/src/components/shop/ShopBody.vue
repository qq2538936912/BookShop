<template>
    <!--    <el-container>-->
    <!--        <img :src="imgurl" class="cimg">-->
    <!--        <div class="commoditie">-->
    <!--            <h1 class="bookname">书名：{{commoditie.bookName}}</h1>-->
    <!--            <h3 class="author">作者：{{commoditie.author}}</h3>-->
    <!--            <h3 class="price">价格：{{commoditie.price}}</h3>-->
    <!--            <div>-->
    <!--                <el-button type="button" @click="cart = true" id="shop">加入购物车</el-button>-->
    <!--                <el-button type="button" @click="shop = true" id="shop2">购买</el-button>-->
    <!--            </div>-->
    <!--            <div class="shop">-->
    <!--                <el-dialog title="加入购物车" :visible.sync="cart">-->
    <!--                    <el-form :model="form4">-->
    <!--                        <el-form-item label="商品名称" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="form4.bookName" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                        <el-form-item label="用户名称" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="form4.name" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                        <el-form-item label="购买数量" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="form4.booknum" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                        <el-form-item label="价格" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="form4.cprice" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                        <el-form-item label="总价格" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="sumprice" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                    </el-form>-->
    <!--                    <div slot="footer" class="dialog-footer">-->
    <!--                        <el-button @click="cart = false">取 消</el-button>-->
    <!--                        <el-button type="primary" @click="cart2(cart = false)">确 定</el-button>-->
    <!--                    </div>-->

    <!--                </el-dialog>-->

    <!--                <el-dialog title="购买" :visible.sync="shop">-->
    <!--                    <el-form :model="form5">-->
    <!--                        <el-form-item label="收货人" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="form5.consignee" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                        <el-form-item label="收货详细地址" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="form5.detail_address" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                        <el-form-item label="手机号" :label-width="formLabelWidth">-->
    <!--                            <el-input v-model="form5.tel" autocomplete="off"></el-input>-->
    <!--                        </el-form-item>-->
    <!--                    </el-form>-->
    <!--                    <el-dialog-->
    <!--                            width="35%"-->
    <!--                            title="加入购物车"-->
    <!--                            :visible.sync="payment"-->
    <!--                            append-to-body>-->
    <!--                        <el-form :model="form6">-->
    <!--                            <el-form-item label="用户名" :label-width="formLabelWidth">-->
    <!--                                <el-input v-model="form6.name" autocomplete="off"></el-input>-->
    <!--                            </el-form-item>-->
    <!--                            <el-form-item label="书名" :label-width="formLabelWidth">-->
    <!--                                <el-input v-model="form6.bookName" autocomplete="off"></el-input>-->
    <!--                            </el-form-item>-->
    <!--                            <el-form-item label="收货地址" :label-width="formLabelWidth">-->
    <!--                                <el-input v-model="form5.detail_address" autocomplete="off"></el-input>-->
    <!--                            </el-form-item>-->
    <!--                            <el-form-item label="数量" :label-width="formLabelWidth">-->
    <!--                                <el-input v-model="form6.productnum" autocomplete="off"></el-input>-->
    <!--                            </el-form-item>-->
    <!--                            <el-form-item label="单价" :label-width="formLabelWidth">-->
    <!--                                <el-input v-model="form6.amount" autocomplete="off"></el-input>-->
    <!--                            </el-form-item>-->
    <!--                            <el-form-item label="总价" :label-width="formLabelWidth">-->
    <!--                                <el-input v-model="sumprice2" autocomplete="off"></el-input>-->
    <!--                            </el-form-item>-->
    <!--                            <el-form-item label="备注" :label-width="formLabelWidth">-->
    <!--                                <el-input v-model="form6.remarks" autocomplete="off"></el-input>-->
    <!--                            </el-form-item>-->
    <!--                        </el-form>-->
    <!--                        <div slot="footer" class="dialog-footer">-->
    <!--                            <el-button @click="payment = false">取 消</el-button>-->
    <!--                            <el-button type="primary" @click="payment2(payment = false)">确 定</el-button>-->
    <!--                        </div>-->
    <!--                    </el-dialog>-->
    <!--                    <div slot="footer" class="dialog-footer">-->
    <!--                        <el-button @click="shop = false">取 消</el-button>-->
    <!--                        <el-button type="primary" @click="shop2(shop = false , payment = true)">确 定</el-button>-->
    <!--                    </div>-->

    <!--                </el-dialog>-->
    <!--            </div>-->
    <!--            <p class="content">{{commoditie.content}}</p>-->
    <!--        </div>-->
    <!--    </el-container>-->
    <div class="main">
        <el-row>
            <el-col :span="19">
                <div class="grid-content bg-purple">
                    <div class="div1">
                        <div class="wen">
                            <div class="tupian">
                                <img :src="imgurl" class="cimg">
                            </div>
                            <div class="nei">
                                <h1>{{commoditie.bookName}}</h1>
                                <div class="nei1">
                                    <span>作者：{{commoditie.author}}</span>
                                    <span>价格：{{commoditie.price}}</span>
                                </div>
                                <div class="nei3">
                                    <el-collapse accordion>
                                        <el-collapse-item>
                                            <template slot="title">
                                                {{commoditie.content}}
                                            </template>
                                            <div></div>
                                        </el-collapse-item>
                                    </el-collapse>
                                </div>
                                <div class="nei4">
                                    <el-button class="bg" @click="cart = true">加入购物车</el-button>
                                    <el-button class="bg2" @click="shop = true">购买</el-button>

                                                        <div class="shop">
                                                            <el-dialog title="加入购物车" :visible.sync="cart">
                                                                <el-form :model="form4">
                                                                    <el-form-item label="商品名称" :label-width="formLabelWidth">
                                                                        <el-input v-model="form4.bookName" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                    <el-form-item label="用户名称" :label-width="formLabelWidth">
                                                                        <el-input v-model="form4.name" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                    <el-form-item label="购买数量" :label-width="formLabelWidth">
                                                                        <el-input v-model="form4.booknum" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                    <el-form-item label="价格" :label-width="formLabelWidth">
                                                                        <el-input v-model="form4.cprice" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                    <el-form-item label="总价格" :label-width="formLabelWidth">
                                                                        <el-input v-model="sumprice" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                </el-form>
                                                                <div slot="footer" class="dialog-footer">
                                                                    <el-button @click="cart = false">取 消</el-button>
                                                                    <el-button type="primary" @click="cart2(cart = false)">确 定</el-button>
                                                                </div>

                                                            </el-dialog>

                                                            <el-dialog title="购买" :visible.sync="shop">
                                                                <el-form :model="form5">
                                                                    <el-form-item label="收货人" :label-width="formLabelWidth">
                                                                        <el-input v-model="form5.consignee" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                    <el-form-item label="收货详细地址" :label-width="formLabelWidth">
                                                                        <el-input v-model="form5.detail_address" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                    <el-form-item label="手机号" :label-width="formLabelWidth">
                                                                        <el-input v-model="form5.tel" autocomplete="off"></el-input>
                                                                    </el-form-item>
                                                                </el-form>
                                                                <el-dialog
                                                                        width="35%"
                                                                        title="加入购物车"
                                                                        :visible.sync="payment"
                                                                        append-to-body>
                                                                    <el-form :model="form6">
                                                                        <el-form-item label="用户名" :label-width="formLabelWidth">
                                                                            <el-input v-model="form6.name" autocomplete="off"></el-input>
                                                                        </el-form-item>
                                                                        <el-form-item label="书名" :label-width="formLabelWidth">
                                                                            <el-input v-model="form6.bookName" autocomplete="off"></el-input>
                                                                        </el-form-item>
                                                                        <el-form-item label="收货地址" :label-width="formLabelWidth">
                                                                            <el-input v-model="form5.detail_address" autocomplete="off"></el-input>
                                                                        </el-form-item>
                                                                        <el-form-item label="数量" :label-width="formLabelWidth">
                                                                            <el-input v-model="form6.productnum" autocomplete="off"></el-input>
                                                                        </el-form-item>
                                                                        <el-form-item label="单价" :label-width="formLabelWidth">
                                                                            <el-input v-model="form6.amount" autocomplete="off"></el-input>
                                                                        </el-form-item>
                                                                        <el-form-item label="总价" :label-width="formLabelWidth">
                                                                            <el-input v-model="sumprice2" autocomplete="off"></el-input>
                                                                        </el-form-item>
                                                                        <el-form-item label="备注" :label-width="formLabelWidth">
                                                                            <el-input v-model="form6.remarks" autocomplete="off"></el-input>
                                                                        </el-form-item>
                                                                    </el-form>
                                                                    <div slot="footer" class="dialog-footer">
                                                                        <el-button @click="payment = false">取 消</el-button>
                                                                        <el-button type="primary" @click="payment2(payment = false)">确 定</el-button>
                                                                    </div>
                                                                </el-dialog>
                                                                <div slot="footer" class="dialog-footer">
                                                                    <el-button @click="shop = false">取 消</el-button>
                                                                    <el-button type="primary" @click="shop2(shop = false , payment = true)">确 定</el-button>
                                                                </div>

                                                            </el-dialog>
                                                        </div>
                                    <el-dropdown>

                                        <el-dropdown-menu slot="dropdown">
                                            <el-dropdown-item class="tubiao">
                                                <div class="erwei">
                                                </div>
                                            </el-dropdown-item>
                                        </el-dropdown-menu>
                                    </el-dropdown>
                                    <el-dropdown>
                                        <el-dropdown-menu slot="dropdown">
                                            <el-dropdown-item class="tubiao">
                                                <div class="erwei1">

                                                </div>
                                            </el-dropdown-item>
                                            <el-dropdown-item class="tubiao">
                                                <div class="erwei2">

                                                </div>
                                            </el-dropdown-item>
                                            <el-dropdown-item class="tubiao">
                                                <div class="erwei3">

                                                </div>
                                            </el-dropdown-item>
                                            <el-dropdown-item class="tubiao">
                                                <div class="erwei4">

                                                </div>
                                            </el-dropdown-item>
                                        </el-dropdown-menu>
                                    </el-dropdown>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </el-col>
            <el-col :span="5">
                <div class="grid-content bg-purple-light">
                    <div class="dao">
                        <span class="h3">热门榜</span>
                        <span class="spans">更多></span>
                    </div>
                    <div class="geng">
                        <div class="shu1">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu2">2</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu3">3</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>



                    <div class="dao3">
                        <span class="h3">畅销榜</span>
                        <span class="spans">更多></span>
                    </div>
                    <div class="geng">
                        <div class="shu1">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu2">2</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu3">3</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>


                    <div class="dao3">
                        <span class="h3">畅销榜</span>
                        <span class="spans">更多></span>
                    </div>
                    <div class="geng">
                        <div class="shu1">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu2">2</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu3">3</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>
                    <div class="geng">
                        <div class="shu">1</div>
                        <div class="geng2">
                            邪王追妻
                        </div>
                        <div class="geng3">穿越</div>
                    </div>

                </div>
            </el-col>
        </el-row>
        <div class="didu">

        </div>
    </div>


</template>

<script>
    import axios from "axios";

    export default {
        name: "shopbody",
        data() {
            return {
                user:[],
                user2:[],
                order:[],
                order2:[],
                address:[],
                user3:{
                    userno: 0,
                    username: "",
                    userpass: "",
                    phone: "",
                    state: 0,
                    createtime: ""
                },
                cart: false,
                payment: false,
                commoditie:[],
                imgurl: "",
                shop: false,
                form4: {
                    name: "",
                    productNo: 0,
                    userNo: 0,
                    booknum: 1,
                    cprice: 0,
                    bookName: "",
                    sumprice: 0
                },
                form5:{
                    consignee: '',
                    detail_address: '',
                    tel: ''
                },
                form6:{
                    userNo: 0,
                    bookName: '',
                    name: '',
                    productNo: 0,
                    addressNo: 0,
                    payment_number: 0,
                    productnum: 0,
                    amount: 0,
                    remarks: " ",
                    wechat: 0,
                    alipay: 1
                },
            }
        },
        mounted() {
            axios.get("/api/SelectByProductNoCommoditieServlet?productNo=" + this.$route.params.productNo).then(e =>{
                this.commoditie = e.data;
                this.imgurl = "/api/" + e.data.cover;
                this.form6.amount = e.data.price
                this.form6.productnum = this.form4.booknum
                this.form6.bookName = e.data.bookName;
                this.form6.productNo = this.$route.params.productNo;
                this.form4.cprice = e.data.price;
                this.form4.sumprice = this.form4.cprice;
                this.form4.productNo = e.data.productNo;
                this.form4.bookName = e.data.bookName;
            });
            if (this.user){
                document.getElementById("login").style.visibility="hidden";
            }
        },
        methods:{
            shop2(shop,payment){
                if (this.user===null){
                    alert("请您先登录");
                    return;
                }
                else {
                    axios.post("/api/AddAddressServlet?userno=" + this.form4.userNo + "&consignee=" + this.form5.consignee+"&detail_address=" + this.form5.detail_address + "&tel=" + this.form5.tel)
                }
            },
            cart2(cart = false){
                if (this.user===null) {
                    alert("请您先登录");
                    return cart = true;
                }
                else {
                    axios.post("/api/AddCartServlet?productNo=" + this.form4.productNo + "&userNo=" + this.form4.userNo + "&booknum=" + this.form4.booknum + "&cprice=" + this.sumprice).then(e =>{
                        alert("添加成功");
                    });
                }
            },
            payment2(){
                axios.post("/api/AddOrderServlet?userNo=" + this.form6.userNo + "&productNo=" + this.form6.productNo + "&addressNo=" + this.form6.addressNo + "&payment_number=" + this.form6.payment_number + "&productnum=" + this.form6.productnum + "&amount=" + this.sumprice2 + "&remarks=" + this.form6.remarks)
            },
        },
        created() {
            this.user = JSON.parse(window.sessionStorage.getItem("user"));
            this.user3 = JSON.parse(window.sessionStorage.getItem("user"));
            this.form4.name = this.user.username;
            this.form4.userNo = this.user3.userno;
            this.form5.consignee = this.user.username;
            this.form5.tel = this.user.phone;
            this.form6.userNo = this.user3.userno;
            this.form6.name = this.user.username;
            axios.get("/api/SelectByUserNoAddressServlet?userNo=" + this.user.userno).then(e =>{
                this.order = e.data;
            });
            axios.get("/api/SelectByUserNoorderServlet?userNo=" + this.user.userno).then(e =>{
                this.address = e.data;
            });
            axios.get("/api/SelectByUserNoAddressServlet?userNo=" + this.user.userno).then(e =>{
                this.order2 = e.data;
                this.form5.detail_address = this.order2[0].detail_address;
                this.form6.addressNo = this.order2[0].addressNo
            });
        },
        computed:{
            sumprice(){
                return this.form4.booknum * this.form4.cprice
            },
            sumprice2(){
                return this.form6.productnum * this.form6.amount
            }
        }
    }
</script>

<style scoped>

    .main {
        margin-left: 30px;
        margin-right: 30px;
        margin-top: 20px;
        background-color: #F6F6F6;
    }
    .dibu {
        float:left;

        background-size: 100% 300px;
        width: 1000px;
        height: 300px;
        border: 2px solid red;
        /* border-top: 1px solid black; */
    }

    .el-row {
        margin-bottom: 20px;

    }

    .el-col {
        border-radius: 4px;
    }

    /* 左侧 */
    .bg-purple {}

    /* 第一个div */
    .div1 {
        float: left;
        margin-top: 52px;
    }

    .wen {
        border: 1px solid gray;
        width: 100%;
        height: 300px;
        padding-top: 15px;
        padding-bottom: 15px;
    }

    .tupian {

        width: 220px;
        height: 300px;
        float: left;
        margin-right: 15px;
        background-size: 220px 300px;
    }

    .nei {
        float: left;
        width: 700px;
        height: 260px;
    }

    .nei1 {
        margin-top: 10px;
    }

    .nei2 {
        margin-top: 10px;
    }

    .nei3 {
        margin-top: 10px;
        color: black;

    }

    .nie4 {
        margin-top: 10px;
        flaot: left;
    }

    .tubiao {
        float: left;
    }

    .tubiao2 {
        size: 18px;
        margin-left: 10px;
    }

    .tubiao2:hover {
        color: #FF4500;
    }


    .bg {
        color: beige;

        width: 130px;
        background-color: orangered;
        border: 2px solid orangered;
        margin-top: 10px;
        margin-right: 10px;
        height: 30px;

    }

    .bg2 {


        width: 130px;
        margin-right: 10px;
        height: 30px;
    }

    /* 右侧 */
    .bg-purple-light {
        margin-left: 20px;
    }

    .grid-content {
        border-radius: 4px;
        min-height: 36px;
    }

    .wen4 {

        width: 100%;
        height: 200px;
        padding-top: 15px;
        padding-bottom: 15px;
    }

    .wenzi {

        float: left;
        height: 200px;
        margin-right: 10px;
        width: 140px;
    }
    .wenzi:hover{
        color:orangered;
    }
    .wenzi2 {
        background-size: 150px 180px;
        height: 180px;
        width: 140px;
        margin-bottom:10px;

    }




    .buttom {
        border: 1px solid gray;
        text-align: center;
        float: left;
        width: 100%;
        height: 30px;
        padding-top: 10px;
    }

    .buttom:hover {
        color: #279FCF;
        text-decoration: underline;
    }

    .row-bg {
        padding: 10px 0;
        background-color: #f9fafc;
    }


    .div2 {
        float: left;
        width: 100%;
    }

    .div3 {
        float: left;
        width: 100%;
    }

    .div4 {
        float: left;
        width: 100%;

    }

    .wen3 {
        border: 1px solid gray;
        width: 100%;
        height: 400px;
        padding-top: 15px;
        padding-bottom: 15px;
    }


    .left {
        width: 48%;

        float: left;
    }

    .left span:hover {
        color: #FF4500;
        text-decoration: underline;
    }

    .right span:hover {
        color: #FF4500;
        text-decoration: underline;
    }

    .left .di span {

        margin-top: 10px;


    }
    .left .di {
        width: 80%;
        margin-bottom: 10px;
        float: left;

    }


    .right {
        width: 48%;
        float: left;

    }
    .right .di {
        width: 80%;
        float: left;
        margin-bottom: 10px;

    }
    .wen2 {
        border: 1px solid gray;
        width: 100%;
        height: 80px;
        padding-top: 15px;
        padding-bottom: 15px;
    }

    .zhang {
        margin-left: 20px;
        margin-right: 20px;

        width: 270px;
        height: 30px;
        float: left;
        margin-bottom: 10px;
    }

    .zhang1 {
        float: left;
        margin-right: 9px;

    }

    .zhang1:hover {
        color: #FF4500;
        text-decoration: underline;
    }

    .zhang2 {
        float: right;
        margin-right: 2px;
    }


    .erwei {

        background-size: 100px 100px;
        width: 100px;
        height: 100px;
    }

    .erwei1 {

        background-size: 30px 30px;
        width: 30px;
        height: 30px;
    }

    .erwei2 {

        background-size: 30px 30px;
        width: 30px;
        height: 30px;
    }

    .erwei3 {

        background-size: 26px 26px;
        width: 26px;
        height: 26px;
    }

    .erwei4 {

        background-size: 30px 30px;
        width: 30px;
        height: 30px;
    }



    span {
        margin-right: 40px;
        color: grey;
    }

    /* 右侧 */
    /* // 头部 */
    .h3 {
        float: left;
        font-size: 20px;



    }

    .spans {
        float: right;
        margin-right: 2px;
        font-size: 12px;
        margin-top: 7px;


    }
    .spans2 {
        float: right;
        margin-right: 2px;
        font-size: 12px;
        margin-top: 7px;

        color: #FF4500;

    }

    .dao1 {
        margin-bottom: 5px;
        color: #808080;
        padding-top: 10px;
        height: 23px;


    }

    .dao {

        border-bottom: 1px solid gray;
        height: 33px;


    }

    .dao3 {
        margin-top: 40px;
        border-bottom: 1px solid gray;
        height: 33px;


    }

    .geng {
        margin-top: 10px;
        color: gray;
        border-bottom: 1px solid gainsboro;
        height: 35px;
        flaot: left;
        width: 240px;
        text-align: center;
    }
    .geng:hover{
        color:#FF4500;
    }
    .shu1 {
        width: 20px;
        background: red;
        border-radius: 50%;
        text-align: center;
        color: #F6F6F6;
        text-align: center;
        float: left;
        margin-right: 10px;
        margin-left: 10px;
    }

    .shu2 {
        width: 20px;
        background: orangered;
        border-radius: 50%;
        text-align: center;
        color: #F6F6F6;
        text-align: center;
        float: left;
        margin-right: 10px;
        margin-left: 10px;
    }

    .shu3 {
        width: 20px;
        background: orange;
        border-radius: 50%;
        text-align: center;
        color: #F6F6F6;
        text-align: center;
        float: left;
        margin-right: 10px;
        margin-left: 10px;
    }

    .shu {
        width: 20px;
        background: gainsboro;
        border-radius: 50%;
        text-align: center;
        color: #F6F6F6;
        text-align: center;
        float: left;
        margin-right: 10px;
        margin-left: 10px;
    }

    .geng2 {
        float: left;

    }

    .geng3 {
        float: right;
        margin-right: 2px;
        font-size: 12px;
        margin-top: 3px;
    }
    

</style>