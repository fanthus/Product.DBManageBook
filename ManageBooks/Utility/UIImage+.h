//
//  UIImage+UIImage_.h
//
//  Created by xx on 14-8-19.
//  Copyright (c) 2014年 xx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
+ (UIImage *)imageFromView:(UIView *)view;
- (UIImage *)darkerImage;

@end
