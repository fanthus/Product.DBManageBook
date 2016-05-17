//
//  BaseBookCell.h
//  ManageBooks
//
//  Created by xiushanfan on 17/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBaseBookCellHeight  70

@interface BaseBookCell : UITableViewCell

@property (nonatomic, strong) UIImageView *bookIV;          //书封面
@property (nonatomic, strong) UILabel *titleLabel;          //书名
@property (nonatomic, strong) UILabel *authorLabel;         //作者&出版社
@property (nonatomic, strong) UILabel *priceLabel;          //价格标签

@end
