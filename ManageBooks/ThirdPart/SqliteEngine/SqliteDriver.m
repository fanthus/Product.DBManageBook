//
//  SqliteDriver.m
//  Demo
//
//  Created by xiushan.fan on 11/2/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import "SqliteDriver.h"
#import <sqlite3.h>
#import "SqlitePrepare.h"
#import "SqliteMasterModel.h"

#define sqlite_master_name  @"sqlite_master"

static DbChangeBlock dbChangeBlock;

@interface SqliteDriver(){
    sqlite3 *dbHandler;
    NSString *dbPath;
    SqliteResult *result;
}

@end

@implementation SqliteDriver


void dbChange(void *p, int q, const char *m , const char *n , sqlite3_int64 s){
//    NSString *dbName = [[NSString alloc] initWithCString:m encoding:NSUTF8StringEncoding];
//    NSString *tableName = [[NSString alloc] initWithCString:n encoding:NSUTF8StringEncoding];
//    dbChangeBlock(dbName,tableName,s);
}

+ (id)driverWithPath:(NSString *)database andTable:(NSString *)table
{
    @synchronized([UIApplication sharedApplication].delegate){
        static dispatch_once_t onceToken;
        static NSMutableDictionary *handlePool;
        dispatch_once(&onceToken, ^{
            handlePool = [[NSMutableDictionary alloc] init];
        });
        NSString *token = [database stringByAppendingPathExtension:table];
        if (! [[handlePool allKeys] containsObject:token] || nil == [handlePool objectForKey:token]) {
            SqliteDriver *driver = [[SqliteDriver alloc] initWithPath:database];
            SqliteParam *param = [[SqliteParam alloc] init];
            param.sql = [NSString stringWithFormat:@"select 1 from %@",table];
            SqliteResult *res = [driver selectWithParam:param];
            if (SQLITE_OK == res.code) {
                [handlePool setValue:driver forKey:token];
            }
            else {
                return nil;
            }
        }
        return [handlePool objectForKey:token];
    }

}

- (id)initWithPath:(NSString *)path
{
    self = [super init];
    if (self) {
        result = [[SqliteResult alloc] init];
        //
        dbPath = path;
        if (![self fileExistAtPath:dbPath]) {
            [self createFileAtPath:dbPath];
        }
        //
        result.code = sqlite3_open([path UTF8String], &dbHandler);
        if (result.code != SQLITE_OK) {
            return nil;
        }
    }
    return self;
}

- (SqliteResult *)excuteWithSqlArray:(NSArray *)sqlArray
{
    @synchronized([UIApplication sharedApplication].delegate){
        char *errMsg = nil;
        result = [[SqliteResult alloc] init];
        sqlite3_exec(dbHandler, "begin;", nil, nil, &errMsg);
        sqlite3_update_hook(dbHandler, dbChange, NULL);
        BOOL sqliteException = NO;
        for (NSString *sql in sqlArray) {
            result.code = sqlite3_exec(dbHandler, [sql UTF8String], nil, nil, &errMsg);
            if (result.code != SQLITE_OK) {
                if (errMsg) {
                    result.msg = [NSString stringWithUTF8String:errMsg];
                }
                sqliteException = YES;
                break;
            }
        }
        if (NO == sqliteException) {
            sqlite3_exec(dbHandler, "commit;", nil, nil, &errMsg);
        }
        else{
            sqlite3_exec(dbHandler, "rollback;", nil, nil, &errMsg) ;
        }
        if (errMsg) {
            result.msg = [NSString stringWithUTF8String:errMsg];
        }
        return result;
    }
}

- (SqliteResult *)excuteWithSql:(NSString *)sql
{
    @synchronized([UIApplication sharedApplication].delegate){
        char *errMsg = nil;
        result = [[SqliteResult alloc] init];
        
        sqlite3_update_hook(dbHandler, dbChange, NULL);
        
        result.code = sqlite3_exec(dbHandler, [sql UTF8String], nil, nil, &errMsg);
        if (result.code != SQLITE_OK) {
            if (errMsg) {
                result.msg = [NSString stringWithUTF8String:errMsg];
            }
        }
        return result;
    }
}

