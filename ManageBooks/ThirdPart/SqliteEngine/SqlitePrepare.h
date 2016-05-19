//
//  PrepareForSqlite.h
//  Demo
//
//  Created by xiushan.fan on 11/2/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqliteParam.h"

@interface SqlitePrepare : NSObject

+ (SqliteParam *)createSqlWithTableName:(NSString *)tableName fieldArray:(NSArray *)fieldArray;

+ (NSString *)dropTableSql:(NSString *)tableName;

+ (SqliteParam *)insertSqlWithTableName:(NSString *)tableName dict:(NSDictionary *)dict;

+ (SqliteParam *)deleteSqlWithTableName:(NSString *)tableName condition:(NSString *)condition;

+ (SqliteParam *)updateSqlWithTableName:(NSString *)tableName dict:(NSDictionary *)dict condition:(NSString *)condition;

+ (SqliteParam *)selectSqlWithTableName:(NSString *)tableName fieldArray:(NSArray *)fieldArray condition:(NSString *)condition;

+ (NSString *)createTriggerSql:(NSString *)trigger triggerCondition:(NSString *)condition triggerSql:(NSString *)triggerSql;

+ (NSString *)dropTriggerSql:(NSString *)trigger;

@end
