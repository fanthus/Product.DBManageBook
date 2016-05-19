//
//  SqliteMasterModel.h
//  Calendar
//
//  Created by xiushan.fan on 21/1/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqliteMasterModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger rootpage;
@property (nonatomic, strong) NSString *sql;
@property (nonatomic, strong) NSString *tbl_name;
@property (nonatomic, strong) NSString *type;


+ (SqliteMasterModel *)masterModelFromDict:(NSDictionary *)dict;

@end
