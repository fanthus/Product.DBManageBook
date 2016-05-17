//
//  UserDataStore.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "UserDataStore.h"

#define kUserIdKey          @"userIdKey"
#define kUserNameKey        @"userNameKey"
#define kAccessTokenKey     @"accessTokenKey"
#define kRefreshTokenKey    @"rerefreshTokenKey"

@implementation UserDataStore

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.userName = [aDecoder decodeObjectForKey:kUserNameKey];
        self.userId = [aDecoder decodeObjectForKey:kUserIdKey];
        self.accessToken = [aDecoder decodeObjectForKey:kAccessTokenKey];
        self.rerefreshToken = [aDecoder decodeObjectForKey:kRefreshTokenKey];
    }
    return self;
}

- (void)saveUserDataStore {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fname = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"user.dat"];
    BOOL result = [NSKeyedArchiver archiveRootObject:self toFile:fname];
    NSLog(@"result = %d",result);
}

+ (UserDataStore *)loadUserDataStore
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fname = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"user.dat"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:fname]) {
        return [[UserDataStore alloc] init];
    }
    return [NSKeyedUnarchiver unarchiveObjectWithFile:fname];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.userId forKey:kUserIdKey];
    [aCoder encodeObject:self.userId forKey:kUserNameKey];
    [aCoder encodeObject:self.accessToken forKey:kAccessTokenKey];
    [aCoder encodeObject:self.rerefreshToken forKey:kRefreshTokenKey];
}

@end
