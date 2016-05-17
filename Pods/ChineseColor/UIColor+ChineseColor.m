//
//  UIColor+ChineseColor.m
//  chinacolor
//
//  Created by linxiangyu on 13-11-26.
//  Copyright (c) 2013年 linxiangyu. All rights reserved.
//

#import "UIColor+ChineseColor.h"


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation UIColor (ChineseColor)




//粉红
//粉红，即浅红色。别称：妃色杨妃色湘妃色妃红色。
+(UIColor *)fenhong{
    return UIColorFromRGB(0XFFB3A7);
}

//妃色
//妃红色：古同“绯”，粉红色。杨妃色 湘妃色 粉红皆同义。
+(UIColor *)feise{
    return UIColorFromRGB(0XED5736);
}

//品红
//品红：比大红浅的红色。
+(UIColor *)pinhong{
    return UIColorFromRGB(0XF00056);
}

//桃红
//桃红，桃花的颜色，比粉红略鲜润的颜色。
+(UIColor *)taohong{
    return UIColorFromRGB(0XF47983);
}

//海棠红
//海棠红，淡紫红色、较桃红色深一些，是非常妩媚娇艳的颜色。
+(UIColor *)haitanghong{
    return UIColorFromRGB(0XDB5A6B);
}

//石榴红
//石榴红：石榴花的颜色，高色度和纯度的红色。
+(UIColor *)shiliuhong{
    return UIColorFromRGB(0XF20C00);
}

//樱桃色
//樱桃色：鲜红色。
+(UIColor *)yingtaose{
    return UIColorFromRGB(0XC93756);
}

//银红
//银红：银朱和粉红色颜料配成的颜色。多用来形容有光泽的各种红色，尤指有光泽浅红。
+(UIColor *)yinhong{
    return UIColorFromRGB(0XF05654);
}

//大红
//大红：正红色，三原色中的红，传统的中国红，又称绛色。
+(UIColor *)dahong{
    return UIColorFromRGB(0XFF2121);
}

//绛紫
//绛紫：紫中略带红的颜色。
+(UIColor *)jiangzi{
    return UIColorFromRGB(0X8C4356);
}

//绯红
//绯红：艳丽的深红。
+(UIColor *)feihong{
    return UIColorFromRGB(0XC83C23);
}

//胭脂
//胭脂：1，女子装扮时用的胭脂的颜色。 2，国画暗红色颜料 。
+(UIColor *)yanzhi{
    return UIColorFromRGB(0X9D2933);
}

//朱红
//朱红：朱砂的颜色，比大红活泼，也称铅朱朱色丹色。
+(UIColor *)zhuhong{
    return UIColorFromRGB(0XFF4C00);
}

//丹
//丹：丹砂的鲜艳红色
+(UIColor *)dan{
    return UIColorFromRGB(0XFF4E20);
}

//彤
//彤：赤色。
+(UIColor *)tong{
    return UIColorFromRGB(0XF35336);
}

//茜色
//茜色：茜草染的色彩，呈深红色。
+(UIColor *)qianse{
    return UIColorFromRGB(0XCB3A56);
}

//火红
//火红：火焰的红色，赤色。
+(UIColor *)huohong{
    return UIColorFromRGB(0XFF2D51);
}

//赫赤
//赫赤：深红，火红。泛指赤色、火红色。
+(UIColor *)hechi{
    return UIColorFromRGB(0XC91F37);
}

//嫣红
//嫣红：鲜艳的红色。
+(UIColor *)yanhong{
    return UIColorFromRGB(0XEF7A82);
}

//洋红
//洋红：色橘红。
+(UIColor *)yanghong{
    return UIColorFromRGB(0XFF0097);
}

//炎
//炎：引申为红色。
+(UIColor *)yan{
    return UIColorFromRGB(0XFF3300);
}

//赤
//赤：本义火的颜色，即红色。
+(UIColor *)chi{
    return UIColorFromRGB(0XC3272B);
}

//绾
//绾：绛色；浅绛色。
+(UIColor *)wan{
    return UIColorFromRGB(0XA98175);
}

//枣红
//枣红：即深红
+(UIColor *)zaohong{
    return UIColorFromRGB(0XC32136);
}

//檀
//檀：浅红色，浅绛色。
+(UIColor *)tan{
    return UIColorFromRGB(0XB36D61);
}

