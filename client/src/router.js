import VueRouter from "vue-router";
import shop from './components/Shop'
import app from "./App"
// 路由规则，返回路由对象
export default new VueRouter({
    routes: [
        {
            path: "/shop" , component: shop
        },
        {
            path: "/app", component: app
        },
    ],
    mode: 'hash'
});