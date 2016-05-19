//
//  MBFileManager.h
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kDBFile,
}FileType;

@interface MBFileManager : NSObject

+ (NSString *)pathOfFileType:(FileType)fileType;

@end
