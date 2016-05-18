//
//  BookDetailDC.h
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BookDetailDataProtocol <NSObject>

- (void)downloadBigImageFinished:(UIImage *)bigImage;

@end


@interface BookDetailDC : NSObject

@property (nonatomic, assign) id<BookDetailDataProtocol> delegate;
@property (nonatomic, strong) UserBookModel *userBookModel;


- (void)downloadBigImageWithUrl:(NSString *)iu;

@end
