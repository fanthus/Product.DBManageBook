//
//  BaseBookCell.m
//  ManageBooks
//
//  Created by xiushanfan on 17/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BaseBookCell.h"

#define kLeftMargin     10
#define kTopMargin      10
#define kBottomMargin   10
#define kRightMargin    10

@interface BaseBookCell() {
    
}

@end

@implementation BaseBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bookIV = [[UIImageView alloc] initWithFrame:CGRectMake(kLeftMargin, kTopMargin, 60, kBaseBookCellHeight - kTopMargin - kBottomMargin)];
        [self addSubview:self.bookIV];
        
        NSMutableArray *labelArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 3; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.bookIV.right + 10, 0, SCREEN_WIDTH - 10  - self.bookIV.right + 10, 15)];
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont systemFontOfSize:13.0f];
            [self addSubview:label];
            [labelArray addObject:label];
        }
        self.titleLabel = [labelArray objectAtIndex:0];
        self.titleLabel.top = kTopMargin;
        
        self.authorLabel = [labelArray objectAtIndex:1];
        self.authorLabel.top = self.titleLabel.bottom + 5;
        
        self.priceLabel = [labelArray objectAtIndex:2];
        self.priceLabel.top = self.authorLabel.bottom + 5;
    }
    return self;
}

@end
