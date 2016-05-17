//
//  UserBookModel.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "UserBookModel.h"

@implementation UserBookModel

+ (UserBookModel *)userBookModelOfDict:(NSDictionary *)uBookDict {
    UserBookModel *userBookModel = [[UserBookModel alloc] init];
    userBookModel.bookReadType = [self readTypeOfString:[uBookDict objectForKey:@"status"]];
    userBookModel.userId = [uBookDict objectForKey:@"user_id"];
    userBookModel.userTags = [uBookDict objectForKey:@"tags"];
    NSDictionary *bookDict = [uBookDict objectForKey:@"book"];
    userBookModel.bookModel = [BookModel bookModelOfDict:bookDict];
    userBookModel.bookId = [uBookDict objectForKey:@"book_id"];
    userBookModel.userBookId = [uBookDict objectForKey:@"id"];
    return userBookModel;
}

+ (BookReadType)readTypeOfString:(NSString *)string {
    if ([string isEqualToString:@"wish"]) {
        return kStatusWish;
    }
    else if ([string isEqualToString:@"read"]) {
        return kStatusRead;
    }
    else if ([string isEqualToString:@"reading"]) {
        return kStatusReading;
    }
    return kStatusRead;
}

@end
