//
//  AuthDataController.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "AuthDataController.h"

@implementation AuthDataController

+ (NSDictionary *)authParamDict {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setObject:DBAppKey forKey:[UrlBuilder keyOfDBAParamType:kDBAClientID]];
    [dict setObject:DBRedirectUrl forKey:[UrlBuilder keyOfDBAParamType:kDBARedirect]];
    [dict setObject:@"code" forKey:[UrlBuilder keyOfDBAParamType:kDBAResponseType]];
    return dict;
}

+ (NSDictionary *)tokenParamDictWithAuthCode:(NSString *)code {
    NSMutableDictionary *tokenDict = [NSMutableDictionary dictionaryWithCapacity:0];
    [tokenDict setObject:DBAppKey forKey:[UrlBuilder keyOfDBAParamType:kDBAClientID]];
    [tokenDict setObject:DBAppSecret forKey:[UrlBuilder keyOfDBAParamType:kDBAClientSecret]];
    [tokenDict setObject:DBRedirectUrl forKey:[UrlBuilder keyOfDBAParamType:kDBARedirect]];
    [tokenDict setObject:@"authorization_code" forKey:[UrlBuilder keyOfDBAParamType:kDBGrantType]];
    [tokenDict setObject:code forKey:[UrlBuilder keyOfDBAParamType:kDBCode]];
    return tokenDict;
}

@end
