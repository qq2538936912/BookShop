-- �������ݿ�
create database  bookShop
go

use bookShop;

-- ��������Ա��
create table book_admin
 (
    [uid] int identity ,							--����ID
    [user] varchar(32) not null,					--����Ա�˺�
    [password] varchar(16) not null,				--����Ա����'
	state int default 1,							--״̬��1 ��ʾ������0 ��ʾɾ��
    createtime datetime default getdate() not null,	--����ʱ��
    primary key (uid),
	unique([user])
);

-- �û���
create table  book_user
 (
	userno int identity,							--����id
    username varchar(100) not null,					--�û���
    userpass varchar(16) not null,					--�û�����
	phone varchar(13) not null,						--�ֻ��ţ�Ψһ
	state int default 1,							--״̬��1 ��ʾ������0 ��ʾɾ��
    createtime datetime default getdate() not null, --����ʱ��
    primary key (userno),
    unique (phone),
);

-- ��Ա��ϸ��Ϣ
create table book_member
 (
    profileNo int identity,					--����id
	userNo int not null,					--������û����
	phone varchar(13) not null,				--�ֻ���
	name varchar(100) not null,				--����
	sex char(2) not null,					--�Ա�
	birthday date not null,					--����
	grade int default 1,					--�ȼ� Ĭ�� lv1 ��
	state int default 1,					--״̬��1 ��ʾ������0 ��ʾɾ��
    createtime datetime default getDate()	--����ʱ��
    primary key (profileNo),
    foreign key (userNO) references book_user(userNO),
)

-- �鼮������
create table book_region
(
	rid int identity primary key,		--���
	region varchar(100) not null,		--����
	created datetime default getdate()	--����ʱ��
);

-- �鼮���ͱ�
create table book_type
(
    typeNo int identity,							--����id
    name varchar(32) not null,						--��������
    createtime datetime default getDate() not null	--����ʱ��
    primary key (typeNO)
)


-- �鼮��Ʒ��
create table book_commodity
(
    productNo int identity,					--���id
    typeNo int,								--����id
	rid int,								--�������id
    bookName varchar(200) not null,			--ͼ������
	author varchar(100) not null,			--����
    price money not null,					--���ۼ۸�
	buyCount int,							--��������
	stock int not null,						--���
    cover varchar(200) not null	,			--����ͼ
	content varchar(2000),					--ͼ����
	state int default 1 not null,			--״̬��1 ��ʾ�ϼܣ�2 ��ʾ�¼� 0 ��ʾɾ��
    createtime datetime default getdate()	--����ʱ��
    primary key (productNO),
	foreign key (typeNO) references book_type(typeNo),
	foreign key (rid) references book_region(rid),
)


--���ﳵ��
create table book_cart
(
	cartNo int identity,						--���ﳵid
	productNo int,								--��Ʒid(�鼮���)
	userNo int,									--�û�id
	booknum int not null default 0,				--���빺�ﳵ����Ʒ����
	cprice money not null default 0.00,			--���빺�ﳵʱ�ļ۸�
	created date not null default getdate(),	--����ʱ��
	primary key (cartNo),
    foreign key (productNo) references book_commodity(productNo),
	foreign key (userNo) references book_user(userNo),
)


--�û��ջ���ַ��
create table user_address
(
	addressNo int identity,					--��ַ���
	userNo int,								--�û� id
	consignee varchar(100) not null,		--�ջ���
	detail_address varchar(300) not null,	--�ջ���ϸ��ַ
	tel varchar(11) not null,				--�ջ����ֻ���
	created datetime not null default getdate(),
	primary key (addressNo),
	foreign key (userNo) references book_user(userNo),

);


--������
create table book_order
(
	orderNo int identity,					--�������
	userNo int not null,					--�û����
	productNo int not null,					--�鼮��Ʒ���
	addressNo int not null,					--�ջ���ַ���
	payment_number int not null,			--֧����ʽ ,1 ΢�ţ�2 ֧����
	productnum int not null,				--�鼮��Ʒ����
	amount money default 0,					--�����ܼ�
	status int default 1,					--����״̬ 0ȡ�����1��������2���ջ���3�����
	remarks varchar(1000),					--������ע
	createTime datetime default getdate()	--����ʱ��
	primary key (orderNo),
    foreign key (productNo) references book_commodity(productNo),
	foreign key (userNo) references book_user(userNo),
    foreign key (addressNo) references user_address(addressNo),
)


