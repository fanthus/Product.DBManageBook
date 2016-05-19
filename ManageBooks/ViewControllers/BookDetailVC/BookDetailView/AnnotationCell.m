//
//  AnnotationCell.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "AnnotationCell.h"

#define kLeftMargin     10
#define kTopMargin      10
#define kBottomMargin   10
#define kRightMargin    10


@implementation AnnotationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.avatarBtn.frame = CGRectMake(kLeftMargin, 7, 35, 35);
        self.avatarBtn.layer.cornerRadius = 18.0f;
        self.avatarBtn.clipsToBounds = YES;
        [self.avatarBtn addTarget:self action:@selector(jumpToUserPage:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.avatarBtn];
        //
        self.authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.avatarBtn.right + 10, kTopMargin, SCREEN_WIDTH - 10  - self.avatarBtn.right + 10, 30)];
        self.authorLabel.backgroundColor = [UIColor clearColor];
        self.authorLabel.font = [UIFont systemFontOfSize:17.0f];
        self.authorLabel.textColor = [UIColor chase];
        [self addSubview:self.authorLabel];
        
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, self.avatarBtn.bottom + 5, SCREEN_WIDTH - 40, 40)];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.contentLabel];
    }
    return self;
}

- (void)jumpToUserPage:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.annoModel.author.alt]];
}

- (void)setAnnoModel:(AnnotationModel *)annoModel {
    _annoModel = annoModel;
    [self.avatarBtn setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:annoModel.author.large_avatar]];
    self.authorLabel.text = annoModel.author.name;
    self.contentLabel.text = annoModel.abstract;
}

@end
