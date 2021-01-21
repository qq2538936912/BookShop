<template>
	<div class="main">
		<div id="div1">
			<el-row>
				<el-col :span="5"><div class="grid-content bg-purple">
					<h2>老祖宗她又美又飒</h2>
					<p class="p2">[种田] 农女福肺名动天下</p>
					<p class="p2">[穿越] 小阁老</p>
					<p class="p2">[异能] 全能千金</p>
					<p class="p2">[穿越] 小阁老</p>
					<p class="p2">[异能] 全能千金</p>
					<p>[东方] 白骨大圣</p>

					<p>[世家] 少夫人又败家了</p>
					<p>[世家] 少夫人又败家了</p>
					<p class="p2" >[都市] 她被大佬盯上了</p>
				</div></el-col>
				<el-col :span="14"><div class="grid-content bg-purple-light">
					<div class="block">
						<BookCarousel></BookCarousel>
					</div>
				</div></el-col>
				<el-col :span="5"><div class="grid-content bg-purple2">
					<h2>老祖宗她又美又飒</h2>
					<p class="p2">[种田] 农女福肺名动天下</p>
					<p class="p2">[穿越] 小阁老</p>
					<p class="p2">[异能] 全能千金</p>
					<p class="p2">[穿越] 小阁老</p>
					<p class="p2">[异能] 全能千金</p>
					<p>[东方] 白骨大圣</p>

					<p>[世家] 少夫人又败家了</p>
					<p>[世家] 少夫人又败家了</p>
					<p class="p2">[都市] 她被大佬盯上了</p>
				</div></el-col>
			</el-row>
		</div>
		<div id="div2">
			<el-row>
				<el-col :span="19"><div class="grid-content bg-purple">
					<div class="dao">
						<span class="h3">小编强推</span>
						<span class="spans">更多热门></span>
					</div>

					<div class="dao3" v-for="commodity in commodities" :key="commodity.productNo">
						<div class="tup">
							<img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.productNo)">
						</div>
						<div>
							{{commodity.bookName}}
						</div>
					</div>

				</div></el-col>
				<el-col :span="5"><div class="grid-content bg-purple-light">
					<div class="dao">
						<span class="h3">热门榜</span>
						<span class="spans">更多></span>
					</div>
					<div class="you" v-for="(bs,index) in bestseller" :key="bs.productNo" >
						<div class="shape">{{index+1}}</div>
						<div class="you2" @click="$router.push('/shop/' + bs.productNo)">
							{{bs.bookName}}
						</div>

					</div>

				</div></el-col>
			</el-row>
		</div>
		<div id="div3">
			<el-row>
				<el-col :span="19"><div class="grid-content bg-purple">
					<div class="dao">
						<span class="h3">男生频道</span>
						<span class="spans">免费专区></span>
					</div>

					<div class="dao3" v-for="commodity in boycommodities" :key="commodity.productNo">
						<div class="tup">
							<img :src="'/api/' + commodity.cover" class="cimgs" @click="$router.push('/shop/' + commodity.productNo)">
						</div>
						<div>
							{{commodity.bookName}}
						</div>
					</div>

				</div></el-col>
				<el-col :span="5"><div class="grid-content bg-purple-light">
					<div class="dao">
						<span class="h3">畅销榜</span>
						<span class="spans">更多></span>
					</div>
					<div class="you" v-for="(btwo,index) in bestseller2" :key="btwo.productNo">
						<div class="shape1">{{index+1}}</div>
						<div class="you2" @click="$router.push('/shop/' + btwo.productNo)">
							{{btwo.bookName}}
						</div>

					</div>

				</div></el-col>
			</el-row>
		</div>

		<div id="div4">
			<el-row>
				<el-col :span="19"><div class="grid-content bg-purple">
					<div class="dao">
						<span class="h3">女生频道</span>
						<span class="spans">免费专区></span>
					</div>

					<div class="dao3" v-for="girlcommodity in girlcommodities" :key="girlcommodity.productNo">
						<div class="tup">
							<img :src="'/api/' + girlcommodity.cover"  @click="$router.push('/shop/' + girlcommodity.productNo)"  >
						</div>
						<div>
							{{girlcommodity.bookName}}
						</div>
					</div>

				</div></el-col>
				<el-col :span="5"><div class="grid-content bg-purple-light">
					<div class="dao" >
						<span class="h3">畅销榜</span>
						<span class="spans">更多></span>
					</div>
					<div class="you" v-for="(bstwo,index) in bestseller3" :key="bstwo.productNo">
						<div class="shape1">{{index+1}}</div>
						<div class="you2" @click="$router.push('/shop/' + bstwo.productNo)">
							{{bstwo.bookName}}
						</div>

					</div>

				</div></el-col>
			</el-row>
		</div>
	</div>

