//
//  ProgressModel.m
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "ProgressModel.h"

#define kProgressIdKey  @"progressId"
#define kBookIdKey      @"bookId"
#define kAllPomoKey     @"allPomo"
#define kCurPomoKey     @"curPomo"
#define kAllPageKey     @"allPage"
#define kCurPageKey     @"curPage"



@implementation ProgressModel

- (CGFloat)progress {
    return  (CGFloat)self.curPomo/(CGFloat)self.allPomo;
}

+ (NSArray *)createTableFieldArray {
    return @[@"progressId integer primary key autoincrement",@"bookId text",@"allPomo integer",@"curPomo integer",@"allPage integer",@"curPage integer"];
}

- (NSDictionary *)dictOfProgressModel {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setObject:self.bookId forKey:kBookIdKey];
    [dict setObject:[NSString stringWithFormat:@"%ld",self.allPomo] forKey:kAllPomoKey];
    [dict setObject:[NSString stringWithFormat:@"%ld",self.curPomo] forKey:kCurPomoKey];
    [dict setObject:[NSString stringWithFormat:@"%ld",self.allPage] forKey:kAllPageKey];
    [dict setObject:[NSString stringWithFormat:@"%ld",self.curPage] forKey:kCurPageKey];
    return dict;
}

+ (ProgressModel *)progressModelOfDict:(NSDictionary *)dict {
    ProgressModel *progressModel = [[ProgressModel alloc] init];
    progressModel.bookId = [dict objectForKey:kBookIdKey];
    progressModel.allPomo = [[dict objectForKey:kAllPomoKey] integerValue];
    progressModel.curPomo = [[dict objectForKey:kCurPomoKey] integerValue];
    progressModel.allPage = [[dict objectForKey:kAllPageKey] integerValue];
    progressModel.curPage = [[dict objectForKey:kCurPageKey] integerValue];
    return progressModel;
}

@end
