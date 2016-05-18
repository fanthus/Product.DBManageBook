//
//  ReadTypeView.h
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ReadBaseTag  210

typedef enum {
    kReadWish = ReadBaseTag,
    kReadReading,
    kReadReaded,
}ReayType;

@protocol ReadTypeProtocol <NSObject>

- (void)readType:(ReayType)readType;

@end


@interface ReadTypeView : UIView

@property (nonatomic, assign) id<ReadTypeProtocol> delegate;



@end
