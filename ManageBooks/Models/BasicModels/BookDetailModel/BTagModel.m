//
//  BTagModel.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BTagModel.h"

@implementation BTagModel

+ (BTagModel *)tagModelOfDict:(NSDictionary *)dict {
    BTagModel *tagModel = [[BTagModel alloc] init];
    tagModel.count = [[dict objectForKey:@"count"] integerValue];
    tagModel.name = [dict objectForKey:@"name"];
    tagModel.title = [dict objectForKey:@"title"];
    return tagModel;
}

@end
