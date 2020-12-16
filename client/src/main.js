import Vue from 'vue';
import './plugins/axios';
import app from './App.vue';
import shop from './components/Shop'
import './plugins/element.js';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import './plugins/vue-router';
import router from './router'
Vue.use(ElementUI);

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(shop),
}).$mount('#app')
