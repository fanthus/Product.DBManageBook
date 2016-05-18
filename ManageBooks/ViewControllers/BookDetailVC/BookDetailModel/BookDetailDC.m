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

@end
