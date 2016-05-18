//
//  AnnotationModel.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "AnnotationModel.h"

@implementation AnnotationModel



+ (AnnotationModel *)annotationModelFromDict:(NSDictionary *)dict {
    AnnotationModel *annotationModel = [[AnnotationModel alloc] init];
    annotationModel.abstract = [dict objectForKey:@"abstract"];
    annotationModel.author = [AnnotationAuthor annoAuthorFromDict:[dict objectForKey:@"author_user"]];
    return annotationModel;
}

@end
