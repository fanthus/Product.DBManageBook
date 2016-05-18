//
//  SMMaskImageView.h
//  Calendar
//
//  Created by xiushan.fan on 28/8/14.
//  Copyright (c) 2014年 Smartisan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FRMaskImageViewManager : NSObject

+ (void)showDisplayedViewOnmaskView:(UIView *)displayedView maskAlpha:(CGFloat)alpha animation:(BOOL)animated;

+ (void)showDisplayedViewOnmaskView:(UIView *)displayedView withOrigin:(CGPoint)origin maskAlpha:(CGFloat)alpha animation:(BOOL)animated;

+ (void)dismissMaskView;

@end


@interface FRMaskImageView : UIView

@property (nonatomic, assign) CGFloat maskAlpha;

- (id)initWithFrame:(CGRect)frame maskAlpha:(CGFloat)alpha;

- (void)showDisplayedView:(UIView *)displayedView animation:(BOOL)animated;

- (void)showDisplayedView:(UIView *)displayedView withOrigin:(CGPoint)origin animation:(BOOL)animated;

- (void)dismissDisplayedView:(UIView *)displayedView;

@end
