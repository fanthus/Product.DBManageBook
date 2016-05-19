//
//  ProgressModel.h
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kProgressTableName  @"progress_table"

@interface ProgressModel : NSObject

@property (nonatomic, assign) NSInteger progressId;
@property (nonatomic, strong) NSString *bookId;
@property (nonatomic, assign) NSInteger allPomo;
@property (nonatomic, assign) NSInteger curPomo;
@property (nonatomic, assign) NSInteger allPage;
@property (nonatomic, assign) NSInteger curPage;

//--- field not in db
@property (nonatomic, assign) CGFloat progress;

+ (NSArray *)createTableFieldArray;

- (NSDictionary *)dictOfProgressModel;

+ (ProgressModel *)progressModelOfDict:(NSDictionary *)dict;

@end
