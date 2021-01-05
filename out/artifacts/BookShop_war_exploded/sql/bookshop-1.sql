-- 创建数据库
create database  bookShop
go

use bookShop;

-- 创建管理员表
create table book_admin
 (
    [uid] int identity ,							--主键ID
    [user] varchar(32) not null,					--管理员账号
    [password] varchar(16) not null,				--管理员密码'
	state int default 1,							--状态，1 表示正常，0 表示删除
    createtime datetime default getdate() not null,	--创建时间
    primary key (uid),
	unique([user])
);

-- 用户表
create table  book_user
 (
	userno int identity,							--主键id
    username varchar(100) not null,					--用户名
    userpass varchar(16) not null,					--用户密码
	phone varchar(13) not null,						--手机号，唯一
	state int default 1,							--状态，1 表示正常，0 表示删除
    createtime datetime default getdate() not null, --创建时间
    primary key (userno),
    unique (phone),
);

-- 会员详细信息
create table book_member
 (
    profileNo int identity,					--主键id
	userNo int not null,					--外键，用户编号
	phone varchar(13) not null,				--手机号
	name varchar(100) not null,				--姓名
	sex char(2) not null,					--性别
	birthday date not null,					--生日
	grade int default 1,					--等级 默认 lv1 级
	state int default 1,					--状态，1 表示正常，0 表示删除
    createtime datetime default getDate()	--创建时间
    primary key (profileNo),
    foreign key (userNO) references book_user(userNO),
)

-- 书籍地区表
create table book_region
(
	rid int identity primary key,		--编号
	region varchar(100) not null,		--地区
	created datetime default getdate()	--创建时间
);

-- 书籍种类表
create table book_classification
(
    classificationNo int identity,					--主键id
    name varchar(32) not null,						--类型名称
    createtime datetime default getDate() not null	--创建时间
    primary key (classificationNo)
)

-- 书籍类型表
create table book_type
(
    typeNo int identity,							--主键id
    classificationNo int not null,					--外键
    name varchar(32) not null,						--种类名称
    createtime datetime default getDate() not null	--创建时间
    primary key (typeNO),
    foreign key (classificationNo) references book_classification(classificationNo)
)



-- 书籍商品表
create table book_commodity
(
    productNo int identity,					--编号id
    typeNo int,								--分类id
	rid int,								--地区编号id
    bookName varchar(200) not null,			--图书名称
	author varchar(100) not null,			--作者
    price money not null,					--销售价格
	buyCount int,							--销售数量
	stock int not null,						--库存
    cover varchar(200) not null	,			--封面图
	content varchar(2000),					--图书简介
	state int default 1 not null,			--状态，1 表示上架，2 表示下架 0 表示删除
    createtime datetime default getdate()	--创建时间
    primary key (productNO),
	foreign key (typeNO) references book_type(typeNo),
	foreign key (rid) references book_region(rid),
)


--购物车表
create table book_cart
(
	cartNo int identity,						--购物车id
	productNo int,								--商品id(书籍编号)
	userNo int,									--用户id
	booknum int not null default 0,				--加入购物车的商品数量
	cprice money not null default 0.00,			--加入购物车时的价格
	created date not null default getdate(),	--创建时间
	primary key (cartNo),
    foreign key (productNo) references book_commodity(productNo),
	foreign key (userNo) references book_user(userNo),
)


--用户收货地址表
create table user_address
(
	addressNo int identity,					--地址编号
	userNo int,								--用户 id
	consignee varchar(100) not null,		--收货人
	detail_address varchar(300) not null,	--收货详细地址
	tel varchar(11) not null,				--收货人手机号
	created datetime not null default getdate(),
	primary key (addressNo),
	foreign key (userNo) references book_user(userNo),

);


