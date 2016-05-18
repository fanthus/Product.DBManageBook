//
//  AnnotationCell.h
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnnotationModelHeader.h"

#define kAnnotationCellHeight 100

@interface AnnotationCell : UITableViewCell

@property (nonatomic, strong) AnnotationModel  *annoModel;

@property (nonatomic, strong) UIButton *avatarBtn;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end
