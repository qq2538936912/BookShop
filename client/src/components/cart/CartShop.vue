<template>
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
</template>

<script>
    import axios from "axios";

    export default {
        name: "cartshop",
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

</style>