--订单表
create table book_order
(
	orderNo int identity,					--订单编号
	userNo int not null,					--用户编号
	productNo int not null,					--书籍商品编号
	addressNo int not null,					--收货地址编号
	payment_number int not null,			--支付方式 ,1 微信，2 支付宝
	productnum int not null,				--书籍商品数量
	amount money default 0,					--订单总价
	status int default 1,					--订单状态 0取消付款，1待发货，2待收货，3已完成
	remarks varchar(1000),					--订单备注
	createTime datetime default getdate()	--创建时间
	primary key (orderNo),
    foreign key (productNo) references book_commodity(productNo),
	foreign key (userNo) references book_user(userNo),
    foreign key (addressNo) references user_address(addressNo),
)


--测试数据

insert into book_admin([user], password) values('admin', '123456'),('admin2', '123456');

insert into book_user(username,userpass,phone) values('tom','123456','110'),('jok','123456','120');

insert into book_member(userNO,phone,name,sex,birthday) values(1,'110','张三','男','2020-01-01'),(1,'110','里斯','男','2020-01-01');

insert into book_region(region) values('大陆'),('韩国')

insert into book_classification(name) values('出版'),('男生'),('女生');

insert into book_type(classificationNo,name) values(1,'励志'),(1,'文学'),(1,'文学'),(2,'玄幻'),(2,'武侠'),(2,'仙侠'),(2,'奇幻'),(2,'校园'),(2,'科幻'),(3,'现代言情'),(3,'古代言情'),(3,'幻想言情'),(3,'青春校园');

