<template>
        <div>
            <div >
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
    </div>
</template>

<script>
    import axios from "axios";
    export default {
        name: "shop",
        data() {
            return {
                c:[]
            },
             axios.get("/api/SelectByProductNoCommoditieServlet").then(e =>{
                this.c = e.data;
            });
        }
    };
</script>
