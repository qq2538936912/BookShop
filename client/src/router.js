import VueRouter from "vue-router";
import shop from "./components/Shop"
import main from "./components/Main"
// 路由规则，返回路由对象
export default new VueRouter({
    routes: [
        {
            path: '/shop/:id', component: shop
        },
        {
            path: '/main', component: main
        }
    ],
    mode: 'hash'
});