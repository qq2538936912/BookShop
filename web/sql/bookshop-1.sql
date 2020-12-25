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

-- 书籍类型表
create table book_type
(
    typeNo int identity,							--主键id
    name varchar(32) not null,						--类型名称
    createtime datetime default getDate() not null	--创建时间
    primary key (typeNO)
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

insert into book_type(name) values('励志'),('玄幻'),('武侠'),('仙侠'),('奇幻'),('校园'),('科幻'),('现代言情'),('古代言情'),('幻想言情'),('青春校园');

insert into book_commodity(typeNo,rid,bookName,author,price,buyCount,stock,cover,content)values
(1,1,'学习高手','李拓远',25,100,500,'img/xxgs.jpg','如何记忆，才能牢固掌握知识点？ 如何复习，才能夯实完整知识体系？如何自学，才能实现终身跨界成长？这些问题，《学习高手》里都有答案。本书是一本写给广大学生和家长的，培养高效学习能力的方法工具书。作者作为哈佛、耶鲁高分毕业生，结合先进的理论知识、经典的学习经验，系统分享了超实用的学习法。全书分为5大模块、30节大课、100+方法，帮助你提高学习成绩，打开人生格局。'),
(1,1,'为人三会','穆子华',35,100,500,'img/wrsh.jpg','以为人做题，以做人、说话、办事做眼，内容古今鉴用，中外融通，多侧面、多角度、多层次地揭示为人这个主题，阐述了现代人立足社会应当掌握的技巧和策略。每一个生动精彩的故事映照出了人性的光辉，教给我们做人的价值和意义；每一段文字深入浅出地说明了说话和办事所蕴藏的智慧和艺术。用最直接、最简单、最实用、最有效的方法告诉我们：怎样做人最中庸，最广受欢迎；怎样说话最恰当，最让人爱听，怎样办事最成功，收效最高。二十几岁不会，三十岁后会怕，四十岁后会悔！'),
(1,1,'小故事大道理大全集（珍藏版）','雅琴',36,100,200,'/img/xgsddl.jpg','人生，因智慧而快乐。“小故事大道理大全集”中的上千则故事都是从浩如烟海的成功学著作和杂志中提炼出来的，将许多人生哲理以最简单、最朴实的方式呈现给读者，让读者能抛开理论的迷雾。直入心灵。获得人生感悟，所选故事可谓最经典、最深刻、引用范围最广泛，每则故事后还附有短小精辟的人生哲理，启人心智，发人深省。阅读本书，让你在获得智慧的同时，领悟到快乐的人生直谛！ '),
(2,1,'神魂至尊','八异',28,100,500,'img/shzz.jpg','天铠大陆，强者为尊，在这里弱者渺小若蝼蚁，强者浩大如山岳；甚至一些至强者可以劈江断海，开山裂石；更有大神通者可破碎虚空，斩破轮回！医科大学生卓文偶得玉鼎穿越到一落魄少爷身上，靠着玉鼎中无尽的丹方以平庸的资质一步步踏上无上巅峰，成为了即使是天才也要仰望的存在！'),
(2,1,'万古神帝','飞天鱼',27,100,500,'img/wgsd.jpg','八百年前，明帝之子张若尘，被他的未婚妻池瑶公主杀死，一代天骄，就此陨落。 八百年后，张若尘重新活了过来，却发现曾经杀死他的未婚妻， 已经统一昆仑界，开辟出第一中央帝国，号称“池瑶女皇”。 池瑶女皇——统御天下，威临八方；青春永驻，不死不灭。 张若尘站在诸皇祠堂外，望着池瑶女皇的神像，心中燃烧起熊熊的仇恨烈焰，“待我重修十三年，敢叫女皇下黄泉”。………… '),
(2,1,'凡人修仙传','忘语',30,100,500,'img/frxxz.jpg','一个普通山村小子，偶然下进入到当地江湖小门派，成了一名记名弟子。他以这样身份，如何在门派中立足,如何以平庸的资质进入到修仙者的行列，从而笑傲三界之中！　　 诸位道友，忘语新书《大梦主》，经在起点中文网上传了，欢迎大家继续支持哦！ '),
(3,1,'倚天之屠尽群雄','海上落日',30,100,500,'img/ytqx.jpg','我和乔峰喝过酒拜过把子，我和张无忌争过赵敏，也和群雄打过架，更与黄药师、欧阳锋约于华山之巅……我修过武，更练过气，也成过神。无数位面，无数强者，都败在我的脚下。这一世，我定要登上那武道绝巅！莫声谷：“我说神佛皆要惧我；我说帝皇皆要拜我。”这是莫声谷逆袭老天的传奇故事！ '),
(3,1,'逍遥派','白马出淤泥',35,100,500,'img/xyp.jpg','一本<南华经>，一篇<逍遥游>，引出天下功法秘笈无数。一介秀才，得‘药王’指点，修炼返老还童之术，功法逆天。一朝神功大成，天下无敌，解封至尊魔刀，开启通天大阵。万年魔殿殿主之位空悬，万年江湖恩怨就此拉开。这是逍遥派老祖的传奇人生。 '),
(3,1,'凌天剑神','竹林之大贤',27,100,500,'img/ltjs.jpg','武林第一天才凌尘，因宗门遭逢大变而修为尽废，武功全失。在命悬一线之际，凌尘偶得武林神功《凌天剑经》，废脉重修，从此通剑道，凝剑心，悟剑意，终成一代剑神！已有长篇完本作品《剑之帝皇》、《天界至尊》，人品有保证！ '),
(4,1,'修仙狂少','上殿',30,100,500,'img/xxks.jpg','本是跳水救狗，却意外捡到一个破壶，里面还有个自称十二劫散仙的老头要收自己做弟子？！杨毅云：“修仙能当饭吃么？能赚钱么？能泡妞么……？”“滚！” '),
(4,1,'九阳至尊','剪刀石头布',32,100,500,'/img/jyzz.jpg','修真界人心险恶，意外穿越，奈何重生后是一弃子，身世惨淡，幸偶遇后羿射日神弓，收服九阳炉，踏平人界八方门派，重回修真界，在刀光剑影尔虞我诈中走上巅峰，任你仙道茫茫，步步艰辛，一颗丹心逆流直上，一切妖魔尽在我碾压之中，青云直上…… '),
(4,1,'遮天','辰东',35,100,500,'img/zt.jpg','冰冷与黑暗并存的宇宙深处，九具庞大的龙尸拉着一口青铜古棺，亘古长存。　　这是太空探测器在枯寂的宇宙中捕捉到的一幅极其震撼的画面。　　九龙拉棺，究竟是回到了上古，还是来到了星空的彼岸？　　一个浩大的仙侠世界，光怪陆离，神秘无尽。热血似火山沸腾，激情若瀚海汹涌，欲望如深渊无止境……　　登天路，踏歌行，弹指遮天。'),
(5,1,'从一个湖开始的进化','白衣见雪',37,100,500,'img/cyghksdjh.jpg','楚沉重生到神魔大陆，变成了一个湖泊。这个世界神灵遍地，统领四方 种族亿万，遵循着丛林法则，征战不断。楚沉重生而来，系统绑定，开始了他的凶猛进化。灵力之湖，元素之湖，规则之湖，信仰之湖……支流贯穿千百位面，福泽无数生灵，埋葬万千神魔。凡支流路径之处，便是楚沉的绝对领地！ '),
(5,1,'斗魔传承','乾图',35,100,500,'img/dmcc.jpg','被视为废柴的林立十八岁当天因家规而不得不进入落日山脉猎杀魔兽作为成年礼，不幸遭遇成年雷兽仓皇逃命，一头撞入了浓雾笼罩的树林之中，却意外得到了众多强者记忆传承……从此走上人生巅峰，无所不通…… '),
(5,1,'熊猫好贱','国宝',33,100,500,'img/xmhj.jpg','“你来打我啊！”顶着史上最欠揍的口号，自带吸灵光环的唐远不仅怼人怼妖怼神兽，还要撩天撩地撩神仙！ '),
(6,1,'极品黄金瞳','温暖如冰',38,100,500,'img/jphjt.jpg','宁涛原本只是一个普通医科大学的学生，偶然情况下获得了烛龙之眼，借此竟然有了透视的能力，从此渊鱼化龙。赌博，赌石，他是无冕之王，看病，看美女，他是无愧的妙手回春！想赚点小钱，娶个媳妇，熟料一个个美女接踵而来，简直是停不下来，宁涛无奈的摆摆手道：“不能啊美女们，我只是一个学生。 '),
(6,1,'英雄联盟之绝世无双','心动可乐',38,100,500,'img/jsws2.jpg','什么？你说英雄联盟是5V5的游戏？这难道不一直是1打9的游戏吗？夏新露出了一脸凝重表情……难道大家玩的不是同一款游戏…… '),
(6,1,'校花的近身武神','夜星魂',40,100,500,'img/jsws.jpg','自幼被家族遗弃的林凡，大学期间偶得奇遇，拥有了纯阳脉和至阴脉并存的阴阳双脉体质，得以修炼天级功法乾坤阴阳诀，此后奇遇不断，武修路上精彩纷呈，各色美女接踵而至，林凡的身世也渐渐揭晓，曾经的弃儿竟藏着惊天秘密…… '),
(7,1,'学霸的黑科技系统','晨星LL',26,100,500,'img/hkj.jpg','“系统，积分能兑钱吗？”“不能。”“那我要你何用！”“本系统能让你当上学霸，你还要钱干啥？” '),
(7,1,'九星毒奶','育',25,100,500,'img/jxdn.jpg','这是一个充满了星力的平行世界。星图、星技、星宠、星武者大行其道。魂穿而来的江晓，体内蕴含着一张奇特的内视星图，成为一名稀有的医疗系觉醒者。他本想成为一名快乐的辅助，却被众人冠上了毒奶之名。这一切的故事，要从那一巴掌开始说起......**轻松搞笑，欢迎入坑。 '),
(7,1,'我在末世捡属性','金鱼的心跳',28,100,500,'img/wzmsjsx.jpg','末世到来，人人艰难求存。宿管员杨浩，被人逼迫出来寻找食物。危机中发现丧尸掉落的属性，可以捡起来给自己增加。“捡到力量属性，力量+1。”“捡到速度属性，速度+1。”“捡到变异属性，觉醒血脉。”“捡到红包，获得矿泉水三瓶！”“捡到白银宝箱，获得钛合金长枪一把！”“美女是我的，食物是我的，广袤的土地都是我的！”杨浩看着密密麻麻的丧尸，大声狂吼。从此，脚下堆满变异者，进化兽，古武者的尸体。 '),
(8,1,'跟乔爷撒个娇','罗衣对雪',30,100,500,'img/gqysgj.jpg','京城出了大新闻：乔爷守了十二年的小媳妇跑了，跑了！连儿子都不要了！一时间流言四起：听说是乔爷腹黑又高冷、婚后生活不和谐；听说是小媳妇和别人好上了；听说是儿子太丑。某天，小奶娃找到了叶佳期，委屈巴巴：“七七，爸爸说我是宠物店买的。”“宠物店怎么能买到这么漂亮的儿子。”叶佳期呵呵笑，“明明是……摸奖中的。”小奶娃望天：“……”二十岁前，他把她宠上天；二十岁后，他把她和小包子宠上天。从此，京城乔爷，眉间心上，唯独一人'),
(8,1,'重生之复仇女王','正月初琪',30,100,500,'img/fcnw.jpg','微型炸药让伊兰幽跟渣男贱女同归于尽，老天垂怜使她重回十六岁，前世懦弱卑微人畜可欺，今世高调霸道无人不惧。上一辈子欠她分毫的这一辈子她都要加倍讨回。虐渣打脸绝不手软。机关算进却还是百密一疏：原以为可以看透所有人的心，却独在与他的交易中不小心丢了自己的心，眼前这个男人绝对是个祸害。 '),
(8,1,'小妻吻上瘾','：洛心辰',34,100,500,'img/xqwsy.jpg','他是权势滔天、富可敌国的凌家第四子，也是从小又哑又瘫且被家族流放在外的弃子！她不介意全世界对他的嘲笑，与他合作了一场有名无实的婚姻，婚后才发现，她的残废丈夫是一头披着羊皮的狼！一把轮椅，一支笔，他却抵达了权贵的顶端。她亲眼见证了他以雷霆的手段吞下了抛弃过他的家族，也吞下了她！瞧着小妻子留下的离婚协议书，坐在轮椅上的男人终于冷笑着站了起来：“全世界都知道我是个残废，脾气古怪，不能人道，你跑了，还有谁愿意嫁我？”她隔着一个太平洋接到他的电话，泪眼婆娑地数吻痕：“敢说你不能人道？骗子！”通话还未结束，他的声音却透过门板传了过来，吓得她瑟瑟发抖：“离婚可以，除非你愿意帮我向全世界作证，证明我行过！”她：“你说过你会放我离开的！”他：“我没说过！”她：“你说过！”他：“没说过！”她：“狗说的！”他：“……”瞧吧，他腹黑狠辣，可是他的小妻子也不是好惹的，敢骂他是狗，就必须付出代价！他：“你知道狗的特性是什么吗？”她：“什么？”他：“勇敢、忠诚，还有……吃不饱！”她：“……” '),
(9,1,'凤归天下','夏虫语',27,100,500,'img/fgtx.jpg','（超甜宠文）卓青鸾自从跟了萧衍，每天都被他迷得晕头转向的。话说，怎会有如此好看的……龙呢？本来以为萧衍是人，结果，他是一条龙。本来以为娘亲是人，结果，她是一只凤。本来以为自己不是人，结果，她……真的不是人。她是一颗种子。她浴火重生，王者归来！身怀神秘空间，脚踏三大神界，被人夺去的，她将十倍拿回！被人谋害的，她要百倍奉还！世界，颤抖吧！ '),
(9,1,'弃妃别来无恙','楚千墨',29,100,500,'img/qfblwy.jpg','三年前：上官千羽冷傲轻蔑：“美人计，苦肉计，不管你多少计，也休想得到本王半丝恩宠！”燕青蕊不屑撇嘴：“老娘身边桃花朵朵开，稀罕你？”三年后：燕青蕊无语：“死缠烂打，死皮赖脸，真是够了。王爷，你的节操呢？”上官千羽理直气壮：“娘子面前，节操自动下线。” '),
(9,1,'邪帝缠宠：神医九小姐','豆喵喵',28,100,500,'img/syjxj.jpg','小五：“主人，谁才是你的小心肝？”君九：“你。”某醋坛子：我呢？君九：“咳咳，你是大心肝，她是小心肝~”她是华夏圣手君九，医毒双绝。一朝穿越，却成了人人可以羞辱的废物小姐。废物？虐渣打脸她样样拿手！神品丹药随手炼，坐拥神兽，迎娶邪帝！到底谁才是那个废物？ '),
(10,1,'神医弃女','MS芙子',35,100,500,'img/syqn.jpg','（正文已完结）叶家傻女一朝重生！坐拥万能神鼎，身怀灵植空间，她不再是人见人欺的废材弃女！药毒无双，神医也要靠边站；灵兽求契约，不好意思，兽神都喊咱老大； 渣爹，敢抛妻弃女，她就让他家破人亡；世人，敢欺她辱她，她必百倍还之；再世为人，她王者归来,岂料惹上了邪魅嗜血的他。他明明是杀伐决断的鬼帝，却化身呆萌无害的敌国质子…… '),
(10,1,'快穿之女配要复仇','梦公爵',36,100,500,'img/npybc.jpg','穿越在剧情结束后，改变女配炮灰命运的爽文。让男女主自己玩去吧，什么？来惹我？我是好惹的吗？！ '),
(10,1,'阴谋鬼爱','云七七',32,100,500,'img/ymga.jpg','结婚后，丈夫出差久久未归。一个阴雨夜，我在浴室洗澡，一道寒冷的影子突然缠上我的身体……没多久，我便发现自己有了身孕…… '),
(11,1,'裴先生娶了个200斤的胖子以后','双囍PF',38,100,500,'img/fxsqyg200jdpzyh.jpg','27岁的天才美女医生夏清猝死在手术室了！她还重生了！重生在了她最熟悉的病房。重生在一个200斤的产妇身上。一个剖腹产不打麻药被疼死的产妇身上。除了年轻一无是处。这要夏清怎么忍？复复仇、减减肥，顺便抢抢渣女的心上人，真是与天斗与人斗，其乐无穷！小剧场：“你们听说了吗？裴总未婚生子，要结婚了！”“娶了谁？娶了谁？”“南城林家200那个胖子！”“二少疯了吗？”“这年头富家少爷都流行吃猪肉了？”林夏清侧头看着，“您嫌我胖？”裴正扬看着身姿丰满的女人，“不胖，手感刚好。”助理：裴总，带您去眼科可好？ '),
(11,1,'她的微笑像颗糖','休尹',30,100,500,'img/tdwxxkt.jpg','高二一班的徐静姝人冷话不多，若不是节节数学课被老师拎出去罚站，恐怕就是个班上的小透明。“静姝，又被老魏罚站了？”班主任老马领着转学生楚攸宁到班级门口时看到那熟悉的身影，无奈道。“嗯。”徐静姝不咸不淡地应了声，并没有因为有外人在场而感到难为情。后来一次月考，老魏看着徐静姝其他各科完美的成绩，再对照其数学卷几近空白的大题目，而这位当事人还事不关己地看窗外发呆，恨其不争地怒吼：“徐静姝，你给我拿着卷子出去反省!啥时候反省完再来上我的课!”于是，那日下午，有人看到学神楚攸宁在楼上的自习室里教徐静姝学数学……1V1，超甜! '),
(11,1,'她和年级第一我都要','图样先森',25,100,500,'img/thynjwdy.jpg','高一开学后，本市今年的双黄蛋中考状元被分在一个班十五岁的少男少女，男生俊秀挺拔，高岭之花；女生眉眼精致，乖巧大方但是一山不容二虎——“英语居然连140都考不到？垃圾。”“这种数学题，我一分钟能做十道，废物。”“这次我考第一，叫爸爸。”“老子数学物理单科全年级第一，谁给你的脸占老子便宜？”——除非一公一母。 ')

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