//殷红
//殷红：发黑的红色。
+(UIColor *)yinhong1{
    return UIColorFromRGB(0XBE002F);
}

//酡红
//酡红：像饮酒后脸上泛现的红色，泛指脸红
+(UIColor *)tuohong{
    return UIColorFromRGB(0XDC3023);
}

//酡颜
//酡颜：饮酒脸红的样子。亦泛指脸红色
+(UIColor *)tuoyan{
    return UIColorFromRGB(0XF9906F);
}

//鹅黄
//鹅黄：淡黄色。
+(UIColor *)ehuang{
    return UIColorFromRGB(0XFFF143);
}

//鸭黄
//鸭黄：小鸭毛的黄色。
+(UIColor *)yahuang{
    return UIColorFromRGB(0XFAFF72);
}

//樱草色
//樱草色：淡黄色。
+(UIColor *)yingcaose{
    return UIColorFromRGB(0XEAFF56);
}

//杏黄
//杏黄：成熟杏子的黄色。
+(UIColor *)xinghuang{
    return UIColorFromRGB(0XFFA631);
}

//杏红
//杏红：成熟杏子偏红色的一种颜色。
+(UIColor *)xinghong{
    return UIColorFromRGB(0XFF8C31);
}

//橘黄
//橘黄：柑橘的黄色。
+(UIColor *)juhuang{
    return UIColorFromRGB(0XFF8936);
}

//橙黄
//橙黄：橙的黄色。 （现代感比较强。广告上用得较多）
+(UIColor *)chenghuang{
    return UIColorFromRGB(0XFFA400);
}

//橘红
//橘红：柑橘皮所呈现的红色
+(UIColor *)juhong{
    return UIColorFromRGB(0XFF7500);
}

//姜黄
//姜黄：中药名。别名黄姜。为姜科植物姜黄的根茎。又指人脸色不正,呈黄白色。
+(UIColor *)jianghuang{
    return UIColorFromRGB(0XFFC773);
}

//缃色
//缃色：浅黄色。
+(UIColor *)xiangse{
    return UIColorFromRGB(0XF0C239);
}

//橙色
//橙色：界于红色和黄色之间的混合色。
+(UIColor *)chengse{
    return UIColorFromRGB(0XFA8C35);
}

//茶色
//茶色：一种比栗色稍红的棕橙色至浅棕色。
+(UIColor *)chase{
    return UIColorFromRGB(0XB35C44);
}

//驼色
//驼色：一种比哢叽色稍红而微淡、比肉桂色黄而稍淡和比核桃棕色黄而暗的浅黄棕色。
+(UIColor *)tuose{
    return UIColorFromRGB(0XA88462);
}

//昏黄
//昏黄：形容天色、灯光等呈幽暗的黄色。
+(UIColor *)hunhuang{
    return UIColorFromRGB(0XC89B40);
}

//栗色
//栗色：栗壳的颜色。即紫黑色。
+(UIColor *)lise{
    return UIColorFromRGB(0X60281E);
}

//棕色
//棕色：棕毛的颜色,即褐色。 1，在红色和黄色之间的任何一种颜色2，适中的暗淡和适度的浅黑。
+(UIColor *)zongse{
    return UIColorFromRGB(0XB25D25);
}

//棕绿
//棕绿：绿中泛棕色的一种颜色。
+(UIColor *)zonglv{
    return UIColorFromRGB(0X827100);
}

//棕黑
//棕黑：深​​棕色。
+(UIColor *)zonghei{
    return UIColorFromRGB(0X7C4B00);
}

//棕红
//棕红：红褐色。
+(UIColor *)zonghong{
    return UIColorFromRGB(0X9B4400);
}

//棕黄
//棕黄：浅褐色。
+(UIColor *)zonghuang{
    return UIColorFromRGB(0XAE7000);
}

//赭色
//赭色：红色、赤红色。古人用以饰面。
+(UIColor *)zhese{
    return UIColorFromRGB(0X955539);
}

//琥珀
//
+(UIColor *)hupo{
    return UIColorFromRGB(0XCA6924);
}

//褐色
//褐色： 黄黑色
+(UIColor *)hese{
    return UIColorFromRGB(0X6E511E);
}

//枯黄
//枯黄：干枯焦黄。
+(UIColor *)kuhuang{
    return UIColorFromRGB(0XD3B17D);
}

