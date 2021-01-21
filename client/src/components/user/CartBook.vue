<template>
    <div class="d1-cart">
        <div>
            <h3>我的购物车</h3>
            <div class="tips">温馨提示：书籍购买是否成功，以最终下单结果为准哦</div>
        </div>

        <div class="cart" v-for="(c,index) in cartList" :key="c.cartNo">
            <div class="book-cart">
                <img :src="'/api'+c.cover">

            </div>
            <div class="book-name" ><h5>{{c.bookName}}</h5></div>
            <div>单价：￥{{showPirce(c.price)}}</div>
            <div>
                <el-input-number :key="index" v-model="c.booknum" @change="handleChange($event,c.cartNo)"
                                 :min="1"></el-input-number>
            </div>
            <div class="c-price">小计：<span>￥{{showPirce(c.cPrice)}}</span></div>
            <div class="btn">
                <el-button @click="$router.push('/cartinfo?cid='+c.cartNo)" size="small" type="danger">购买</el-button>
                <el-button size="small" type="warning">移除</el-button>

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'cartbook',
        data() {
            return {
                user: JSON.parse(window.sessionStorage.getItem("user")),
                cartList: [],
                bookList: [],
                price: 0
            }
        },
        methods: {
            loadCart() {
                this.$axios({
                    url: '/api/SelectByUserNoServlet?userNo=' + this.user.userno
                }).then(resp => {
                    console.log(resp)
                    if (resp) {
                        this.cartList = resp.data;
                        this.cartList.forEach(c => {
                            this.handleChange(c.booknum, c.cartNo)
                        })
                    }
                })
            },
            handleChange(value, cartNo) {
                this.cartList.forEach(c => {
                    if (c.cartNo === cartNo) {
                        c.cPrice = c.price * value
                    }
                })
            },
            showPirce(price) {
                if (!price) {
                    return ''
                }
                return price.toFixed("2")
            }

        },
        created() {
            this.loadCart()
            console.log(JSON.parse(window.sessionStorage.getItem("user")))
        }
    }
</script>

<style scoped>
    .d1-cart {
        margin: 0 auto;
        width: 1000px;
    }

    .tips {
        font-size: 14px;
        color: #999999;
    }

    .cart {
        margin-top: 20px;
        height: 100px;
        border: 1px solid #e6e6e6;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .cart img {
        margin-left: 30px;
        width: 50px;
    }
    .cart .book-name{
        width: 180px;
    }
    .cart .c-price span {
        color: red;
    }

    .btn {
        display: flex;
        margin-right: 20px;
        flex-direction: column;
    }

    .btn .el-button {
        margin-top: 3px;
    }

</style>