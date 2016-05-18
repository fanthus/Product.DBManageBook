//
//  BookDetailDC.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BookDetailDC.h"

@interface BookDetailDC() {
    AFHTTPSessionManager *sessionManager;
}

@end

@implementation BookDetailDC

- (instancetype)init
{
    self = [super init];
    if (self) {
        sessionManager = [AFHTTPSessionManager manager];
        sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}

- (void)downloadBigImageWithUrl:(NSString *)iu {
    [sessionManager GET:self.userBookModel.bookModel.images.largeUrl
             parameters:nil
               progress:^(NSProgress * _Nonnull downloadProgress) {
                   //
               }
                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    UIImage *bookImage = [UIImage imageWithData:responseObject];
                    if ([self.delegate respondsToSelector:@selector(downloadBigImageFinished:)]) {
                        [self.delegate downloadBigImageFinished:bookImage];
                    }
                }
                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    //
                }];
}

- (NSAttributedString *)bookSummary  {
    NSString *bookSummaryStr = [NSString stringWithFormat:@"简介:\n\t%@",self.userBookModel.bookModel.summary.length > 0 ? self.userBookModel.bookModel.summary : @"无信息"];
    NSMutableAttributedString *bookSummary = [[NSMutableAttributedString alloc] initWithString:bookSummaryStr attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14.0f],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    [bookSummary addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor baolan],NSForegroundColorAttributeName, nil] range:NSMakeRange(0, 3)];
    return bookSummary;
}

- (NSAttributedString *)authorSummary {
    NSString *authorSummaryStr = [NSString stringWithFormat:@"作者:\n\t%@",self.userBookModel.bookModel.author_intro.length > 0 ? self.userBookModel.bookModel.author_intro : @"无信息"];
    NSMutableAttributedString *authorSummary = [[NSMutableAttributedString alloc] initWithString:authorSummaryStr attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14.0f],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    [authorSummary addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor baolan],NSForegroundColorAttributeName, nil] range:NSMakeRange(0, 3)];
    return authorSummary;
}

- (NSString *)bookAuthorStringOfAuthors:(NSArray *)authors {
    if (authors.count == 0) { return @"暂无"; }
    NSMutableString *author = [NSMutableString stringWithCapacity:0];
    for (NSString *tAuthor in authors) {
        [author appendString:tAuthor];
        [author appendString:@"&"];
    }
    [author deleteCharactersInRange:NSMakeRange(author.length - 1, 1)];
    return author;
}


- (NSString *)shareContent {
    NSString *bookurl = [NSString stringWithFormat:@"https://book.douban.com/subject/%@/",self.userBookModel.bookModel.bookId];
    NSString *shareContent = [NSString stringWithFormat:@"%@:%@",self.userBookModel.bookModel.title,bookurl];
    return shareContent;
}

@end