//黄栌
//黄栌：一种落叶灌木，花黄绿色,叶子秋天变成红色。木材黄色可做染料。
+(UIColor *)huanglu{
    return UIColorFromRGB(0XE29C45);
}

//秋色
//秋色：1，中常橄榄棕色,它比一般橄榄棕色稍暗,且稍稍绿些。 2，古以秋为金,其色白,故代指白色。
+(UIColor *)qiuse{
    return UIColorFromRGB(0X896C39);
}

//秋香色
//秋香色：浅橄榄色浅黄绿色。 （注：直接在Y中掺入k10~30可得到不同浓淡的该类色彩）
+(UIColor *)qiuxiangse{
    return UIColorFromRGB(0XD9B611);
}

//嫩绿
//嫩绿：像刚长出的嫩叶的浅绿色
+(UIColor *)nenlv{
    return UIColorFromRGB(0XBDDD22);
}

//柳黄
//柳黄：像柳树芽那样的浅黄色
+(UIColor *)liuhuang{
    return UIColorFromRGB(0XC9DD22);
}

//柳绿
//柳绿：柳叶的青绿色
+(UIColor *)liulv{
    return UIColorFromRGB(0XAFDD22);
}

//竹青
//竹青：竹子的绿色
+(UIColor *)zhuqing{
    return UIColorFromRGB(0X789262);
}

//葱黄
//葱黄：黄绿色，嫩黄色
+(UIColor *)conghuang{
    return UIColorFromRGB(0XA3D900);
}

//葱绿
//葱绿：1，浅绿又略显微黄的颜色2，草木青翠的样子
+(UIColor *)conglv{
    return UIColorFromRGB(0X9ED900);
}

//葱青
//葱青：淡淡的青绿色
+(UIColor *)congqing{
    return UIColorFromRGB(0X0EB83A);
}

//青葱
//青葱：翠绿色,形容植物浓绿
+(UIColor *)qingcong{
    return UIColorFromRGB(0X0AA344);
}

//油绿
//油绿：光润而浓绿的颜色。以上几种绿色都是明亮可爱的色彩。
+(UIColor *)youlv{
    return UIColorFromRGB(0X00BC12);
}

//绿沉
//绿沉：深绿
+(UIColor *)lvchen{
    return UIColorFromRGB(0X0C8918);
}

//碧色
//碧色：1，青绿色。 2，青白色,浅蓝色。
+(UIColor *)bise{
    return UIColorFromRGB(0X1BD1A5);
}

//碧绿
//碧绿：鲜艳的青绿色
+(UIColor *)bilv{
    return UIColorFromRGB(0X2ADD9C);
}

//青碧
//青碧：鲜艳的青蓝色
+(UIColor *)qingbi{
    return UIColorFromRGB(0X48C0A3);
}

//翡翠色
//翡翠色：1，翡翠鸟羽毛的青绿色。 2，翡翠宝石的颜色。 (注：C-Y≧30的系列色彩，多与白色配合以体现清新明丽感觉，与黑色配合效果不好：该色个性柔弱，会被黑色牵制)
+(UIColor *)feicuise{
    return UIColorFromRGB(0X3DE1AD);
}

//草绿
//草绿：绿而略黄的颜色。
+(UIColor *)caolv{
    return UIColorFromRGB(0X40DE5A);
}

//青色
//青色：1，一类带绿的蓝色,中等深浅,高度饱和。 3，本义是蓝色。 4，一般指深绿色。 5，也指黑色。 6，四色印刷中的一色。 2，特指三补色中的一色。
+(UIColor *)qingse{
    return UIColorFromRGB(0X00E09E);
}

//青翠
//青翠：鲜绿
+(UIColor *)qingcui{
    return UIColorFromRGB(0X00E079);
}

//青白
//青白：白而发青,尤指脸没有血色
+(UIColor *)qingbai{
    return UIColorFromRGB(0XC0EBD7);
}

//鸭卵青
//鸭卵青：淡青灰色，极淡的青绿色
+(UIColor *)yaluanqing{
    return UIColorFromRGB(0XE0EEE8);
}

//蟹壳青
//蟹壳青：深灰绿色
+(UIColor *)xiekeqing{
    return UIColorFromRGB(0XBBCDC5);
}

