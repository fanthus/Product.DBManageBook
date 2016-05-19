//
//  DataStore.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserDataStore,UserSetting;

@interface DataStore : NSObject

@property (nonatomic, strong) UserSetting *userSetting;
@property (nonatomic, strong) UserDataStore *userDataStore;

+ (DataStore *)shareInstance;

@end
