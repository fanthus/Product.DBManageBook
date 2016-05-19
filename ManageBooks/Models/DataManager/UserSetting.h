//
//  UserSetting.h
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kFetchWish,
    kFetchRead,
    kFeatchReading
}FetchType;

@interface UserSetting : NSObject

@property (nonatomic, assign) FetchType fetchType;



@end