//鸦青
//鸦青：鸦羽的颜色。即黑而带有紫绿光的颜色。
+(UIColor *)yaqing{
    return UIColorFromRGB(0X424C50);
}

//绿色
//绿色：1，在光谱中介于蓝与黄之间的那种颜色。 2，本义：青中带黄的颜色。 3，引申为黑色，如绿鬓：乌黑而光亮的鬓发。代指为青春年少的容颜。
+(UIColor *)lvse{
    return UIColorFromRGB(0X00E500);
}

//豆绿
//豆绿：浅黄绿色
+(UIColor *)doulv{
    return UIColorFromRGB(0X9ED048);
}

//豆青
//豆青：浅青绿色
+(UIColor *)douqing{
    return UIColorFromRGB(0X96CE54);
}

//石青
//石青：淡灰绿色
+(UIColor *)shiqing{
    return UIColorFromRGB(0X7BCFA6);
}

//玉色
//玉色：玉的颜色，高雅的淡绿、淡青色
+(UIColor *)yuse{
    return UIColorFromRGB(0X7BCFA6);
}

//缥
//缥：绿色而微白
+(UIColor *)piao{
    return UIColorFromRGB(0X7FECAD);
}

//艾绿
//艾绿：艾草的颜色。偏苍白的绿色。
+(UIColor *)ailv{
    return UIColorFromRGB(0XA4E2C6);
}

//松柏绿
//松柏绿：经冬松柏叶的深绿
+(UIColor *)songbailv{
    return UIColorFromRGB(0X21A675);
}

//松花绿
//松花绿：亦作“松花”、“松绿”。偏黑的深绿色,墨绿。
+(UIColor *)songhualv{
    return UIColorFromRGB(0X057748);
}

//松花色
//松花色：浅黄绿色。 （松树花粉的颜色）《红楼梦》中提及松花配桃红为娇艳
+(UIColor *)songhuase{
    return UIColorFromRGB(0XBCE672);
}

//蓝
//蓝：三原色的一种。像晴天天空的颜色（注：这里的蓝色指的不是RGB色彩中的B，而是CMY色彩中的C）

+(UIColor *)lan{
    return UIColorFromRGB(0X44CEF6);
}

//靛青
//靛青：也叫“蓝靛”。用蓼蓝叶泡水调和与石灰沉淀所得的蓝色染料。呈深蓝绿色（注：有些地方将蓝墨水称为“靛水”或者“兰靛水”）
+(UIColor *)dianqing{
    return UIColorFromRGB(0X177CB0);
}

//靛蓝
//靛蓝：由植物(例如靛蓝或菘蓝属植物)得到的蓝色染料
+(UIColor *)dianlan{
    return UIColorFromRGB(0X065279);
}

//碧蓝
//碧蓝：青蓝色
+(UIColor *)bilan{
    return UIColorFromRGB(0X3EEDE7);
}

//蔚蓝
//蔚蓝：类似晴朗天空的颜色的一种蓝色
+(UIColor *)weilan{
    return UIColorFromRGB(0X70F3FF);
}

//宝蓝
//宝蓝：鲜艳明亮的蓝色（注：英文中为RoyalBlue即皇家蓝色，是皇室选用的色彩，多和小面积纯黄色（金色）配合使用。 ）
+(UIColor *)baolan{
    return UIColorFromRGB(0X4B5CC4);
}

//蓝灰色
//蓝灰色：一种近于灰略带蓝的深灰色
+(UIColor *)lanhuise{
    return UIColorFromRGB(0XA1AFC9);
}

//藏青
//藏青：蓝而近黑
+(UIColor *)cangqing{
    return UIColorFromRGB(0X2E4E7E);
}

//藏蓝
//藏蓝：蓝里略透红色
+(UIColor *)canglan{
    return UIColorFromRGB(0X3B2E7E);
}

//黛
//黛：青黑色的颜料。古代女子用以画眉。
+(UIColor *)dai{
    return UIColorFromRGB(0X4A4266);
}

//黛绿
//黛绿：墨绿。
+(UIColor *)dailv{
    return UIColorFromRGB(0X426666);
}

//黛蓝
//黛蓝：深蓝色
+(UIColor *)dailan{
    return UIColorFromRGB(0X425066);
}

//黛紫
//黛紫：深紫色
+(UIColor *)daizi{
    return UIColorFromRGB(0X574266);
}

