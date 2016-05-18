//
//  SMMaskImageView.m
//  Calendar
//
//  Created by FRANK on 28/8/14.
//  Copyright (c) 2014年 FRANK. All rights reserved.
//

#import "FRMaskImageView.h"
#import "AppDelegate.h"

@interface FRMaskImageViewManager()


@end

@implementation FRMaskImageViewManager

+ (void)showDisplayedViewOnmaskView:(UIView *)displayedView maskAlpha:(CGFloat)alpha animation:(BOOL)animated
{
    AppDelegate *appdelegate = ((AppDelegate *)[UIApplication sharedApplication].delegate);
    FRMaskImageView *maskImageView = [[FRMaskImageView alloc] initWithFrame:appdelegate.window.bounds maskAlpha:(CGFloat)alpha];
    [maskImageView showDisplayedView:displayedView animation:animated];
    [appdelegate.window addSubview:maskImageView];
}

+ (void)showDisplayedViewOnmaskView:(UIView *)displayedView withOrigin:(CGPoint)origin maskAlpha:(CGFloat)alpha animation:(BOOL)animated
{
    AppDelegate *appdelegate = ((AppDelegate *)[UIApplication sharedApplication].delegate);
    FRMaskImageView *maskImageView = [[FRMaskImageView alloc] initWithFrame:appdelegate.window.bounds maskAlpha:(CGFloat)alpha];
    [maskImageView showDisplayedView:displayedView withOrigin:origin animation:animated];
    [appdelegate.window addSubview:maskImageView];
}

+ (void)dismissMaskView
{
    AppDelegate *appdelegate = ((AppDelegate *)[UIApplication sharedApplication].delegate);
    for (int i = 0; i < appdelegate.window.subviews.count; i++) {
        UIView *view = [appdelegate.window.subviews objectAtIndex:i];
        if ([view isKindOfClass:[FRMaskImageView class]]) {
            [view removeFromSuperview];
            for (int j = 0; j < view.subviews.count; j++) {
                UIView *subView = [view.subviews objectAtIndex:j];
                [subView removeFromSuperview];
            }
        }
    }
}

@end


@interface FRMaskImageView()<UIGestureRecognizerDelegate>
{
    UIImageView *bottomIV;
}

@end

@implementation FRMaskImageView


- (id)initWithFrame:(CGRect)frame maskAlpha:(CGFloat)alpha
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        self.maskAlpha = alpha;
        //
        bottomIV = [[UIImageView alloc] initWithFrame:self.bounds];
        bottomIV.backgroundColor = [UIColor blackColor];
        bottomIV.userInteractionEnabled = YES;
        [self addSubview:bottomIV];
        //
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMask:)];
        tapGes.delegate = self;
        tapGes.numberOfTapsRequired = 1;
        [bottomIV addGestureRecognizer:tapGes];
    }
    return self;
}

- (void)showDisplayedView:(UIView *)displayedView withOrigin:(CGPoint)origin animation:(BOOL)animated
{
    if (displayedView) {
        displayedView.frame = CGRectMake(origin.x, origin.y, displayedView.width, displayedView.height);
        displayedView.userInteractionEnabled = YES;
        [self addSubview:displayedView];
        [self animateDisplayView:displayedView withAnimation:animated];
    }
}

- (void)showDisplayedView:(UIView *)displayedView animation:(BOOL)animated
{
    if (displayedView) {
        CGFloat originX = (self.frame.size.width - displayedView.frame.size.width)/2;
        CGFloat originY = (self.frame.size.height - displayedView.frame.size.height)/2;
        displayedView.frame = CGRectMake(originX, originY, displayedView.width, displayedView.height);
        displayedView.userInteractionEnabled = YES;
        [self addSubview:displayedView];
        [self animateDisplayView:displayedView withAnimation:animated];
    }
}

- (void)animateDisplayView:(UIView *)displayedView withAnimation:(BOOL)animated {
    if (animated) {
        if (self.maskAlpha == 0) {
            bottomIV.backgroundColor = [UIColor clearColor];
        }
        else{
            bottomIV.alpha = 0;
            [UIView animateWithDuration:0.2 animations:^{bottomIV.alpha = self.maskAlpha;}completion:^(BOOL finished) {}];
        }
        displayedView.alpha = 0;
        [UIView animateWithDuration:0.15
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{ displayedView.alpha = 1; }
                         completion:^(BOOL finished) { }];
    }
}


- (void)dismissDisplayedView:(UIView *)displayedView
{
    if (displayedView) {
        [displayedView.superview removeFromSuperview];
        [displayedView removeFromSuperview];
    }
}

- (void)tapMask:(UITapGestureRecognizer *)tapGes
{
    if (tapGes.view) {
        for (int i = 0; i < tapGes.view.subviews.count; i++) {
            UIView *view = [tapGes.view.subviews objectAtIndex:i];
            [view removeFromSuperview];
        }
        [tapGes.view.superview removeFromSuperview];
        [tapGes.view removeFromSuperview];
    }
}

#pragma mark - delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint tapPoint = [touch locationInView:gestureRecognizer.view];
    if (gestureRecognizer.view) {
        for (int i = 0; i < gestureRecognizer.view.subviews.count; i++) {
            UIView *view = [gestureRecognizer.view.subviews objectAtIndex:i];
            if (CGRectContainsPoint(view.frame, tapPoint)) {
                return NO;
            }
        }
    }
    return YES;
}

@end