</template>

<script>
	import BookCarousel from "./BookCarousel"
	import axios from "axios";
	export default {
		name: "index",
		components: {
			BookCarousel
		},
		data() {
			return {
				restaurants: [],
				commodities:[],
				girlcommodities:[],
				boycommodities:[],
				bestseller:[],
				bestseller2:[],
				bestseller3:[],
				name:[],
				class3:
						[
							{
								name: '现代言情',
								classificationNo: 3
							},
							{
								name: '古代言情',
								classificationNo: 3
							},
							{
								name: '幻想言情',
								classificationNo: 3
							},
							{
								name:'青春校园',
								classificationNo: 3
							}
						],
				class2:[
					{
						name:'玄幻',
						classificationNo: 2
					},
					{
						name:'奇幻',
						classificationNo: 2
					},
					{
						name:'武侠',
						classificationNo: 2
					},
				],
				class1: [
					{
						name:'励志',
						classificationNo: 1
					},
					{
						name:'文学',
						classificationNo: 1
					},
				],
			};
		},
		mounted(){
			axios.get("/api/SelectRandomCommoditieServlet").then(e =>{
				this.commodities = e.data;
			});
			axios.get("/api/SelectGirlCommoditieServlet").then(e =>{
				this.girlcommodities = e.data;
			});
			axios.get("/api/SelectBoyCommoditieServlet").then(e =>{
				this.boycommodities = e.data;
			});
			axios.get("/api/SelectBestsellerCommoditieServlet").then(e =>{
				this.bestseller = e.data;
			});
			axios.get("/api/SelectBestsellerCommoditie2Servlet").then(e =>{
				this.bestseller2 = e.data;
			});
			axios.get("/api/SelectBestsellerCommoditie3Servlet").then(e =>{
				this.bestseller3 = e.data;
			});
			if (this.user){
				document.getElementById("login").style.visibility="hidden";
			}
			this.user = JSON.parse(window.sessionStorage.getItem("user"));
			if (this.user){
				document.getElementById("login").style.visibility="hidden";
			}
		},
		created() {
			this.user3 = JSON.parse(window.sessionStorage.getItem("user"));
			this.form4.userNo = this.user3.userno;
		},
		methods:{

		},
	}
</script>

