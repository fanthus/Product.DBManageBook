//
//  AnnotationView.h
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnnotationViewProtocol <NSObject>

- (void)fetchAnnotationList;

@end


@interface AnnotationView : UITableView

@property (nonatomic, assign) id<AnnotationViewProtocol> URLDelegate;


- (void)fetchAnnotationList;

- (void)refreshWithAnnotaionList:(NSArray *)tAnnotationArray;

@end
