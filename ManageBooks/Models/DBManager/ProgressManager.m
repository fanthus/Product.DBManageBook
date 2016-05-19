//
//  ProgressManager.m
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "ProgressManager.h"


@implementation ProgressManager

+ (SqliteResult *)createProgressTable {
    SqliteParam *param = [SqlitePrepare createSqlWithTableName:kProgressTableName fieldArray:[ProgressModel createTableFieldArray]];
    SqliteDriver *driver = [[SqliteDriver alloc] initWithPath:[MBFileManager pathOfFileType:kDBFile]];
    SqliteResult *result = nil;
    if ([driver tableExist:kProgressTableName] == NO) {
        result = [driver excuteWithParam:param];
    }
    return result;
}

+ (SqliteResult *)insertProgressModel:(ProgressModel *)progressModel {
    NSDictionary *dict = [progressModel dictOfProgressModel];
    SqliteParam *param = [SqlitePrepare insertSqlWithTableName:kProgressTableName dict:dict];
    SqliteDriver *driver = [SqliteDriver driverWithPath:[MBFileManager pathOfFileType:kDBFile] andTable:kProgressTableName];
    SqliteResult *result = [driver excuteWithParam:param];
    return result;
}

+ (SqliteResult *)updateProgressModel:(ProgressModel *)progressModel {
    NSDictionary *dict = [progressModel dictOfProgressModel];
    SqliteParam *param = [SqlitePrepare updateSqlWithTableName:kProgressTableName dict:dict condition:[NSString stringWithFormat:@"progressId = %ld",(long)progressModel.progressId]];
    SqliteDriver *driver = [SqliteDriver driverWithPath:[MBFileManager pathOfFileType:kDBFile] andTable:kProgressTableName];
    SqliteResult *result = [driver excuteWithParam:param];
    return result;
}

+ (ProgressModel *)progressModelOfID:(NSInteger)progressId {
    SqliteParam *param = [SqlitePrepare selectSqlWithTableName:kProgressTableName fieldArray:nil condition:[NSString stringWithFormat:@"progressId = %ld",(long)progressId]];
    SqliteDriver *driver = [SqliteDriver driverWithPath:[MBFileManager pathOfFileType:kDBFile] andTable:kProgressTableName];
    SqliteResult *result = [driver selectWithParam:param];
    ProgressModel *progressModel = nil;
    if (result.data.count > 0) {
        progressModel = [ProgressModel progressModelOfDict:[result.data objectAtIndex:0]];
    }
    return progressModel;
}

+ (ProgressModel *)progressModelOfBookID:(NSString *)bookId {
    SqliteParam *param = [SqlitePrepare selectSqlWithTableName:kProgressTableName fieldArray:nil condition:[NSString stringWithFormat:@"bookId = %@",bookId]];
    SqliteDriver *driver = [SqliteDriver driverWithPath:[MBFileManager pathOfFileType:kDBFile] andTable:kProgressTableName];
    SqliteResult *result = [driver selectWithParam:param];
    ProgressModel *progressModel = nil;
    if (result.data.count > 0) {
        progressModel = [ProgressModel progressModelOfDict:[result.data objectAtIndex:0]];
    }
    return progressModel;
}


@end