<style lang="scss" scoped>
	.main {
		margin-left:20px;
		margin-right:20px;
		padding-top:70px;
	}

	#div1{
		height:300px;
		// div1中间图片
		.el-carousel__item h3 {
			color: #475669;
			font-size: 14px;
			opacity: 0.75;
			height: 300px;
			margin: 0;
		}

		.el-carousel__item:nth-child(2n) {
			background-size:800px 300px;
		}

		.el-carousel__item:nth-child(2n+1) {
			background-size:800px 300px;
		}
		.el-carousel__item:nth-child(2n+2) {
			background-size:800px 300px;
		}
		.el-carousel__item:nth-child(2n+3) {
			background-size:800px 300px;
		}
		// div1格式

		.el-row {

			margin-bottom: 20px;
			&:last-child {
				margin-bottom: 0;
			}
		}
		.el-col {
			border-radius: 4px;
		}
		h2{
			text-align: center;
			padding-top:15px;
			padding-bottom: 10px;
		}
		.p2{
			color:orangered;
			padding-bottom: 3px;
		}
		p{
			margin-left:15px;
			margin-top:15px;
			margin-bottom: 15px;

		}

		.bg-purple-dark {

		}
		// div1右侧
		.bg-purple2 {
			margin-left:10px;
			box-shadow: 0 1px 3px rgba(18, 18, 18, 0.1);
			background-color: #F6F6F6;


		}

		// div1左侧
		.bg-purple {
			margin-right:10px;
			box-shadow: 0 1px 3px rgba(18, 18, 18, 0.1);

			background-color: #F6F6F6;

		}
		//div1中间
		.bg-purple-light {
			box-shadow: 0 1px 3px rgba(18, 18, 18, 0.1);


		}
		.grid-content {
			border-radius: 4px;
			min-height: 300px;
		}

		.row-bg {
			padding: 10px 0;

		}
	}

	#div2{
		height:470px;
		margin-top:20px;
		// 头部
		.dao{
			flaot:left;
			border-bottom: 1px solid gray;
			height:33px;
			margin-top:20px;
		}
		// 右侧内容
		.you{
			margin-top:10px;
			color:gray;
			border-bottom:1px solid gainsboro;
			height:35px;
			text-align: center;
		}
		.shape1 {
			width:20px;
			background: red;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape2 {
			width:20px;
			background: orangered;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape3 {
			width:20px;
			background: orange;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape {
			width:20px;
			background: gainsboro;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.you2{
			float:left;
		}
		.you3{
			float:right;
			margin-right:2px;
			font-size:12px;
			margin-top:3px;
		}
		// 图片
		.dao3{
			float:left;

			width:140px;
			height:200px;
			margin-right:20px;
			margin-top:10px;


		}
		.tup{
			height:180px;
			float:left;
			background-size:140px 180px;

		}
		.tup img{
			width:140px;
			height:180px;
		}
		.h3{
			flaot:left;
			font-size:20px;

		}
		.spans{
			float:right;
			font-size:12px;
			margin-top:7px;
			color:gray;
		}
		.el-row {
			margin-bottom: 20px;
			&:last-child {
				margin-bottom: 0;
			}
		}
		.el-col {
			border-radius: 4px;
		}
		.bg-purple-dark {

		}
		// div2左侧
		.bg-purple {

		}
		// div2右侧
		.bg-purple-light {
			margin-left:20px;

		}
		.grid-content {
			border-radius: 4px;
			min-height: 470px;
		}
		.row-bg {
			padding: 10px 0;
			background-color: #f9fafc;
		}
	}

	#div3{
		height:470px;
		margin-top:20px;
		// 头部
		.dao{
			flaot:left;
			border-bottom: 1px solid gray;
			height:33px;
			margin-top:10px;

		}
		// 右侧内容
		.you{
			margin-top:10px;
			color:gray;
			border-bottom:1px solid gainsboro;
			height:35px;
			text-align: center;
		}
		.shape1 {
			width:20px;
			background: red;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape2 {
			width:20px;
			background: orangered;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape3 {
			width:20px;
			background: orange;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape {
			width:20px;
			background: gainsboro;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.you2{
			float:left;
		}
		.you3{
			float:right;
			margin-right:2px;
			font-size:12px;
			margin-top:3px;
		}
		// 图片
		.dao3{
			float:left;

			width:140px;
			height:200px;
			margin-right:20px;
			margin-top:10px;
			.tup{
				height:180px;

				background-size:140px 180px;
				border:1px solid black;
			}
			.tup img{
				width:140px;
				height: 180px;
			}

		}
		.h3{
			flaot:left;
			font-size:20px;

		}
		.spans{
			float:right;
			font-size:12px;
			margin-top:7px;
			color:gray;
		}
		.el-row {
			margin-bottom: 20px;
			&:last-child {
				margin-bottom: 0;
			}
		}
		.el-col {
			border-radius: 4px;
		}
		.bg-purple-dark {

		}
		// div2左侧
		.bg-purple {


		}
		// div2右侧
		.bg-purple-light {
			margin-left:20px;

		}
		.grid-content {
			border-radius: 4px;
			min-height: 470px;
		}
		.row-bg {
			padding: 10px 0;
			background-color: #f9fafc;
		}

	}

	#div4{
		height:470px;
		margin-top:20px;
		// 头部
		.dao{
			flaot:left;
			border-bottom: 1px solid gray;
			height:33px;
		}
		// 右侧内容
		.you{
			margin-top:10px;
			color:gray;
			border-bottom:1px solid gainsboro;
			height:35px;
			text-align: center;
		}
		.shape1 {
			width:20px;
			background: red;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape2 {
			width:20px;
			background: orangered;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape3 {
			width:20px;
			background: orange;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.shape {
			width:20px;
			background: gainsboro;
			border-radius:50%;
			text-align: center;
			color:#F6F6F6;
			text-align: center;
			float:left;
			margin-right:10px;
			margin-left:10px;
		}
		.you2{
			float:left;
		}
		.you3{
			float:right;
			margin-right:2px;
			font-size:12px;
			margin-top:3px;
		}
		// 图片
		.dao3{
			float:left;

			width:140px;
			height:200px;
			margin-right:20px;
			margin-top:10px;


		}
		.tup{
			height:180px;

			background-size:140px 180px;
			border:1px solid black;

		}
		.tup img{
			width:140px;
			height: 180px;

		}
		.h3{
			flaot:left;
			font-size:20px;

		}
		.spans{
			float:right;
			font-size:12px;
			margin-top:7px;
			color:gray;
		}
		.el-row {
			margin-bottom: 20px;
			&:last-child {
				margin-bottom: 0;
			}
		}
		.el-col {
			border-radius: 4px;
		}
		.bg-purple-dark {

		}
		// div2左侧
		.bg-purple {


		}
		// div2右侧
		.bg-purple-light {
			margin-left:20px;

		}
		.grid-content {
			border-radius: 4px;
			min-height: 470px;
		}
		.row-bg {
			padding: 10px 0;
			background-color: #f9fafc;
		}

	}
</style>