//
//  RateModel.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BRateModel.h"

@implementation BRateModel

+ (BRateModel *)rateModelOfDict:(NSDictionary *)dict {
    BRateModel *rateModel = [[BRateModel alloc] init];
    rateModel.max = [[dict objectForKey:@"max"] integerValue];
    rateModel.numRaters = [[dict objectForKey:@"numRaters"] integerValue];
    rateModel.average = [[dict objectForKey:@"average"] floatValue];
    rateModel.min = [[dict objectForKey:@"min"] integerValue];
    return rateModel;
}

@end
