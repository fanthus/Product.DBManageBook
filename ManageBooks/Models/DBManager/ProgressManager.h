//
//  ProgressManager.h
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqliteHeaders.h"
#import "ProgressModel.h"

@interface ProgressManager : NSObject

+ (SqliteResult *)createProgressTable;

+ (SqliteResult *)insertProgressModel:(ProgressModel *)progressModel;

+ (SqliteResult *)updateProgressModel:(ProgressModel *)progressModel;

+ (ProgressModel *)progressModelOfID:(NSInteger)progressId;

+ (ProgressModel *)progressModelOfBookID:(NSString *)bookId;

@end
