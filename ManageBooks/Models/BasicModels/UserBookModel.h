//
//  UserBookModel.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModel.h"

typedef enum {
    kStatusWish,
    kStatusReading,
    kStatusRead,
}BookReadType;

@interface UserBookModel : NSObject

@property (nonatomic, assign) BookReadType bookReadType;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *updated;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSArray *userTags;
@property (nonatomic, strong) NSArray *userRating;
@property (nonatomic, strong) BookModel  *bookModel;
@property (nonatomic, strong) NSString  *bookId;
@property (nonatomic, strong) NSString *userBookId; //和bookId不同.这个是标记用户和书关系的id.


+ (UserBookModel *)userBookModelOfDict:(NSDictionary *)uBookDict;

@end
