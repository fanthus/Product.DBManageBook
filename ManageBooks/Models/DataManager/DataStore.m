//
//  DataStore.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "DataStore.h"

static DataStore *dataStore;

@implementation DataStore

+ (DataStore *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStore = [[DataStore alloc] init];
    });
    return dataStore;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userDataStore = [UserDataStore loadUserDataStore];
    }
    return self;
}


@end
