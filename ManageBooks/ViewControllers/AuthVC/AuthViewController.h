//
//  AuthViewController.h
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AuthProtocol <NSObject>

- (void)finishedGetToken:(NSDictionary *)tokenDict;

@end

@interface AuthViewController : UIViewController

@property (nonatomic, assign) id<AuthProtocol> delegate;

@end
