//
//  AnnotationModel.h
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AnnotationAuthor;
@interface AnnotationModel : NSObject

@property (nonatomic, strong) AnnotationAuthor *author;
@property (nonatomic, strong) NSString *abstract;
@property (nonatomic, strong) NSString *content;


+ (AnnotationModel *)annotationModelFromDict:(NSDictionary *)dict;

@end
