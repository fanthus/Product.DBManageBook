//
//  BookModel.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookDetailModelHeader.h"

@interface BookModel : NSObject

@property (nonatomic, strong) BRateModel *rateModel;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSArray *authors;
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSMutableArray  *tags;
@property (nonatomic, strong) NSString *origin_title;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *binding;
@property (nonatomic, strong) NSArray *translator;
@property (nonatomic, strong) NSString *catalog;
@property (nonatomic, strong) NSString *pages;
@property (nonatomic, strong) BImageModel *images;
@property (nonatomic, strong) NSString *alt;
@property (nonatomic, strong) NSString *bookId;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *isbn10;
@property (nonatomic, strong) NSString *isbn13;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *alt_title;
@property (nonatomic, strong) NSString *author_intro;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *price;

+ (BookModel *)bookModelOfDict:(NSDictionary *)dict;


@end
