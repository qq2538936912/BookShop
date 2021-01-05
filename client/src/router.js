import VueRouter from "vue-router";
import shop from "./components/Shop"
import main from "./components/Main"
import search from "./components/Search"
import classification from "./components/Classification"
// 路由规则，返回路由对象
export default new VueRouter({
    routes: [
        {
            path: '/shop/:productNo', component: shop
        },
        {
            path: '/main', component: main
        },
        {
            path: '/', redirect: '/main'
        },
        {
            path: '/search/:params', component: search
        },
        {
            path: '/classification', component: classification
        },
        {
            path: '/classif/:classificationNo', component: classification
        }
    ],
    mode: 'hash'
});