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
    GotoProgress tGotoProgress;
}

@end

@implementation BaseBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bookIV = [[UIImageView alloc] initWithFrame:CGRectMake(kLeftMargin, 6, 40, 56)];
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
        self.authorLabel.textColor = [UIColor zijiang];
        self.authorLabel.top = self.titleLabel.bottom + 5;
        
        self.priceLabel = [labelArray objectAtIndex:2];
        self.priceLabel.textColor = [UIColor baolan];
        self.priceLabel.top = self.authorLabel.bottom + 5;
        
        self.progressView = [[DACircularProgressView  alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 10 - 50 , 10, 50, 50)];
        self.progressView.trackTintColor = [UIColor grayColor];
        self.progressView.progressTintColor = [UIColor orangeColor];
        [self addSubview:self.progressView];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = self.progressView.bounds;
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.progressView addSubview:btn];
        
    }
    return self;
}

- (void)tapProgressBlock:(GotoProgress)gotoProgressBlock {
    tGotoProgress = gotoProgressBlock;
}

- (void)btnPressed:(id)sender {
    tGotoProgress();
}

- (void)setProgress:(CGFloat)progress {
    self.progressView.progress = progress;
}

@end



