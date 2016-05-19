//
//  PrepareForSqlite.m
//  Demo
//
//  Created by xiushan.fan on 11/2/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import "SqlitePrepare.h"

@implementation SqlitePrepare

+ (SqliteParam *)createSqlWithTableName:(NSString *)tableName fieldArray:(NSArray *)fieldArray
{
    NSMutableString *fieldString = [NSMutableString stringWithCapacity:0];
    for (int i = 0; i < fieldArray.count; i++) {
        NSString *field = [fieldArray objectAtIndex:i];
        [fieldString appendString:[NSString stringWithFormat:@"%@,",field]];
    }
    if (fieldString.length > 0) {
        NSRange range = NSMakeRange(fieldString.length - 1, 1);
        [fieldString replaceCharactersInRange:range withString:@""];
    }
    SqliteParam *param = [[SqliteParam alloc] init];
    param.sql = [NSString stringWithFormat:@"create table if not exists %@ (%@);",tableName,fieldString];
    return param;
}

+ (NSString *)dropTableSql:(NSString *)tableName
{
    NSString *dropTableSql = [NSString stringWithFormat:@"drop table %@ ", tableName];
    return dropTableSql;
}

+ (SqliteParam *)insertSqlWithTableName:(NSString *)tableName dict:(NSDictionary *)dict
{
    NSMutableString *fieldString = [NSMutableString stringWithCapacity:0];
    NSMutableString *placeHolderString = [NSMutableString stringWithCapacity:0];
    
    NSMutableArray *bindArray = [NSMutableArray arrayWithCapacity:0];
    for (NSString *key in [dict allKeys]) {
        [fieldString appendString:[NSString stringWithFormat:@"%@,",key]];
        [placeHolderString appendString:@"?,"];
        [bindArray addObject:[dict objectForKey:key]];
    }
    if (placeHolderString.length > 0) {
        NSRange range = NSMakeRange(placeHolderString.length - 1, 1);
        [placeHolderString replaceCharactersInRange:range withString:@""];
    }
    if (fieldString.length > 0) {
        NSRange range = NSMakeRange(fieldString.length - 1, 1);
        [fieldString replaceCharactersInRange:range withString:@""];
    }
    NSString *insertString = [NSString stringWithFormat:@"insert into %@(%@) values(%@);",tableName,fieldString,placeHolderString];
    SqliteParam *param = [[SqliteParam alloc] init];
    param.sql = insertString;
    param.bindArray = bindArray;
    return param;
}

+ (SqliteParam *)deleteSqlWithTableName:(NSString *)tableName condition:(NSString *)condition
{
    SqliteParam *param = [[SqliteParam alloc] init];
    NSMutableString *sql = [NSMutableString stringWithFormat:@"delete from %@",tableName];
    if (condition) {
        [sql appendString:[NSString stringWithFormat:@" where %@",condition]];
    }
    param.sql = sql;
    return param;
}

+ (SqliteParam *)updateSqlWithTableName:(NSString *)tableName dict:(NSDictionary *)dict condition:(NSString *)condition
{
    NSMutableString *setString = [NSMutableString stringWithCapacity:0];
    NSMutableArray *bindArray = [NSMutableArray arrayWithCapacity:0];
    for (NSString *key in [dict allKeys]) {
        [setString appendFormat:@"%@=?,",key];
        [bindArray addObject:[dict objectForKey:key]];
    }

    if (setString.length > 0) {
        NSRange range = NSMakeRange(setString.length - 1, 1);
        [setString replaceCharactersInRange:range withString:@""];
    }
    
    NSMutableString *updateSql = [NSMutableString stringWithFormat:@"update %@ set %@",tableName,setString];
    if (condition) {
        [updateSql appendString:[NSString stringWithFormat:@" where %@",condition]];
    }
    SqliteParam *param = [[SqliteParam alloc] init];
    param.sql = updateSql;
    param.bindArray = bindArray;
    return param;
}

+ (SqliteParam *)selectSqlWithTableName:(NSString *)tableName fieldArray:(NSArray *)fieldArray condition:(NSString *)condition
{
    NSMutableString *selectSql = nil;
    if (nil == fieldArray || fieldArray.count != 0) {
        selectSql = [NSMutableString stringWithFormat:@"select * from %@",tableName];
        if (condition) {
            [selectSql appendString:[NSString stringWithFormat:@" where %@",condition]];
        }
    }
    else{
        NSMutableString *fieldsString = [NSMutableString stringWithCapacity:0];
        for (NSString *field in fieldArray) {
            [fieldsString appendString:[NSString stringWithFormat:@"%@,",field]];
        }
        if (fieldsString.length > 0) {
            NSRange range = NSMakeRange(fieldsString.length - 1, 1);
            [fieldsString replaceCharactersInRange:range withString:@""];
        }
        selectSql = [NSMutableString stringWithFormat:@"select %@ from %@",fieldsString,tableName];
        if (condition) {
            [selectSql appendString:[NSString stringWithFormat:@" where %@",condition]];
        }
    }
    SqliteParam *param = [[SqliteParam alloc] init];
    param.sql = selectSql;
    return param;
}

+ (NSString *)createTriggerSql:(NSString *)trigger triggerCondition:(NSString *)condition triggerSql:(NSString *)triggerSql{
    NSString *firstLineSql = [NSString stringWithFormat:@"create trigger %@ %@",trigger,condition];
    NSString *createTriggerSql = [NSString stringWithFormat:@"%@\nbegin\n%@;\nend;",firstLineSql,triggerSql];
    return createTriggerSql;
}


+ (NSString *)dropTriggerSql:(NSString *)trigger{
    NSString *dropTriggerSql = [NSString stringWithFormat:@"DROP TRIGGER %@",trigger];
    return dropTriggerSql;
}

@end
