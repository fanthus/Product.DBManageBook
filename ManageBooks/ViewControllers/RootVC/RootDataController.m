//
//  RootDataController.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "RootDataController.h"
#import <AFNetworking.h>
#import "UserBookModel.h"
#import "BookModel.h"

@interface RootDataController () {
    AFHTTPSessionManager *sessionManager;
}

@end

@implementation RootDataController

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

- (void)fetchAllBooksWithType:(FetchType)fetchType {
    NSString *allBooksUrl = [UrlBuilder urlWithType:kDBAllBooks andDict:[self paramDictOfFetchType:fetchType]];
    [sessionManager GET:allBooksUrl
             parameters:nil
               progress:^(NSProgress * _Nonnull downloadProgress) {
                   //
               }
                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    NSArray *books = [self parseResponse:dict];
                    if ([self.delegate respondsToSelector:@selector(fetchAllBooksFinished:)]) {
                        [self.delegate fetchAllBooksFinished:books];
                    }
                }
                failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    //
                }];
}


- (NSDictionary *)paramDictOfFetchType:(FetchType)fetchType {
    NSMutableDictionary *fetchParamDict = [NSMutableDictionary dictionaryWithCapacity:0];
    switch (fetchType) {
        case kFetchWish: {
            [fetchParamDict setObject:@"wish" forKey:@"status"];
        }
            break;
        case kFetchRead: {
            [fetchParamDict setObject:@"read" forKey:@"status"];
        }
            break;
        case kFeatchReading: {
            [fetchParamDict setObject:@"reading" forKey:@"status"];
        }
            break;
            
        default:
            break;
    }
    return fetchParamDict;
}

- (NSArray *)parseResponse:(NSDictionary *)responseDict {
    NSMutableArray *userBookModelArray = [NSMutableArray arrayWithCapacity:0];
    NSArray *collections = [responseDict objectForKey:@"collections"];
    for (NSDictionary *uBookDict in collections) {
        UserBookModel *uBookModel = [UserBookModel userBookModelOfDict:uBookDict];
        [userBookModelArray addObject:uBookModel];
    }
    return userBookModelArray;
}





@end
