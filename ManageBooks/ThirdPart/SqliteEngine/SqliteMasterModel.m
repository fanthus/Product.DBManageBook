//
//  SqliteMasterModel.m
//  Calendar
//
//  Created by xiushan.fan on 21/1/15.
//  Copyright (c) 2015年 FFFF. All rights reserved.
//

#import "SqliteMasterModel.h"

@implementation SqliteMasterModel

+ (SqliteMasterModel *)masterModelFromDict:(NSDictionary *)dict
{
    SqliteMasterModel *sqliteMasterModel = [[SqliteMasterModel alloc] init];
    sqliteMasterModel.type = [dict objectForKey:@"type"];
    sqliteMasterModel.name = [dict objectForKey:@"name"];
    sqliteMasterModel.tbl_name = [dict objectForKey:@"tbl_name"];
    sqliteMasterModel.rootpage = [[dict objectForKey:@"rootpage"] integerValue];
    sqliteMasterModel.sql = [dict objectForKey:@"sql"];
    return sqliteMasterModel;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"type = %@,name = %@,tbl_name = %@,rootpage=%ld,sql = %@", self.type,self.name,self.tbl_name,(long)self.rootpage,self.sql];
}

@end
