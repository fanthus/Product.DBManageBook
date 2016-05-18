//
//  ReadTypeView.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "ReadTypeView.h"

#define kLeftMargin         10
#define kTopMargin          10
#define kMiddleMargin       20

@implementation ReadTypeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *btns = [NSMutableArray arrayWithCapacity:0];
        CGFloat buttonBorder = (SCREEN_WIDTH - kLeftMargin*2 - 2*kMiddleMargin)/3.0;
        for (int i = 0; i < 3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = ReadBaseTag + i;
            btn.frame = CGRectMake(kLeftMargin + i*kMiddleMargin + i*buttonBorder, kTopMargin, buttonBorder, buttonBorder);
            btn.layer.borderColor = [UIColor whiteColor].CGColor;
            btn.layer.cornerRadius = 50.0f;
            btn.layer.borderWidth = 3.0;
            [btn setTitleColor:[UIColor shiqing] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
            [btn setBackgroundColor:[UIColor yase]];
            [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
            [btns addObject:btn];
            [self addSubview:btn];
        }
        [((UIButton *)[btns objectAtIndex:0]) setTitle:@"想读" forState:UIControlStateNormal];
        [((UIButton *)[btns objectAtIndex:1]) setTitle:@"在读" forState:UIControlStateNormal];
        [((UIButton *)[btns objectAtIndex:2]) setTitle:@"读过" forState:UIControlStateNormal];
        
        self.size = CGSizeMake(SCREEN_WIDTH, buttonBorder + 20);
    }
    return self;
}

- (void)btnPressed:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(readType:)]) {
        [self.delegate readType:(ReayType)btn.tag];
    }
}

@end