- (SqliteResult *)excuteWithParam:(SqliteParam *)param
{
    @synchronized([UIApplication sharedApplication].delegate){
        char *errMsg = nil;
        result = [[SqliteResult alloc] init];
        
        sqlite3_update_hook(dbHandler, dbChange, NULL);
        
        if (param.bindArray == nil) {
            result.code = sqlite3_exec(dbHandler, [param.sql UTF8String], nil, nil, &errMsg);
            if (result.code != SQLITE_OK) {
                if (errMsg) {
                    result.msg = [NSString stringWithUTF8String:errMsg];
                }
            }
        }
        else{
            sqlite3_stmt *compiledStatement;
            sqlite3_prepare(dbHandler, [param.sql UTF8String], -1, &compiledStatement, nil);
            for (int i = 0; i < param.bindArray.count; i ++) {
                sqlite3_bind_text(compiledStatement,
                                  i + 1,
                                  [[NSString stringWithFormat:@"%@", [param.bindArray objectAtIndex:i]] UTF8String],
                                  -1,
                                  SQLITE_TRANSIENT);
            }
            result.code = sqlite3_step(compiledStatement);
            sqlite3_reset(compiledStatement);
        }
        return result;
    }
}

- (SqliteResult *)selectWithParam:(SqliteParam *)param
{
    @synchronized([UIApplication sharedApplication].delegate){
        result = [[SqliteResult alloc] init];
        sqlite3_stmt *compiledStatement;
        sqlite3_prepare(dbHandler, [param.sql UTF8String], -1, &compiledStatement, nil);
        NSInteger stepResult = 0;
        while ((stepResult = sqlite3_step(compiledStatement)) && stepResult == SQLITE_ROW && stepResult != SQLITE_OK) {
            NSMutableDictionary *rowDict = [NSMutableDictionary dictionaryWithCapacity:0];
            for (int i = 0; i < sqlite3_column_count(compiledStatement); i++) {
                NSString *key = [NSString stringWithUTF8String:sqlite3_column_name(compiledStatement, i)];
                NSString *value = nil;
                if ( NULL != (char *)sqlite3_column_text(compiledStatement, i)) {
                    value = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, i)];
                }else{
                    value = @"";
                }
                [rowDict setObject:value forKey:key];
            }
            [result.data addObject:rowDict];
        }
        sqlite3_finalize(compiledStatement);
        return result;
    }
}

- (void)close
{
    sqlite3_close(dbHandler);
}

- (void)dbCallBack:(DbChangeBlock)changeBlock{
    dbChangeBlock = [changeBlock copy];
}

- (BOOL)tableExist:(NSString *)tableName
{
    @synchronized([UIApplication sharedApplication].delegate){
        BOOL found= NO;
        result = [[SqliteResult alloc] init];
        SqliteParam *param = [SqlitePrepare selectSqlWithTableName:sqlite_master_name fieldArray:nil condition:@"type like 'table'"];
        result = [self selectWithParam:param];
        for (NSDictionary *masterDict in result.data) {
            SqliteMasterModel *masterModel = [SqliteMasterModel masterModelFromDict:masterDict];
            if ([masterModel.name isEqualToString:tableName]) {
                found = YES;
                break;
            }
        }
        return found;
    }
}

- (BOOL)triggerExist:(NSString *)trigger
{
    @synchronized([UIApplication sharedApplication].delegate){
        BOOL found = NO;
        result = [[SqliteResult alloc] init];
        SqliteParam *param = [SqlitePrepare selectSqlWithTableName:sqlite_master_name fieldArray:nil condition:@"type like 'trigger'"];
        result = [self selectWithParam:param];
        for (NSDictionary *masterDict in result.data) {
            SqliteMasterModel *masterModel = [SqliteMasterModel masterModelFromDict:masterDict];
            if ([masterModel.name isEqualToString:trigger]) {
                found = YES;
                break;
            }
        }
        return found;
    }
}

- (BOOL)indexExist:(NSString *)index
{
    @synchronized([UIApplication sharedApplication].delegate){
        BOOL found = NO;
        result = [[SqliteResult alloc] init];
        SqliteParam *param = [SqlitePrepare selectSqlWithTableName:sqlite_master_name fieldArray:nil condition:@"type like 'index'"];
        result = [self selectWithParam:param];
        for (NSDictionary *masterDict in result.data) {
            SqliteMasterModel *masterModel = [SqliteMasterModel masterModelFromDict:masterDict];
            if ([masterModel.name isEqualToString:index]) {
                found = YES;
                break;
            }
        }
        return found;
    }
}

//-----------------

- (BOOL)fileExistAtPath:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        return YES;
    }
    return NO;
}

- (BOOL)createFileAtPath:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL createResult = [fm createFileAtPath:path contents:nil attributes:nil];
    return createResult;
}


@end
