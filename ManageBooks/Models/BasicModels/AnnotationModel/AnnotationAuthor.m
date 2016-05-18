//
//  AnnotationAuthor.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "AnnotationAuthor.h"

@implementation AnnotationAuthor

+ (AnnotationAuthor *)annoAuthorFromDict:(NSDictionary *)dict {
    AnnotationAuthor *author = [[AnnotationAuthor alloc] init];
    author.name = [dict objectForKey:@"name"];
    author.url = [dict objectForKey:@"url"];
    author.alt  = [dict objectForKey:@"alt"];
    author.userId = [dict objectForKey:@"userId"];
    author.large_avatar = [dict objectForKey:@"large_avatar"];
    return author;
}

@end
