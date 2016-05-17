//
//  BImageModel.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BImageModel : NSObject

@property (nonatomic, strong) NSString *smallUrl;
@property (nonatomic, strong) NSString *mediumUrl;
@property (nonatomic, strong) NSString *largeUrl;

+ (BImageModel *)imageModelOfDict:(NSDictionary *)dict;

@end
