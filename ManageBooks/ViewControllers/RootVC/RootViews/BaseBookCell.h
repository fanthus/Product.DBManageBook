//
//  BaseBookCell.h
//  ManageBooks
//
//  Created by xiushanfan on 17/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DACircularProgressView.h"
#import "DALabeledCircularProgressView.h"

#define kBaseBookCellHeight  70


typedef void(^GotoProgress)(void);

@interface BaseBookCell : UITableViewCell
//----
@property (nonatomic, strong) UIImageView *bookIV;          //书封面
@property (nonatomic, strong) UILabel *titleLabel;          //书名
@property (nonatomic, strong) UILabel *authorLabel;         //作者&出版社
@property (nonatomic, strong) UILabel *priceLabel;          //价格标签
@property (nonatomic, strong) DACircularProgressView *progressView;

@property (nonatomic, assign) CGFloat progress;


//设置点击进度图的 block 事件.
- (void)tapProgressBlock:(GotoProgress)gotoProgressBlock;


@end

