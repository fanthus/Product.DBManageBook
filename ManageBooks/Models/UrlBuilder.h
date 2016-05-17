//
//  UrlBuilder.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

//https://www.douban.com/service/auth2/auth 获取authorization_code

typedef enum {
    kDBAuth,
    kDBToken,
    //---
    kDBAllBooks
}DBUrlType;

typedef enum {
    kDBAClientID,       //必选参数，应用的唯一标识，对应于APIKey
    kDBARedirect,       //必选参数，用户授权完成后的回调地址，应用需要通过此回调地址获得用户的授权结果。此地址必须与在应用注册时填写的回调地址一致。
    kDBAResponseType,   //必选参数，此值可以为 code 或者 token 。在本流程中，此值为 code
    kDBAScope,          //可选参数，申请权限的范围，如果不填，则使用缺省的 scope。如果申请多个 scope，使用逗号分隔。
    kDBState,           //可选参数，用来维护请求和回调状态的附加字符串，在授权完成回调时会附加此参数，应用可以根据此字符串来判断上下文关系。
    //Token 增加
    kDBAClientSecret,   //必选参数，应用的唯一标识，对应于豆瓣 secret
    kDBGrantType,       //必选参数，此值可以为 authorization_code 或者 refresh_token 。在本流程中，此值为 authorization_code
    kDBCode             //必选参数，上一步中获得的 authorization_code
}DBAuthParamType;


@interface UrlBuilder : NSObject

+ (NSString *)urlWithType:(DBUrlType)authType andDict:(NSDictionary *)dict;


+ (NSString *)keyOfDBAParamType:(DBAuthParamType)paramType;

@end