//紫色
//紫色：蓝和红组成的颜色。古人以紫为祥瑞的颜色。代指与帝王、皇宫有关的事物。
+(UIColor *)zise{
    return UIColorFromRGB(0X8D4BBB);
}

//紫酱
//紫酱：浑浊的紫色
+(UIColor *)zijiang{
    return UIColorFromRGB(0X815463);
}

//酱紫
//酱紫：紫中略带红的颜色
+(UIColor *)jiangzi1{
    return UIColorFromRGB(0X815476);
}

//紫檀
//紫檀：檀木的颜色，也称乌檀色乌木色
+(UIColor *)zitan{
    return UIColorFromRGB(0X4C221B);
}

//绀青
//绀青绀紫：纯度较低的深紫色
+(UIColor *)ganqing{
    return UIColorFromRGB(0X003371);
}

//紫棠
//紫棠：黑红色
+(UIColor *)zitang{
    return UIColorFromRGB(0X56004F);
}

//青莲
//青莲：偏蓝的紫色
+(UIColor *)qinglian{
    return UIColorFromRGB(0X801DAE);
}

//群青
//群青：深蓝色
+(UIColor *)qunqing{
    return UIColorFromRGB(0X4C8DAE);
}

//雪青
//雪青：浅蓝紫色
+(UIColor *)xueqing{
    return UIColorFromRGB(0XB0A4E3);
}

//丁香色
//丁香色：紫丁香的颜色，浅浅的紫色，很娇柔淡雅的色彩
+(UIColor *)dingxiangse{
    return UIColorFromRGB(0XCCA4E3);
}

//藕色
//藕色：浅灰而略带红的颜色
+(UIColor *)ouse{
    return UIColorFromRGB(0XEDD1D8);
}

//藕荷色
//藕荷色：浅紫而略带红的颜色
+(UIColor *)ouhese{
    return UIColorFromRGB(0XE4C6D0);
}

//苍色
//苍色：即各种颜色掺入黑色后的颜色，如苍翠
+(UIColor *)cangse{
    return UIColorFromRGB(0X75878A);
}

//苍黄
//
+(UIColor *)canghuang{
    return UIColorFromRGB(0X519A73);
}

//苍青
//
+(UIColor *)cangqing1{
    return UIColorFromRGB(0XA29B7C);
}

//苍黑
//
+(UIColor *)canghei{
    return UIColorFromRGB(0X7397AB);
}

//苍白
//
+(UIColor *)cangbai{
    return UIColorFromRGB(0XD1D9E0);
}

//水色
//
+(UIColor *)shuise{
    return UIColorFromRGB(0X88ADA6);
}

//水红
//
+(UIColor *)shuihong{
    return UIColorFromRGB(0XF3D3E7);
}

//水绿
//
+(UIColor *)shuilv{
    return UIColorFromRGB(0XD4F2E7);
}

//水蓝
//
+(UIColor *)shuilan{
    return UIColorFromRGB(0XD2F0F4);
}

//淡青
//
+(UIColor *)danqing{
    return UIColorFromRGB(0XD3E0F3);
}

//湖蓝
//
+(UIColor *)hulan{
    return UIColorFromRGB(0X30DFF3);
}

//湖绿
//
+(UIColor *)hulv{
    return UIColorFromRGB(0X25F8CB);
}

//精白
//精白：纯白，洁白，净白，粉白。
+(UIColor *)jingbai{
    return UIColorFromRGB(0XFFFFFF);
}

//像牙白
//像牙白：乳白色
+(UIColor *)xiangyabai{
    return UIColorFromRGB(0XFFFBF0);
}

//雪白
//雪白：如雪般洁白
+(UIColor *)xuebai{
    return UIColorFromRGB(0XF0FCFF);
}

//月白
//月白：淡蓝色
+(UIColor *)yuebai{
    return UIColorFromRGB(0XD6ECF0);
}

//缟
//缟：白色
+(UIColor *)gao{
    return UIColorFromRGB(0XF2ECDE);
}

//素
//素：白色，无色
+(UIColor *)su{
    return UIColorFromRGB(0XE0F0E9);
}

//荼白
//荼白：如荼之白色
+(UIColor *)tubai{
    return UIColorFromRGB(0XF3F9F1);
}

