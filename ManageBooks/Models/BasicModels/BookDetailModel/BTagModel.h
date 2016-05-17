//
//  BTagModel.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTagModel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;

+ (BTagModel *)tagModelOfDict:(NSDictionary *)dict;

@end
