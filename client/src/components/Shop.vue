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
            <el-container>
                <el-aside width="200px">Aside</el-aside>
                <el-container>
                    <el-header>Header</el-header>
                    <el-main>Main</el-main>
                    <el-footer>Footer</el-footer>
                </el-container>
            </el-container>
        </div>
            <div>
                <el-container>
                    <el-main>Main</el-main>
                    <el-main>Main</el-main>
                </el-container>
            </div>
            <div class="block">
                <el-pagination
                        layout="prev, pager, next"
                        :total="1000">
                </el-pagination>
            </div>
            <div @click="$router.back()">后退</div>
    </div>


</template>

<script>
    export default {
        name: "shop",
        components: {

        },
    }
</script>

<style scoped>

</style>