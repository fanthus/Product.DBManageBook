//
//  BookModel.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BookModel.h"
#import "BTagModel.h"

@implementation BookModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tags = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

+ (BookModel *)bookModelOfDict:(NSDictionary *)dict {
    BookModel *tBookModel = [[BookModel alloc] init];
    tBookModel.rateModel = [BRateModel rateModelOfDict:[dict objectForKey:@"rating"]];
    tBookModel.subtitle = [dict objectForKey:@"subtitle"];
    tBookModel.authors = [dict objectForKey:@"author"];
    tBookModel.pubdate = [dict objectForKey:@"pubdate"];
    NSArray *tagDictArray = [dict objectForKey:@"tags"];
    for (NSDictionary *tTagDict in tagDictArray) {
        [tBookModel.tags addObject:[BTagModel tagModelOfDict:tTagDict]];
    }
    tBookModel.origin_title = [dict objectForKey:@"origin_title"];
    tBookModel.image = [dict objectForKey:@"image"];
    tBookModel.binding = [dict objectForKey:@"binding"];
    tBookModel.translator = [dict objectForKey:@"translator"];
    tBookModel.catalog = [dict objectForKey:@"catalog"];
    tBookModel.pages = [dict objectForKey:@"pages"];
    tBookModel.images = [BImageModel imageModelOfDict:[dict objectForKey:@"images"]];
    tBookModel.alt = [dict objectForKey:@"alt"];
    tBookModel.bookId = [dict objectForKey:@"id"];
    tBookModel.publisher = [dict objectForKey:@"publisher"];
    tBookModel.isbn10 = [dict objectForKey:@"isbn10"];
    tBookModel.isbn13 = [dict objectForKey:@"isbn13"];
    tBookModel.title = [dict objectForKey:@"title"];
    tBookModel.url = [dict objectForKey:@"url"];
    tBookModel.alt_title = [dict objectForKey:@"alt_title"];
    tBookModel.author_intro = [dict objectForKey:@"author_intro"];
    tBookModel.summary = [dict objectForKey:@"summary"];
    tBookModel.price = [dict objectForKey:@"price"];
    return tBookModel;
}

@end
