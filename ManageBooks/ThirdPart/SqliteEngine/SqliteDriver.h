//
//  SqliteDriver.h
//  Demo
//
//  Created by xiushan.fan on 11/2/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqliteResult.h"
#import "SqliteParam.h"
#import <sqlite3.h>

//Note:
//1、如果是连表查询的话，key一样使用此方法会出现问题，因为数据最后的存储方式是字典，如果key一样字典会错乱。

typedef void(^DbChangeBlock)(NSString *dbName,NSString *tableName,sqlite3_int64 rowId);

@interface SqliteDriver : NSObject

+ (id)driverWithPath:(NSString *)database andTable:(NSString *)table;

- (id)initWithPath:(NSString *)path;

- (SqliteResult *)excuteWithSqlArray:(NSArray *)sqlArray;

- (SqliteResult *)excuteWithSql:(NSString *)sql;

- (SqliteResult *)excuteWithParam:(SqliteParam *)param;

- (SqliteResult *)selectWithParam:(SqliteParam *)param;

- (void)close;

- (BOOL)tableExist:(NSString *)tableName;

- (BOOL)triggerExist:(NSString *)trigger;

- (BOOL)indexExist:(NSString *)index;

- (void)dbCallBack:(DbChangeBlock)changeBlock;

@end