--��������

insert into book_admin([user], password) values('admin', '123456'),('admin2', '123456');

insert into book_user(username,userpass,phone) values('tom','123456','110'),('jok','123456','120');

insert into book_member(userNO,phone,name,sex,birthday) values(1,'110','����','��','2020-01-01'),(1,'110','��˹','��','2020-01-01');

insert into book_region(region) values('��½'),('����')

insert into book_type(name) values('��־'),('����'),('����'),('����'),('���'),('У԰'),('�ƻ�'),('�ִ�����'),('�Ŵ�����'),('��������'),('�ഺУ԰');

insert into book_commodity(typeNo,rid,bookName,author,price,buyCount,stock,cover,content)values
(1,1,'ѧϰ����','����Զ',25,100,500,'img/xxgs.jpg','��μ��䣬�����ι�����֪ʶ�㣿 ��θ�ϰ�����ܺ�ʵ����֪ʶ��ϵ�������ѧ������ʵ���������ɳ�����Щ���⣬��ѧϰ���֡��ﶼ�д𰸡�������һ��д�����ѧ���ͼҳ��ģ�������Чѧϰ�����ķ��������顣������Ϊ����Ү³�߷ֱ�ҵ��������Ƚ�������֪ʶ�������ѧϰ���飬ϵͳ�����˳�ʵ�õ�ѧϰ����ȫ���Ϊ5��ģ�顢30�ڴ�Ρ�100+���������������ѧϰ�ɼ�����������֡�'),
(1,1,'Ϊ������','���ӻ�',35,100,500,'img/wrsh.jpg','��Ϊ�����⣬�����ˡ�˵�����������ۣ����ݹŽ���ã�������ͨ������桢��Ƕȡ����εؽ�ʾΪ��������⣬�������ִ����������Ӧ�����յļ��ɺͲ��ԡ�ÿһ���������ʵĹ���ӳ�ճ������ԵĹ�ԣ��̸��������˵ļ�ֵ�����壻ÿһ����������ǳ����˵����˵���Ͱ������̲ص��ǻۺ�����������ֱ�ӡ���򵥡���ʵ�á�����Ч�ķ����������ǣ�������������ӹ������ܻ�ӭ������˵����ǡ���������˰���������������ɹ�����Ч��ߡ���ʮ���겻�ᣬ��ʮ�����£���ʮ����ڣ�'),
(1,1,'С���´������ȫ������ذ棩','����',36,100,200,'/img/xgsddl.jpg','���������ǻ۶����֡���С���´������ȫ�����е���ǧ����¶��ǴӺ����̺��ĳɹ�ѧ��������־�����������ģ�������������������򵥡�����ʵ�ķ�ʽ���ָ����ߣ��ö������׿����۵�������ֱ�����顣�������������ѡ���¿�ν��䡢����̡����÷�Χ��㷺��ÿ����º󻹸��ж�С���ٵ������������������ǣ�������ʡ���Ķ����飬�����ڻ���ǻ۵�ͬʱ�����򵽿��ֵ�����ֱ�У� '),
(2,1,'�������','����',28,100,500,'img/shzz.jpg','������½��ǿ��Ϊ��������������С�����ϣ�ǿ�ߺƴ���ɽ��������һЩ��ǿ�߿��������Ϻ�����ɽ��ʯ�����д���ͨ�߿�������գ�ն���ֻأ�ҽ�ƴ�ѧ��׿��ż���񶦴�Խ��һ������ү���ϣ����������޾��ĵ�����ƽӹ������һ����̤�������۷壬��Ϊ�˼�ʹ�����ҲҪ�����Ĵ��ڣ�'),
(2,1,'������','������',27,100,500,'img/wgsd.jpg','�˰���ǰ������֮����������������δ���޳�������ɱ����һ���콾���ʹ����䡣 �˰�������������»��˹�����ȴ��������ɱ������δ���ޣ� �Ѿ�ͳһ���ؽ磬���ٳ���һ����۹����ųơ�����Ů�ʡ��� ����Ů�ʡ���ͳ�����£����ٰ˷����ഺ��פ���������� ������վ����������⣬���ų���Ů�ʵ���������ȼ�������ܵĳ�����棬����������ʮ���꣬�ҽ�Ů���»�Ȫ������������ '),
(2,1,'�������ɴ�','����',30,100,500,'img/frxxz.jpg','һ����ͨɽ��С�ӣ�żȻ�½��뵽���ؽ���С���ɣ�����һ���������ӡ������������ݣ����������������,�����ƽӹ�����ʽ��뵽�����ߵ����У��Ӷ�Ц������֮�У����� ��λ���ѣ��������顶������������������������ϴ��ˣ���ӭ��Ҽ���֧��Ŷ�� '),
(3,1,'����֮����Ⱥ��','��������',30,100,500,'img/ytqx.jpg','�Һ��Ƿ�ȹ��ưݹ����ӣ��Һ����޼�����������Ҳ��Ⱥ�۴���ܣ������ҩʦ��ŷ����Լ�ڻ�ɽ֮�ۡ������޹��䣬����������Ҳ�ɹ�������λ�棬����ǿ�ߣ��������ҵĽ��¡���һ�����Ҷ�Ҫ������������ۣ�Ī���ȣ�����˵����Ҫ���ң���˵�ۻʽ�Ҫ���ҡ�������Ī������Ϯ����Ĵ�����£� '),
(3,1,'��ң��','����������',35,100,500,'img/xyp.jpg','һ��<�ϻ���>��һƪ<��ң��>���������¹�������������һ����ţ��á�ҩ����ָ�㣬�������ϻ�֮ͯ�����������졣һ���񹦴�ɣ������޵У��������ħ��������ͨ���������ħ�����֮λ���������꽭����Թ�ʹ�������������ң������Ĵ��������� '),
(3,1,'���콣��','����֮����',27,100,500,'img/ltjs.jpg','���ֵ�һ����賾����������������Ϊ���ϣ��书ȫʧ��������һ��֮�ʣ��賾ż�������񹦡����콣�������������ޣ��Ӵ�ͨ�����������ģ����⣬�ճ�һ���������г�ƪ�걾��Ʒ����֮�ۻʡ�����������𡷣���Ʒ�б�֤�� '),
(4,1,'���ɿ���','�ϵ�',30,100,500,'img/xxks.jpg','������ˮ�ȹ���ȴ�����һ���ƺ������滹�и��Գ�ʮ����ɢ�ɵ���ͷҪ���Լ������ӣ��������ƣ��������ܵ�����ô����׬Ǯô�������ô���������������� '),
(4,1,'��������','����ʯͷ��',32,100,500,'/img/jyzz.jpg','����������ն����⴩Խ���κ���������һ���ӣ������ҵ�����ż�����������񹭣��շ�����¯��̤ƽ�˽�˷����ɣ��ػ�����磬�ڵ��⽣Ӱ������թ�������۷壬�����ɵ�ãã������������һ�ŵ�������ֱ�ϣ�һ����ħ��������ѹ֮�У�����ֱ�ϡ��� '),
(4,1,'����','����',35,100,500,'img/zt.jpg','������ڰ��������������ž��Ӵ����ʬ����һ����ͭ�Źף�ب�ų��档��������̫��̽�����ڿݼŵ������в�׽����һ�������𺳵Ļ��档�����������ף������ǻص����Ϲţ������������ǿյı˰�������һ���ƴ���������磬���½�룬�����޾�����Ѫ�ƻ�ɽ���ڣ�������嫺���ӿ����������Ԩ��ֹ��������������·��̤���У���ָ���졣'),
(5,1,'��һ������ʼ�Ľ���','���¼�ѩ',37,100,500,'img/cyghksdjh.jpg','������������ħ��½�������һ��������������������أ�ͳ���ķ� ����������ѭ�Ŵ��ַ�����ս���ϡ���������������ϵͳ�󶨣���ʼ���������ͽ���������֮����Ԫ��֮��������֮��������֮������֧���ᴩǧ��λ�棬�����������飬������ǧ��ħ����֧��·��֮�������ǳ����ľ�����أ� '),
(5,1,'��ħ����','Ǭͼ',35,100,500,'img/dmcc.jpg','����Ϊ�ϲ������ʮ���굱����ҹ�����ò���������ɽ����ɱħ����Ϊ�����񣬲��������������޲ֻ�������һͷײ����Ũ�����ֵ�����֮�У�ȴ����õ����ڶ�ǿ�߼��䴫�С����Ӵ����������۷壬������ͨ���� '),
(5,1,'��è�ü�','����',33,100,500,'img/xmhj.jpg','���������Ұ���������ʷ����Ƿ��Ŀںţ��Դ�����⻷����Զ�����������������ޣ���Ҫ�����õ������ɣ� '),
(6,1,'��Ʒ�ƽ�ͫ','��ů���',38,100,500,'img/jphjt.jpg','����ԭ��ֻ��һ����ͨҽ�ƴ�ѧ��ѧ����żȻ����»��������֮�ۣ���˾�Ȼ����͸�ӵ��������Ӵ�Ԩ�㻯�����Ĳ�����ʯ����������֮��������������Ů���������������ֻش�����׬��СǮ��Ȣ��ϱ��������һ������Ů�����������ֱ��ͣ���������������εİڰ��ֵ��������ܰ���Ů�ǣ���ֻ��һ��ѧ���� '),
(6,1,'Ӣ������֮������˫','�Ķ�����',38,100,500,'img/jsws2.jpg','ʲô����˵Ӣ��������5V5����Ϸ�����ѵ���һֱ��1��9����Ϸ������¶����һ�����ر��顭���ѵ������Ĳ���ͬһ����Ϸ���� '),
(6,1,'У���Ľ�������','ҹ�ǻ�',40,100,500,'img/jsws.jpg','���ױ������������ַ�����ѧ�ڼ�ż��������ӵ���˴����������������������˫�����ʣ����������켶����Ǭ�����������˺��������ϣ�����·�Ͼ��ʷ׳ʣ���ɫ��Ů����������ַ�������Ҳ�������������������������ž������ܡ��� '),
(7,1,'ѧ�ԵĺڿƼ�ϵͳ','����LL',26,100,500,'img/hkj.jpg','��ϵͳ�������ܶ�Ǯ�𣿡������ܡ���������Ҫ����ã�������ϵͳ�����㵱��ѧ�ԣ��㻹ҪǮ��ɶ���� '),
(7,1,'���Ƕ���','��',25,100,500,'img/jxdn.jpg','����һ��������������ƽ�����硣��ͼ���Ǽ����ǳ衢�����ߴ���������괩�����Ľ����������̺���һ�����ص�������ͼ����Ϊһ��ϡ�е�ҽ��ϵ�����ߡ��������Ϊһ�����ֵĸ�����ȴ�����˹����˶���֮������һ�еĹ��£�Ҫ����һ���ƿ�ʼ˵��......**���ɸ�Ц����ӭ��ӡ� '),
(7,1,'����ĩ��������','���������',28,100,500,'img/wzmsjsx.jpg','ĩ�����������˼�����档�޹�Ա��ƣ����˱��ȳ���Ѱ��ʳ�Σ���з���ɥʬ��������ԣ����Լ��������Լ����ӡ������������ԣ�����+1���������ٶ����ԣ��ٶ�+1�������񵽱������ԣ�����Ѫ���������񵽺������ÿ�Ȫˮ��ƿ�������񵽰������䣬����ѺϽ�ǹһ�ѣ�������Ů���ҵģ�ʳ�����ҵģ���������ض����ҵģ�����ƿ������������ɥʬ��������𡣴Ӵˣ����¶��������ߣ������ޣ������ߵ�ʬ�塣 '),
(8,1,'����ү������','���¶�ѩ',30,100,500,'img/gqysgj.jpg','���ǳ��˴����ţ���ү����ʮ�����Сϱ�����ˣ����ˣ������Ӷ���Ҫ�ˣ�һʱ������������˵����ү�����ָ��䡢��������г����˵��Сϱ���ͱ��˺����ˣ���˵�Ƕ���̫��ĳ�죬С�����ҵ���Ҷ���ڣ�ί���Ͱͣ������ߣ��ְ�˵���ǳ������ġ������������ô������ôƯ���Ķ��ӡ���Ҷ���ںǺ�Ц���������ǡ��������еġ���С�������죺����������ʮ��ǰ�������������죻��ʮ�����������С���ӳ����졣�Ӵˣ�������ү��ü�����ϣ�Ψ��һ��'),
(8,1,'����֮����Ů��','���³���',30,100,500,'img/fcnw.jpg','΢��ըҩ�������ĸ����м�Ůͬ���ھ������촹��ʹ���ػ�ʮ���꣬ǰ��ų����΢������ۣ������ߵ��Ե����˲��塣��һ����Ƿ���ֺ�����һ��������Ҫ�ӱ��ֻء�Ű�����������������������ȴ���ǰ���һ�裺ԭ��Ϊ���Կ�͸�����˵��ģ�ȴ���������Ľ����в�С�Ķ����Լ����ģ���ǰ������˾����Ǹ������� '),
(8,1,'С�������','�����ĳ�',34,100,500,'img/xqwsy.jpg','����Ȩ�����졢���ɵй�����ҵ����ӣ�Ҳ�Ǵ�С������̱�ұ�����������������ӣ���������ȫ��������ĳ�Ц������������һ��������ʵ�Ļ��������ŷ��֣����Ĳз��ɷ���һͷ������Ƥ���ǣ�һ�����Σ�һ֧�ʣ���ȴ�ִ���Ȩ��Ķ��ˡ������ۼ�֤�������������ֶ����������������ļ��壬Ҳ��������������С�������µ����Э���飬���������ϵ�����������Ц��վ����������ȫ���綼֪�����Ǹ��зϣ�Ƣ���Ź֣������˵��������ˣ�����˭Ը����ң���������һ��̫ƽ��ӵ����ĵ绰��������涵����Ǻۣ�����˵�㲻���˵���ƭ�ӣ���ͨ����δ��������������ȴ͸���Ű崫�˹������ŵ���ɪɪ�������������ԣ�������Ը�������ȫ������֤��֤�����й�������������˵���������뿪�ģ�����������û˵��������������˵������������û˵��������������˵�ģ����������������ưɣ������ں�������������С����Ҳ���Ǻ��ǵģ��������ǹ����ͱ��븶�����ۣ���������֪������������ʲô�𣿡�������ʲô�����������¸ҡ��ҳϣ����С����Բ������������������� '),
(9,1,'�������','�ĳ���',27,100,500,'img/fgtx.jpg','��������ģ�׿����ԴӸ������ܣ�ÿ�춼�����Ե���ͷת��ġ���˵����������˺ÿ��ġ������أ�������Ϊ�������ˣ����������һ������������Ϊ�������ˣ����������һֻ�������Ϊ�Լ������ˣ��������������Ĳ����ˡ�����һ�����ӡ���ԡ�����������߹������������ؿռ䣬��̤������磬���˶�ȥ�ģ�����ʮ���ûأ�����ı���ģ���Ҫ�ٱ�������磬�����ɣ� '),
(9,1,'������������','��ǧī',29,100,500,'img/qfblwy.jpg','����ǰ���Ϲ�ǧ�������������˼ƣ�����ƣ���������ټƣ�Ҳ����õ�������˿���裡�������ﲻмƲ�죺�����������һ���俪��ϡ���㣿�����������������������ô���Ƥ���������ǹ��ˡ���ү����Ľڲ��أ����Ϲ�ǧ����ֱ��׳����������ǰ���ڲ��Զ����ߡ��� '),
(9,1,'а�۲��裺��ҽ��С��','������',28,100,500,'img/syjxj.jpg','С�壺�����ˣ�˭�������С�ĸΣ������ţ����㡣��ĳ��̳�ӣ����أ����ţ����ȿȣ����Ǵ��ĸΣ�����С�ĸ�~�����ǻ���ʥ�־��ţ�ҽ��˫����һ����Խ��ȴ�������˿�������ķ���С�㡣���Ű���������������֣���Ʒ��ҩ����������ӵ���ޣ�ӭȢа�ۣ�����˭�����Ǹ���� '),
(10,1,'��ҽ��Ů','MSܽ��',35,100,500,'img/syqn.jpg','����������ᣩҶ��ɵŮһ����������ӵ�����񶦣�������ֲ�ռ䣬���������˼����۵ķϲ���Ů��ҩ����˫����ҽҲҪ����վ����������Լ��������˼�����񶼺����ϴ� ��������������Ů�����������������������ˣ����������������ذٱ���֮������Ϊ�ˣ������߹���,����������а����Ѫ��������������ɱ�����ϵĹ��ۣ�ȴ���������޺��ĵй����ӡ��� '),
(10,1,'�촩֮Ů��Ҫ����','�ι���',36,100,500,'img/npybc.jpg','��Խ�ھ�������󣬸ı�Ů���ڻ����˵�ˬ�ġ�����Ů���Լ���ȥ�ɣ�ʲô�������ң����Ǻ��ǵ��𣿣� '),
(10,1,'��ı����','������',32,100,500,'img/ymga.jpg','�����ɷ����þ�δ�顣һ������ҹ������ԡ��ϴ�裬һ�������Ӱ��ͻȻ�����ҵ����塭��û��ã��ұ㷢���Լ��������С��� '),
(11,1,'������Ȣ�˸�200��������Ժ�','˫��PF',38,100,500,'img/fxsqyg200jdpzyh.jpg','27��������Ůҽ������������������ˣ����������ˣ���������������Ϥ�Ĳ�����������һ��200��Ĳ������ϡ�һ���ʸ���������ҩ�������Ĳ������ϡ���������һ���Ǵ�����Ҫ������ô�̣������𡢼����ʣ�˳��������Ů�������ˣ��������춷���˶����������С�糡����������˵��������δ�����ӣ�Ҫ����ˣ�����Ȣ��˭��Ȣ��˭�������ϳ��ּ�200�Ǹ����ӣ��������ٷ����𣿡�������ͷ������ү�����г������ˣ����������ͷ���ţ����������֣��������￴�����˷�����Ů�ˣ������֣��ָиպá������������ܣ�����ȥ�ۿƿɺã� '),
(11,1,'����΢Ц�����','����',30,100,500,'img/tdwxxkt.jpg','�߶�һ����쾲����仰���࣬�����ǽڽ���ѧ�α���ʦ���ȥ��վ�����¾��Ǹ����ϵ�С͸��������正��ֱ���κ��վ�ˣ�����������������תѧ�����������༶�ſ�ʱ��������Ϥ����Ӱ�����ε������š����쾲歲��̲�����Ӧ��������û����Ϊ�������ڳ����е���Ϊ�顣����һ���¿�����κ�����쾲��������������ĳɼ����ٶ�������ѧ�������հ׵Ĵ���Ŀ������λ�����˻��²��ؼ��ؿ����ⷢ�������䲻����ŭ�𣺡��쾲正���������ž��ӳ�ȥ��ʡ!ɶʱ��ʡ���������ҵĿ�!�����ǣ��������磬���˿���ѧ���������¥�ϵ���ϰ������쾲�ѧ��ѧ����1V1������! '),
(11,1,'�����꼶��һ�Ҷ�Ҫ','ͼ����ɭ',25,100,500,'img/thynjwdy.jpg','��һ��ѧ�󣬱��н����˫�Ƶ��п�״Ԫ������һ����ʮ�����������Ů����������ͦ�Σ�����֮����Ů��ü�۾��£����ɴ󷽵���һɽ���ݶ���������Ӣ���Ȼ��140��������������������������ѧ�⣬��һ��������ʮ���������������ҿ���һ���аְ֡�����������ѧ��������ȫ�꼶��һ��˭�������ռ���ӱ��ˣ�����������һ��һĸ�� ')

insert into book_cart(productNo,userNo,booknum,cprice) values(1,1,2,23),(1,1,2,24)

insert into user_address(userno,consignee,detail_address,tel) values(1,'admin','�㶫ʡ�麣�ж������׽����Ϸ�ITѧԺ',110),(1,'��˹','�㶫ʡ�麣�ж������׽����Ϸ�ITѧԺ',110);

insert into book_order(userno,productNo,addressNo,payment_number,productnum,amount,remarks) values(1,1,1,1,1,23,''),(1,1,1,1,1,25,'');

select typeNo  from book_type
group by typeNo

select * from book_type
left join book_commodity on book_type.typeNo= book_commodity.typeNo

select book_commodity.state from book_commodity
left join book_type on book_type.typeNo= book_commodity.typeNo
join book_region on book_commodity.rid = book_region.rid
order by book_type.typeNo offset 0 rows fetch next 5 rows only
