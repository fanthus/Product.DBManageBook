//
//  UrlBuilder.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "UrlBuilder.h"

#define kHostName           @"https://www.douban.com/"
#define kServiceAuth        @"service/auth2/"

#define kApiHostName        @"https://api.douban.com/"



@implementation UrlBuilder

+ (NSString *)urlWithType:(DBUrlType)authType andDict:(NSDictionary *)dict {
    NSString *url = nil;
    switch (authType) {
        case kDBAuth: {
            NSString *paramUrlString = [self urlStringOfDict:dict];
            if (paramUrlString.length > 0) {
                url = [NSString stringWithFormat:@"%@%@%@?%@",kHostName,kServiceAuth,@"auth",[self urlStringOfDict:dict]];
            }
            else {
                url = [NSString stringWithFormat:@"%@%@%@",kHostName,kServiceAuth,@"auth"];
            }
        }
            break;
        case kDBToken: {
            url = [NSString stringWithFormat:@"%@%@%@",kHostName,kServiceAuth,@"token"];
        }
            break;
        case kDBAllBooks: {
//            https://api.douban.com/v2/book/user/52549845/collections?status=wish
            NSString *paramUrlString = [self urlStringOfDict:dict];
            if (paramUrlString.length > 0) {
                url = [NSString stringWithFormat:@"%@v2/book/user/%@/collections?%@",kApiHostName,[DataStore shareInstance].userDataStore.userId,paramUrlString];
            }
            else {
                url = [NSString stringWithFormat:@"%@v2/book/user/%@/collections",kApiHostName,[DataStore shareInstance].userDataStore.userId];
            }
        }
            break;
        default:
            break;
    }
    return url;
}



+ (NSString *)urlStringOfDict:(NSDictionary *)dict {
    if (dict.allKeys.count > 0) {
        NSMutableString *string = [NSMutableString stringWithCapacity:0];
        for (NSString *key in [dict allKeys]) {
            [string appendString:[NSString stringWithFormat:@"%@=%@",key,[dict objectForKey:key]]];
            [string appendString:@"&"];
        }
        [string deleteCharactersInRange:NSMakeRange(string.length-1, 1)];
        return string;
    }
    return nil;
}

+ (NSString *)keyOfDBAParamType:(DBAuthParamType)paramType {
    NSString *keyStr = nil;
    switch (paramType) {
        case kDBAClientID:{
            keyStr = @"client_id";
        }
            break;
        case kDBARedirect: {
            keyStr = @"redirect_uri";
        }
            break;
        case kDBAResponseType: {
            keyStr = @"response_type";
        }
            break;
        case kDBAScope: {
            keyStr = @"scope";
        }
            break;
        case kDBState: {
            keyStr = @"state";
        }
            break;
        //-- Token
        case kDBAClientSecret: {
            keyStr = @"client_secret";
        }
            break;
        case kDBGrantType: {
            keyStr = @"grant_type";
        }
            break;
        case kDBCode: {
            keyStr = @"code";
        }
            break;
        default:
            break;
    }
    return keyStr;
}

@end
