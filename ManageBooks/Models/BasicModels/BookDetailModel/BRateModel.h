//
//  RateModel.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRateModel : NSObject

@property (nonatomic, assign) NSInteger max;
@property (nonatomic, assign) NSInteger numRaters;
@property (nonatomic, assign) CGFloat average;
@property (nonatomic, assign) NSInteger min;


+ (BRateModel *)rateModelOfDict:(NSDictionary *)dict;

@end
