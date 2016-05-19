//
//  MBFileManager.m
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "MBFileManager.h"

@implementation MBFileManager

+ (NSString *)pathOfFileType:(FileType)fileType {
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [array objectAtIndex:0];
    NSString *filePath = nil;
    switch (fileType) {
        case kDBFile:
        {
            filePath = [NSString stringWithFormat:@"%@/%@",documentPath,@"book.db"];
        }
            break;
            
        default:
            break;
    }
    return filePath;
}

@end
