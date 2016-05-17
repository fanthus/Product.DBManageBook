//
//  GlobeDefine.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//


#define DBAppKey        @"0bd859f12a193d8223890dd37e4bb886"
#define DBAppSecret     @"b318da7189f1cb5f"
#define DBRedirectUrl   @"https://www.apple.com.cn"


#define SYSTEM_LANGUAGE                 [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0]
#define SYSTEM_IS_CHINESE_LANGUAGE      ([SYSTEM_LANGUAGE hasPrefix:@"zh-Hans"] || [SYSTEM_LANGUAGE hasPrefix:@"zh-Hant"])
#define SYSTEM_IS_JAPANESE_LANGUAGE      ([SYSTEM_LANGUAGE hasPrefix:@"ja"])
#define SYSTEM_IS_KOREAN_LANGUAGE        ([SYSTEM_LANGUAGE hasPrefix:@"ko"])

#define SYSTEM_VERSION              [[[UIDevice currentDevice] systemVersion] floatValue]
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width