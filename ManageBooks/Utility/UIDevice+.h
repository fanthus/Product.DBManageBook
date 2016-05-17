//
//  UIDevice+_.h
//
//  Created by xx on 14-8-19.
//  Copyright (c) 2014年 xx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Additions)
+ (BOOL)isScreenInch4;
+ (BOOL)isScreenInch3_5;
+ (NSString *)machine;
+(NSString*)getCurrentPlatform;

//获取供应商ID
+ (NSString *)vondorID;

@end
