//
//  AnnotationAuthor.h
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnnotationAuthor : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *alt;        //web home page.
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *large_avatar;


+ (AnnotationAuthor *)annoAuthorFromDict:(NSDictionary *)dict;

@end
