//
//  UserDataStore.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataStore : NSObject<NSCoding>

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *rerefreshToken;

- (void)saveUserDataStore;

+ (UserDataStore *)loadUserDataStore;

@end
