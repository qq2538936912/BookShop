<template>
    <div>
        <div>
        <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
            <el-menu-item index="1"><a href="#" target="_blank">首页</a></el-menu-item>
            <el-menu-item index="2"><a href="#" target="_blank">分类</a></el-menu-item>
            <el-menu-item index="3"><a href="#" target="_blank">排行</a></el-menu-item>
            <el-menu-item index="4"><a href="#" target="_blank">企业服务</a></el-menu-item>
            <el-menu-item index="5"><a href="#" target="_blank">征文大赛</a></el-menu-item>
            <el-menu-item index="6"><a href="#" target="_blank">下载</a></el-menu-item>
        <div>
            <div class="main2">
            <el-autocomplete
                    popper-class="my-autocomplete"
                    v-model="state"
                    :fetch-suggestions="querySearch"
                    placeholder="请输入内容"
                    @select="handleSelect"
                    class="main3">
                <i
                        class="el-icon-edit el-input__icon"
                        slot="suffix"
                        @click="handleIconClick">
                </i>
                <template slot-scope="{ item }">
                    <div class="name">{{ item.value }}</div>
                    <span class="addr">{{ item.address }}</span>
                </template>
            </el-autocomplete>
                <div class="login"><el-button type="primary">登录</el-button></div>

                </div>
            </div>
        </el-menu>
    </div>

        <div>
            <el-carousel :interval="3000" type="card" height="200px" >
                <el-carousel-item v-for="item in imgs" :key="item">
                   <h3><img :src="item"></h3>
                </el-carousel-item>
            </el-carousel>
        <div>
            <div>
                <el-container>
                    <el-header>出版图书</el-header>
                    <el-header>小说|励志|文学|经济管理|更多</el-header>
                    <el-container>
                        <el-aside width="200px">Aside</el-aside>
                        <el-aside width="200px">Aside</el-aside>
                        <el-aside width="200px">Aside</el-aside>
                        <el-container>
                            <el-main >Main</el-main>
                        </el-container>
                    </el-container>
                </el-container>
                </div>
            </div>
        </div>
        <div class="copyright">
            <h1>南方IT学院</h1>
            <h4>番薯小组所有</h4>
        </div>
        <div @click="$router.push('/shop')">跳转到 33 的详情页面</div>
    </div>

</template>

<script>
    import img1 from '@/assets/img/shzz.jpg'
    import img2 from '@/assets/img/ymga.jpg'
    import img3 from '@/assets/img/fcnw.jpg'
    import img4 from '@/assets/img/wgsd.jpg'
export default {
  name: 'app',
    components: {

    },
    data() {
        return {
            activeIndex: '1',
            activeIndex2: '1',
            input: "",
            imgs:[img1,img2,img3,img4],
        };
    },
    methods: {
        handleSelect(key, keyPath) {
            console.log(key, keyPath);
        }
    }
}
</script>
<style>
    .login{
        float: right;
    }

    .main2{
        padding-top: 10px;
    }

    .main3{
        padding-left: 150px;
    }

    .copyright{
        text-align: center;
    }

    .el-header, .el-footer {
        background-color: #B3C0D1;
        color: #333;
        text-align: center;
        line-height: 60px;
    }

    .el-aside {
        background-color: #D3DCE6;
        color: #333;
        text-align: center;
        line-height: 200px;
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

</style>
