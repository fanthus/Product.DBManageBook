# UIColor+ChineseColor

加入中国传统颜色的UIColor Catalog


## Usage 

1. 将UIColor+ChineseColor.h与UIColor+ChineseColor.m加入你的项目路径

2. 使用 [UIColor 传统颜色拼音] 来得到 (UIColor *) 指针，如  [self.view setBackgroundColor:[UIColor dahong]];

3. 数据源来自 <http://ylbook.com/cms/web/chuantongsecai/chuantongsecai.htm> , 内容由`script/app.rb`抓取并生成Objective-C代码，一些第二次出现的的相同的传统颜色拼音后面加了一个`1`，如银红是 `[UIColor yinhong]` , 殷红是 `[UIColor yinhong1]`

4. 同时定义了  UIColorFromRGB(rgbValue)宏，可以用UIColorFromRGB(rgbValue)方便的根据16进制的色值来得到UIColor对象