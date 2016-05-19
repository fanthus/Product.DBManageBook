//
//  SqliteParam.h
//  Demo
//
//  Created by xiushan.fan on 11/2/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqliteParam : NSObject

@property (nonatomic, strong) NSString *sql;

@property (nonatomic, strong) NSArray *bindArray;

@end
