SET NAMES 'utf8';
DROP DATABASE IF EXISTS kaifanla;
CREATE DATABASE kaifanla CHARSET=UTF8;
USE kaifanla;

CREATE TABLE ac_goods(
    did INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    price FLOAT(6,2),
    img_sm VARCHAR(64),
    img_lg VARCHAR(64),
    detail VARCHAR(2048),
    material VARCHAR(2048)
);
INSERT INTO ac_goods(did,img_sm,img_lg,name,price,material,detail) VALUES
(   null,
    'p1.jpg',
    'p1-l.jpg',
    '【AcFun礼物福袋】',
    99,
    '福袋内置物品随即哦：AcFun日历、T恤衫、徽章、书签、鼠标垫等',
    'AC娘手动挑选打包的福袋 绝对是超值啦~如果您许愿想得到衣服或者手机壳，请备注留言您的尺码，否则随机发货~福袋售出不退不换，不参与其他优惠活动!~~~福袋改变命运，氪金改变血统！来不及做图了，司机们快上车！'
),
(   null,
    'p2.jpg',
    'p2-l.jpg',
    '【AcFun徽章】',
    5.5,
    '徽章由铝合金制成,同时表面进行美工加工,目前又5种不同款式的徽章',
    'ACFUN官方周边－A站徽章AC、TD、芦苇、趋势、ac猴这5款不同样式的徽章，下单购买后款式可以选择随机发，也可以选择个人喜欢的款式，据说集齐5枚AC徽章就可以获得一个神秘奖励，也不知道是真的还是假的，心动不如行动，证明你是一个合格的acer吧！'
),
(   null,
    'p3.jpg',
    'p3-l.jpg',
    '【AcFun包子头】',
    39,
    '包子头主要由布料制成,主体颜色为蓝白色,手感很舒适！',
    'ACFUN官方周边－A站AcFun包子头，啊少年，恭喜你打败守关boss，通关关卡。现在拾起boss掉落的物品，戴上包子头，成为马猴烧酒的一员，感受acer的神秘力量吧！（也适合小孩穿戴，萌孩必备！）'
),
(   null,
    'p4.jpg',
    'p4-l.jpg',
    '【AcFun教父手机壳】',
    49.9,
    '手机壳主要是由塑料制成的,主体颜色为黑色,带有AcFun特有logo',
    'ACFUN官方周边－A站教父手机壳－硬壳浮雕手机壳，磨砂的质感＋黑色特有的神秘感，给你带来不一眼的感官。此手机壳十分酷炫，同时质量很不错，耐摔，适合广大男女同胞使用！目前适配的手机机型为Apple/苹果，颜色分类有6/6s,型号为JFK，欢迎选择购买！'
),
(   null,
    'p5.jpg',
    'p5-l.jpg',
    '【AcFun夏日休闲布袋】',
    35,
    '夏日休闲布袋才用的是棉麻材质,手感十分的舒适,同时布袋封面的logo上色十分精致',
    'ACFUN官方－AcFun夏日休闲布袋单肩手拎袋环保袋，A站周边，十分适合学生党，尤其是女生们入手，画面可爱，内置多个收纳格子，平时上下课可以放置课本，出门购物也能存放钱包和多种饰品，而且布袋上色十分柔和，拥有特有的acfun的logo，也具有很大的收藏价值！'
),
(   null,
    'p6.jpg',
    'p6-l.jpg',
    '【AcFun专属笔记本】',
    15,
    '封面材质:普通纸,颜色分类:白本-空白页/蓝本-有线,装订方式: 胶钉式装订',
    '【现货】ACFUN官方周边-A站笔记本、ac小本子 蓝本白本二色可选择入手,风格主体为人物、小清新、简约、创意潮流。少年，这是你掉落的本子吗？如果你厌恶谁，就可以把名字写上去。（反正也不会怎么样，哈哈哈）'
),
(   null,
    'p7.jpg',
    'p7-l.jpg',
    '【AcFun便携手摇扇】',
    5,
    '扇面材质: 塑料,扇骨材质: 塑料,形状: 圆形',
    'ACFUN官方周边-AC圆扇中长柄手持便携扇、清凉手摇扇－这把扇子是去年猴子不知道从什么地方挖出来的，会不会越扇越热呢。管他呢，反正扇面那密密麻麻的字就足够抢眼了；夏天快来了，acer们还不行动吗？'
),
(   null,
    'p8.jpg',
    'p8-l.jpg',
    '【AcFun官方版日历】',
    28,
    '制作材质为基础的硬质纸张，配色以红白色为主',
    'ACFUN官方周边-2017年A站台历、ac动漫台历,主体风格简约大气，收藏的同时也可以随时查询日历获取临近的节假日和节气！－独白：算一算，自己成为acer已经好多日子了，新的一年，也要拜托大家多多照顾了！'
);

##SELECT * FROM ac_goods;

CREATE TABLE ac_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(16),
    user_name VARCHAR(16),
    sex INT,    /*1:男  2:女*/
    order_time LONG,
    addr VARCHAR(256),
    did INT
);
INSERT INTO ac_order(oid, phone,user_name,sex,order_time,addr,did) VALUES
(NULL,'13501234567','顿梁',1,1445154859209,'大钟寺中鼎B座',3),
(NULL,'15757135712','董卓',1,1445254959209,'余杭区大别小区33幢102室',2),
(NULL,'15757135739','任笑笑',1,1445354959209,'江阴中天mcc写字楼',5);

##SELECT * FROM ac_order;