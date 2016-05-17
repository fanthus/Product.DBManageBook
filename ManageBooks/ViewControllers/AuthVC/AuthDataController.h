//
//  AuthDataController.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthDataController : NSObject

+ (NSDictionary *)authParamDict;

+ (NSDictionary *)tokenParamDictWithAuthCode:(NSString *)code;

@end
