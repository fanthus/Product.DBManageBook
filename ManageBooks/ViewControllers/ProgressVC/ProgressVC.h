//
//  ProgressVC.h
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProgressVCDelegate <NSObject>

- (void)finishSetBookID:(NSString *)bookId withProgress:(CGFloat)progress;

@end

@interface ProgressVC : UIViewController

@property (nonatomic, assign) id<ProgressVCDelegate> delegate;

- (id)initWithBookModel:(BookModel *)tBookModel;

@end