insert into book_commodity(typeNo,rid,bookName,author,price,buyCount,stock,cover,content)values
(1,1,'学习高手','李拓远',25,100,500,'img/xxgs.jpg','如何记忆，才能牢固掌握知识点？ 如何复习，才能夯实完整知识体系？'),
(1,1,'为人三会','穆子华',35,100,500,'img/wrsh.jpg','以为人做题，以做人、说话、办事做眼等阐述了现代人立足社会应当掌握的技巧和策略。文字深入浅出地说明了说话和办事所蕴藏的智慧和艺术。！'),
(1,1,'小故事大道理大全集（珍藏版）','雅琴',36,100,200,'/img/xgsddl.jpg','所选故事可谓最经典、最深刻、引用范围最广泛，。阅读本书，让你在获得智慧的同时，领悟到快乐的人生直谛！ '),
(3,1,'神魂至尊','八异',28,100,500,'img/shzz.jpg','天铠大陆，强者为尊，在这里弱者渺小若蝼蚁，强者浩大如山岳；甚至一些至强者可以劈江断海，开山裂石；'),
(3,1,'万古神帝','飞天鱼',27,100,500,'img/wgsd.jpg','八百年前，明帝之子张若尘，被他的未婚妻池瑶公主杀死，一代天骄，就此陨落。'),
(3,1,'凡人修仙传','忘语',30,100,500,'img/frxxz.jpg','一个普通山村小子，偶然下进入到当地江湖小门派，成了一名记名弟子。 '),
(4,1,'倚天之屠尽群雄','海上落日',30,100,500,'img/ytqx.jpg','我和乔峰喝过酒拜过把子，我和张无忌争过赵敏，也和群雄打过架！ '),
(4,1,'逍遥派','白马出淤泥',35,100,500,'img/xyp.jpg','一本<南华经>，一篇<逍遥游>，引出天下功法秘笈无数。开启通天大阵。 '),
(4,1,'凌天剑神','竹林之大贤',27,100,500,'img/ltjs.jpg','武林第一天才凌尘，因宗门遭逢大变而修为尽废，武功全失。 '),
(5,1,'修仙狂少','上殿',30,100,500,'img/xxks.jpg','本是跳水救狗，却意外捡到一个破壶，里面还有个自称十二劫散仙的老头要收自己做弟子？！ '),
(5,1,'九阳至尊','剪刀石头布',32,100,500,'/img/jyzz.jpg','修真界人心险恶，意外穿越，奈何重生后是一弃子，身世惨淡，一切妖魔尽在我碾压之中，青云直上…… '),
(5,1,'遮天','辰东',35,100,500,'img/zt.jpg','冰冷与黑暗并存的宇宙深处，九具庞大的龙尸拉着一口青铜古棺，亘古长存。'),
(6,1,'从一个湖开始的进化','白衣见雪',37,100,500,'img/cyghksdjh.jpg','楚沉重生到神魔大陆，变成了一个湖泊。凡支流路径之处，便是楚沉的绝对领地！ '),
(6,1,'斗魔传承','乾图',35,100,500,'img/dmcc.jpg','被视为废柴的林立十八岁当天因家规而不得不进入落日山脉猎杀魔兽作为成年礼，不幸遭遇成年雷兽仓皇逃命'),
(6,1,'熊猫好贱','国宝',33,100,500,'img/xmhj.jpg','“你来打我啊！”顶着史上最欠揍的口号，自带吸灵光环的唐远不仅怼人怼妖怼神兽，还要撩天撩地撩神仙！ '),
(7,1,'极品黄金瞳','温暖如冰',38,100,500,'img/jphjt.jpg','宁涛原本只是一个普通医科大学的学生，偶然情况下获得了烛龙之眼，借此竟然有了透视的能力，从此渊鱼化龙。 '),
(7,1,'英雄联盟之绝世无双','心动可乐',38,100,500,'img/jsws2.jpg','什么？你说英雄联盟是5V5的游戏？这难道不一直是1打9的游戏吗？ '),
(7,1,'校花的近身武神','夜星魂',40,100,500,'img/jsws.jpg','自幼被家族遗弃的林凡，大学期间偶得奇遇，拥有了纯阳脉和至阴脉并存的阴阳双脉'),
(8,1,'学霸的黑科技系统','晨星LL',26,100,500,'img/hkj.jpg','“系统，积分能兑钱吗？”“不能。”“那我要你何用！”“本系统能让你当上学霸，你还要钱干啥？” '),
(8,1,'九星毒奶','育',25,100,500,'img/jxdn.jpg','这是一个充满了星力的平行世界。星图、星技、星宠、星武者大行其道。魂穿而来的江晓，体内蕴含着一张奇特的内视星图'),
(8,1,'我在末世捡属性','金鱼的心跳',28,100,500,'img/wzmsjsx.jpg','末世到来，人人艰难求存。宿管员杨浩，被人逼迫出来寻找食物。危机中发现丧尸掉落的属性，可以捡起来给自己增加。'),
(9,1,'跟乔爷撒个娇','罗衣对雪',30,100,500,'img/gqysgj.jpg','京城出了大新闻：乔爷守了十二年的小媳妇跑了，跑了！连儿子都不要了！一时间流言四起：听说是乔爷'),
(9,1,'重生之复仇女王','正月初琪',30,100,500,'img/fcnw.jpg','微型炸药让伊兰幽跟渣男贱女同归于尽，老天垂怜使她重回十六岁，前世懦弱卑微人畜可欺，今世高调霸道无人不惧。'),
(9,1,'小妻吻上瘾','：洛心辰',34,100,500,'img/xqwsy.jpg','他是权势滔天、富可敌国的凌家第四子，也是从小又哑又瘫且被家族流放在外的弃子！她不介意全世界对他的嘲笑，与他合作了一场有名无实的婚姻 '),
(10,1,'凤归天下','夏虫语',27,100,500,'img/fgtx.jpg','（超甜宠文）卓青鸾自从跟了萧衍，每天都被他迷得晕头转向的。话说，怎会有如此好看的……龙呢？本来以为萧衍是人，结果，他是一条龙。'),
(10,1,'弃妃别来无恙','楚千墨',29,100,500,'img/qfblwy.jpg','三年前：上官千羽冷傲轻蔑：“美人计，苦肉计，不管你多少计，也休想得到本王半丝恩宠！”燕青蕊不屑撇嘴：“老娘身边桃花朵朵开，稀罕你？” '),
(10,1,'邪帝缠宠：神医九小姐','豆喵喵',28,100,500,'img/syjxj.jpg','小五：“主人，谁才是你的小心肝？”君九：“你。”某醋坛子：我呢？君九：“咳咳，你是大心肝，她是小心肝~”她是华夏圣手君九，医毒双绝。 '),
(11,1,'神医弃女','MS芙子',35,100,500,'img/syqn.jpg','（正文已完结）叶家傻女一朝重生！坐拥万能神鼎，身怀灵植空间，她不再是人见人欺的废材弃女！药毒无双，神医也要靠边站；灵兽求契约，不好意思 '),
(11,1,'快穿之女配要复仇','梦公爵',36,100,500,'img/npybc.jpg','穿越在剧情结束后，改变女配炮灰命运的爽文。让男女主自己玩去吧，什么？来惹我？我是好惹的吗？！ '),
(11,1,'阴谋鬼爱','云七七',32,100,500,'img/ymga.jpg','结婚后，丈夫出差久久未归。一个阴雨夜，我在浴室洗澡，一道寒冷的影子突然缠上我的身体……没多久，我便发现自己有了身孕…… '),
(12,1,'裴先生娶了个200斤的胖子以后','双囍PF',38,100,500,'img/fxsqyg200jdpzyh.jpg','27岁的天才美女医生夏清猝死在手术室了！她还重生了！重生在了她最熟悉的病房。 '),
(12,1,'她的微笑像颗糖','休尹',30,100,500,'img/tdwxxkt.jpg','高二一班的徐静姝人冷话不多，若不是节节数学课被老师拎出去罚站，恐怕就是个班上的小透明。“静姝，又被老魏罚站了？ '),
(12,1,'她和年级第一我都要','图样先森',25,100,500,'img/thynjwdy.jpg','高一开学后，本市今年的双黄蛋中考状元被分在一个班十五岁的少男少女，男生俊秀挺拔，高 '),

