//
//  RootDataController.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootViewController.h"

typedef enum {
    kFetchDirPre,
    kFetchDirAft,
}FetchDir;

@protocol RootDataProtocol <NSObject>

- (void)fetchAllBooksFinished:(NSArray *)allBooks withDir:(FetchDir)fetchDir;

- (void)fetchBooksFailed;

@end

@interface RootDataController : NSObject

@property (nonatomic, assign) id<RootDataProtocol> delegate;

- (void)fetchAllBooksWithType:(FetchType)fetchType dir:(FetchDir)fetchDir position:(NSInteger)position;

@end
