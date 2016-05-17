//
//  BImageModel.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BImageModel.h"

@implementation BImageModel

+ (BImageModel *)imageModelOfDict:(NSDictionary *)dict {
    BImageModel *imageModel = [[BImageModel alloc] init];
    imageModel.smallUrl = [dict objectForKey:@"small"];
    imageModel.mediumUrl = [dict objectForKey:@"medium"];
    imageModel.largeUrl = [dict objectForKey:@"large"];
    return imageModel;
}

@end