(2,1,'平凡的世界','路遥',25,100,500,'img/pfdsj.jpg','作者在近十年间广阔背景上，通过复杂的矛盾纠葛，刻划了社会各阶层众多普通人的形象。劳动与爱情，挫折与追求，痛苦与欢乐，日常生活与巨大社会冲突，纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。'),
(2,1,'决战朝鲜','李峰',40,100,300,'img/jzzx.jpg','本书是一部全景式再现朝鲜战争历史命运的经典作品，以恢宏的气势、凝练的语言、多维度的视角记述和分析了朝鲜战争成因、决策过程、五次战役及出兵朝鲜真相，'),
(2,1,'云边有个小卖部','张嘉佳',40,100,300,'img/ybygxmb.jpg','让刘十三陪着你，走进云边镇的春夏秋冬，见证每一场相遇与离别。“有些人刻骨铭心，没几年会遗忘。有些人不论生死，都陪在身旁。”满镇开着桔梗，蒲公英飞得比石榴树还高，一直飘进山脚的稻海。'),
(2,1,'直到世界反映了灵魂最深层的需要','露易丝·格丽克、柳向阳、范静哗',50,200,333,'img/zdsxfyllhzscdxy.jpg','《直到世界反映了灵魂最深层的需要》完整收录了格丽克的《阿弗尔诺》（新英格兰笔会奖）和《村居生活》（格林芬诗歌奖短名单）两本诗集；此外还有早期五本诗集的精选，涉及的诗集为《头生子》（美国诗歌学会诗人奖）、《沼泽地上的房屋》、《下降的形象》、《阿基里斯的胜利》（全国书评界奖）、《阿勒山》（国会图书馆丽贝卡·博比特全国诗歌奖）。'),
(2,1,'一见如故的宋词','北狼望月',60,100,210,'img/yjrgdsc.jpg','也许这里所有的词你都如逢故友，也许有一些还不是故友，只是似曾相识罢了。无妨，这里的词，即便不是似曾相识，也必定会令你一眼倾心，一见如故。'),
(2,1,'冰心三部曲','冰心',10,100,150,'img/bxsbq.jpg','本套装是著名散文家冰心的代表作，描写十分细腻，除了三部曲外还收录了作者其它著名散文作品，这些作品语言优美，内容动人，情感真挚，表达了作者对家乡的依恋之情，对儿童的关怀之情以及对生活的热爱之情。'),
(2,1,'北大人文课','张笑恒',10,100,100,'img/bdrwk.jpg','北大百年的智慧积淀，人文世界的思想精髓，引领时代进步的你不能抵达'),
(2,1,'朝花夕拾','鲁迅',10,100,100,'img/zhxs.jpg','鲁迅作品，历来总是强调其战斗的一面，而忽略他文学中闲适的一面，优美的一面，甚至潮流游戏的一面。新版朝花夕拾精选鲁迅先生48篇优美有趣的散文'),
(2,1,'好好吃饭','汪曾祺',10,100,100,'img/hhcf.jpg','本书精选37篇汪氏美食散文，按照汪曾祺的人生行旅编排，追随他的人生足迹，品味中国美食地图，解读烟火中的生动人间。'),
(2,1,'老残游记','刘鹗',10,100,100,'img/lcyj.jpg','《老残游记》是清末文学家刘鹗的代表作。其中对大明湖风光、黄河冰雪以及对王小玉说书的描绘等艺术成就尤高。'),
(2,1,'慈禧私生活回忆录：我在太后身边的两年','裕德龄、郝金茹',10,100,100,'img/zxth.jpg','作者裕德龄凭着自己与太后朝夕相处的亲身经历向读者详尽披露了慈禧太后的私生活'),
(2,1,'我与世界只差一个你','张皓宸',10,100,100,'img/wysjzcgn.jpg','一个App人气冠军张皓宸全新个人故事集，温馨治愈的情感故事，让你在面对爱时无惧，怀疑爱时坚定。'),
(2,1,'人间失格','太宰治、高詹灿、袁斌',10,100,100,'img/rjsg.jpg','这是一本，让很多人看完后，仿佛被刀子扎到心里的书。 小阅第一次读的时候，就有一种被内心都被剖开了的感觉！'),
(2,1,'活着','余华',10,100,100,'img/hz.jpg','讲述了农村人福贵悲惨的人生遭遇。福贵本是个阔少爷，可他嗜赌如命，终于赌光了家业，一贫如洗。他的父亲被他活活气死，母亲则在穷困中患了重病。'),
(2,1,'南怀瑾著作全收录','南怀瑾',10,100,100,'img/nhjzzqsl.jpg','南怀瑾先生的著述涉及儒、释、道等中国传统文化经典，他常以经史合参的讲述方式、生动幽默语言，结合古今中外历史人文典故'),
(2,1,'中国古典文学荟萃','曹雪芹、罗贯中、鬼谷子',20,200,240,'img/zggdwxhc.jpg','此套装精选先秦以来的优秀文学作品，涵盖诗、词、曲、小说、戏剧、随笔等体裁，版本权威，名家译注，是文学爱好者案头必备丛书。'),
(2,1,'季羡林全集','季羡林',30,100,150,'img/jxlqj.jpg','《季羡林全集》收录作者30卷经典作品，是国学大师生平的真实写照。我这一生是翻译与创作并举，语言、历史与文艺理论齐抓，对比较文学、民问文学等等也有浓厚的兴趣，是一个典型的地地道道的“杂家”。'),
(2,1,'牛津通识读本精选集','雷蒙德·瓦克斯、殷源源',20,100,100,'img/njtsdbjxj.jpg','“牛津通识读本”系列丛书由国内专业翻译出版社译林出版社从牛津大学出版社引进，该丛书英文原版自1995年起陆续面世以来在全球范围内已被译成近三十种文字。'),
(2,1,'宋词鉴赏辞典','夏承焘、唐圭璋、周汝昌',10,200,200,'img/scjscd.jpg','上海辞书出版社文学鉴赏辞典编纂中心为拓展我社文学鉴赏辞典的风格和品牌，收录宋、辽、金286位词人及无名词人的词作共1294篇，编成《宋词鉴赏辞典》讲解艺术特色，评论文学成就，介绍各家之说。'),
(2,1,'蒋勋说红楼梦','蒋勋',10,100,100,'img/jxshlm.jpg','《蒋勋说红楼梦》是台湾美学大家蒋勋先生倾注长达半个世纪反复阅读《红楼梦》数十多遍后的心血之作，可谓品读最到位、讲解最感人的《红楼梦》赏析书。'),
(2,1,'汪曾祺全集','汪曾祺',10,100,100,'img/wzjqj.jpg','《汪曾祺全集》收入迄今发现的汪曾祺全部文学作品(小说、散文、戏剧、谈艺、诗歌、杂著)以及书信、题跋等日常文书。作品以最初发表的版本为底本，校勘精良，'),
(2,1,'世说新语','刘义庆、朱碧莲、沈海波',10,120,120,'img/ssxy.jpg','《世说新语》是由南北朝刘义庆组织一批文人编写而成。分为德行、言语、政事、文学、方正、雅量等三十六门，全书共一千多则'),
(2,1,'千首唐人绝句','富寿荪',10,100,100,'img/qsdrjj.jpg','此书是大型唐人绝句选本，共收绝句一千多首。在注释、集评和评介等方面均富特色。注释言简意赅；集评广辑唐以后诗话笔记中对唐人绝句的评语，阐微抉隐；作者评介，论述警辟。'),
(2,1,'哲思：终极人生智慧之书','周国平、星云大师、杨先放、康书月、索达吉堪布、戴维·尼文',10,100,100,'img/zszjrszfzs.jpg','本套书包含：《我们都是孤独的行路人》、《每个生命都要结伴而行》等'),
(2,1,'木心全集','木心',10,100,100,'img/mxqj.jpg','木心说，“我是一个在黑暗中大雪纷飞的人哪”……理想国典藏版“木心全集”，汇齐15种文字著作（含讲稿《文学回忆录》《木心谈木心》），收入木心晚年定稿、作家影像、创作手迹等'),
(2,1,'史铁生作品全编','史铁生',10,100,100,'img/stszpqp.jpg','《史铁生作品全编》收入史铁生的全部作品，约三百万字，估计编为十卷。以原《史铁生作品系列》七卷为基础，加入新整理的史铁生遗作重新编辑。'),
(2,1,'余秋雨作品集','余秋雨',10,100,100,'img/yqyzpj.jpg','余秋雨书系共12册，包括《文化苦旅（修订本）》《何谓文化》《中国文脉》《千年一叹》《行者无疆》《山河之书》《极端之美》等。'),
(2,1,'民间山野怪谈','潘海根',10,100,100,'img/mjsygt.jpg','行一生江湖，讲一段民间鬼事，民间山野怪谈，一直充斥着人们的茶余饭后，民间关于山野鬼神之事更是传的五花八门'),
(2,1,'鲁迅文学全集','鲁迅',10,100,100,'img/lxwxqj.jpg','内容简介：1938年版《鲁迅全集》由蔡元培任主席的鲁迅先生纪念委员会负责编'),
(2,1,'卡尔维诺精选作品集','伊塔洛·卡尔维诺、黄灿然',10,100,100,'img/krwljx.jpg','《卡尔维诺精选作品集》包含以下23部作品，《树上的男爵》《分成两半的子爵》《不存在的骑士》等。'),
(2,1,'山海经','小岩井',10,100,100,'img/shj.jpg','《山海经》是一部记述中国古代志怪的奇书。该书作者不详，大体是战国中后期到汉代初中期的楚国或巴蜀人所作。'),
(9,1,'宫阙：海青拿天鹅唯美甜宠系列','海青拿天鹅',10,100,100,'img/gqhqntewm.jpg','古言大神海青拿天鹅5部唯美甜宠经典代表作，分别讲述了5个不同时代的爱情故事。“白芍”：上古时期天庭第一风流神君PK史上最萌天狗。'),
(9,1,'丫鬟嫣然','秋李子',10,100,100,'img/yhyr.jpg','十一岁前，郑嫣然以为，自己会在家人庇护下一世无忧。十一岁后，郑嫣然才知道，身为侯府家生子，生杀予夺都在主人手里…… 【板栗频道 品质好文】'),
(9,1,'悍女三嫁','秋李子',10,100,100,'img/hnsj.jpg','定北侯大娘子胡胭脂，初嫁吴国公次子，十里红妆，王妃送嫁，轰动京城。谁料尚未满月胭脂就因责打丈夫宠婢，夫家宁愿忤旨，也要休妻。'),
(9,1,'摘星合集','林笛儿',10,100,100,'img/zxxhj.jpg','他是军中年轻的少将，沉稳、渊博、形像高大；她是初出校门的社会小菜鸟，冲动、仗义、乐天派'),
(9,1,'白泽寄生','方应鱼',10,100,100,'img/bzjs.jpg','雷夏国，镇灵兽"白泽"被毁，妖灵复苏，人间惊现名为"鱼妇"的低级而凶残的妖，白泽碎魄寄生获得异能。 '),
(9,1,'世家妇','秋李子',10,100,100,'img/sjh.jpg','后院妻妾争宠，丫鬟们挑拨离间，媳妇们彼此不怀好意，家族争夺财产……世家妇本是侯门女'),
(9,1,'薄相','余妻',10,100,100,'img/px.jpg','邺齐的翩翩公子，权倾天下的丞相大人。他清雅无双，却翻手为云覆手为雨，操纵全局。怨情仇，纠缠不清。'),
(9,1,'清宫谋','莲静竹衣',10,100,100,'img/qgm.jpg','她，是前朝妖妃的女儿，绝色倾城却只能终身为奴。她，是大清后宫最耀眼的“明珠”，阴差阳错栖身冷宫。'),
(4,1,'倚天之屠尽群雄','海上落日',10,100,100,'img/ytzd.jpg','我和乔峰喝过酒拜过把子，我和张无忌争过赵敏，也和群雄打过架，更与黄药师、欧阳锋约于华山之巅……'),
(4,1,'逍遥派','白马出淤泥',10,100,100,'img/xyp.jpg','一本<南华经>，一篇<逍遥游>，引出天下功法秘笈无数。通天大阵。'),
(4,1,'凌天剑神','竹林之大贤',10,100,100,'img/ltjs.jpg','武林第一天才凌尘，因宗门遭逢大变而修为尽废，武功全失。'),
(4,1,'白袍总管','萧舒',10,100,100,'img/bpzg.jpg','身怀佛家神通，进入国公府成为杂役，江湖之中，庙堂之上，儿女情长，英雄壮歌。'),
(4,1,'血狱江湖','天雨寒',10,100,100,'img/xyjh.jpg','一个在飞雪天被送到武王府的婴儿，他是谁？一个巨大的阴谋背后，隐藏着多少无耻的面孔。');

insert into book_cart(productNo,userNo,booknum,cprice) values(1,1,2,23),(1,1,2,24)

insert into user_address(userno,consignee,detail_address,tel) values(1,'admin','广东省珠海市斗门区白蕉镇南方IT学院',110),(1,'李斯','广东省珠海市斗门区白蕉镇南方IT学院',110);

insert into book_order(userno,productNo,addressNo,payment_number,productnum,amount,remarks) values(1,1,1,1,1,23,''),(1,1,1,1,1,25,'');
select typeNo  from book_type
group by typeNo

select * from book_type
left join book_commodity on book_type.typeNo= book_commodity.typeNo

select book_commodity.state from book_commodity
left join book_type on book_type.typeNo= book_commodity.typeNo
join book_region on book_commodity.rid = book_region.rid
order by book_type.typeNo offset 0 rows fetch next 5 rows only

