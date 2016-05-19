//
//  SqliteParam.m
//  Demo
//
//  Created by xiushan.fan on 11/2/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import "SqliteParam.h"

@implementation SqliteParam

- (NSString *)description{
    return [NSString stringWithFormat:@"sql = %@,bindArray = %@", self.sql,self.bindArray];
}

@end
