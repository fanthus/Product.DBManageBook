//
//  UserSetting.m
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "UserSetting.h"

#define kFetchTypeKey   @"fetchType"


@interface UserSetting() {
    NSUserDefaults *userDefaults;
}

@end

@implementation UserSetting

- (instancetype)init
{
    self = [super init];
    if (self) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)setFetchType:(FetchType)fetchType {
    [self setInteger:(NSInteger)fetchType forKey:kFetchTypeKey];;
}

- (FetchType)fetchType {
    return (FetchType)[self integerForKey:kFetchTypeKey];
}


#pragma mark - 底层封装

- (void)setDouble:(double)value forKey:(NSString *)key
{
    [userDefaults setDouble:value forKey:key];
    [userDefaults synchronize];
}

- (double)doubleForKey:(NSString *)key
{
    return [userDefaults doubleForKey:key];
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)key
{
    [userDefaults setInteger:value forKey:key];
    [userDefaults synchronize];
}

- (NSInteger)integerForKey:(NSString *)key
{
    return [userDefaults integerForKey:key];
}

- (void)setBool:(BOOL)value forKey:(NSString *)key
{
    [userDefaults setBool:value forKey:key];
    [userDefaults synchronize];
}

- (BOOL)boolForKey:(NSString *)key
{
    return [userDefaults boolForKey:key];
}

- (void)setObject:(NSObject *)value forKey:(NSString *)key
{
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

- (NSObject *)objectForKey:(NSString *)key
{
    return [userDefaults objectForKey:key];
}



@end