//霜色
//霜色：白霜的颜色
+(UIColor *)shuangse{
    return UIColorFromRGB(0XE9F1F6);
}

//花白
//花白：白色和黑色混杂的。斑白的 夹杂有灰色的白
+(UIColor *)huabai{
    return UIColorFromRGB(0XC2CCD0);
}

//鱼肚白
//鱼肚白：似鱼腹部的颜色，多指黎明时东方的天色颜色
+(UIColor *)yudubai{
    return UIColorFromRGB(0XFCEFE8);
}

//莹白
//莹白：晶莹洁白
+(UIColor *)yingbai{
    return UIColorFromRGB(0XE3F9FD);
}

//灰色
//灰色：黑色和白色混和成的一种颜色
+(UIColor *)huise{
    return UIColorFromRGB(0X808080);
}

//牙色
//牙色：与像牙相似的淡黄色（注：暖白）
+(UIColor *)yase{
    return UIColorFromRGB(0XEEDEB0);
}

//铅白
//铅白：铅粉的白色。铅粉，国画颜料，日久易氧化“返铅”变黑。铅粉在古时用以搽脸的化妆品。 （注：冷白）

+(UIColor *)qianbai{
    return UIColorFromRGB(0XF0F0F4);
}

//玄色
//玄色：赤黑色，黑中带红的颜色，又泛指黑色
+(UIColor *)xuanse{
    return UIColorFromRGB(0X622A1D);
}

//玄青
//玄青：深黑色
+(UIColor *)xuanqing{
    return UIColorFromRGB(0X3D3B4F);
}

//乌色
//乌色：暗而呈黑的颜色
+(UIColor *)wuse{
    return UIColorFromRGB(0X725E82);
}

//乌黑
//乌黑：深黑
+(UIColor *)wuhei{
    return UIColorFromRGB(0X392F41);
}

//漆黑
//漆黑：非常黑的
+(UIColor *)qihei{
    return UIColorFromRGB(0X161823);
}

//墨色
//墨色：即黑色
+(UIColor *)mose{
    return UIColorFromRGB(0X50616D);
}

//墨灰
//墨灰：即黑灰
+(UIColor *)mohui{
    return UIColorFromRGB(0X758A99);
}

//黑色
//黑色：亮度最低的非彩色的或消色差的物体的颜色；最暗的灰色；被认为特别属于那些既不能反射、又不能透过能使人感觉到的微小入射光的物体,任何亮度很低的物体颜色。
+(UIColor *)heise{
    return UIColorFromRGB(0X000000);
}

//缁色
//缁色：帛黑色
+(UIColor *)zise1{
    return UIColorFromRGB(0X493131);
}

//煤黑
//煤黑像牙黑：都是黑，不过有冷暖之分。
+(UIColor *)meihei{
    return UIColorFromRGB(0X312520);
}

//黧
//黧：黑中带黄的颜色
+(UIColor *)li{
    return UIColorFromRGB(0X5D513C);
}

//黎
//黎：黑中带黄似黎草色
+(UIColor *)li1{
    return UIColorFromRGB(0X75664D);
}

//黝
//黝：本义为淡黑色或微青黑色。
+(UIColor *)you{
    return UIColorFromRGB(0X6B6882);
}

//黝黑
//黝黑：（皮肤暴露在太阳光下而晒成的）青黑色
+(UIColor *)youhei{
    return UIColorFromRGB(0X665757);
}

//黯
//黯：深黑色、泛指黑色
+(UIColor *)an{
    return UIColorFromRGB(0X41555D);
}

//赤金
//赤金：足金的颜色
+(UIColor *)chijin{
    return UIColorFromRGB(0XF2BE45);
}

//金色
//金色：平均为深黄色带光泽的颜色
+(UIColor *)jinse{
    return UIColorFromRGB(0XEACD76);
}

//银白
//银白：带银光的白色
+(UIColor *)yinbai{
    return UIColorFromRGB(0XE9E7EF);
}

//铜绿
//
+(UIColor *)tonglv{
    return UIColorFromRGB(0X549688);
}

//乌金
//
+(UIColor *)wujin{
    return UIColorFromRGB(0XA78E44);
}

//老银
//老银：金属氧化后的色彩
+(UIColor *)laoyin{
    return UIColorFromRGB(0XBACAC6);
}


@end

#undef UIColorFromRGB
