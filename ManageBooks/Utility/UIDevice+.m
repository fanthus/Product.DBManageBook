//
//  UIDevice+_.m
//
//  Created by xx on 14-8-19.
//  Copyright (c) 2014年 xx. All rights reserved.
//

#import "UIDevice+.h"
#import <sys/sysctl.h>

@implementation UIDevice (Additions)
+ (BOOL)isScreenInch4
{
    CGRect rect_screen = [[UIScreen mainScreen] bounds];
    CGSize size_screen = rect_screen.size;
    if ((320 == size_screen.width) && (568 == size_screen.height)){
        return YES;
    }
    else{
        return NO;
    }
}

+ (BOOL)isScreenInch3_5
{
    CGRect rect_screen = [[UIScreen mainScreen] bounds];
    CGSize size_screen = rect_screen.size;
    if ((320 == size_screen.width) && (480 == size_screen.height)){
        return YES;
    }
    else{
        return NO;
    }
}

+ (NSString *)machine
{
    size_t size;
	// Set 'oldp' parameter to NULL to get the size of the data
	// returned so we can allocate appropriate amount of space
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	// Allocate the space to store name
	char *name = malloc(size);
	// Get the platform name
	sysctlbyname("hw.machine", name, &size, NULL, 0);
	// Place name into a string
    NSString *machine = [NSString stringWithUTF8String:name];
	// Done with this
	free(name);
    return machine;
}

//判断平台类型：
+(NSString*)getCurrentPlatform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]){
        return @"iPhone 1G";
    }
    if ([platform isEqualToString:@"iPhone1,2"]){
        return @"iPhone 2G";
    }
    if ([platform isEqualToString:@"iPhone3,1"]){
        return @"iPhone 4";
    }
    if ([platform isEqualToString:@"iPhone2,1"]){
        return @"iPhone 3GS";
    }
    if ([platform isEqualToString:@"iPod1,1"]){
        return @"iPod touch 1G";
    }
    if ([platform isEqualToString:@"iPod1,1"]){
        return @"iPod touch 2G";
    }
    if ([platform isEqualToString:@"iPod4,1"]){
        return @"iPod touch 4G";
    }
    if ([platform isEqualToString:@"iPhone4,1"]) {
        return @"iPhone 4s";
    }
    if ([platform isEqualToString:@"iPhone5,2"]||[platform isEqualToString:@"iPhone5,1"]) {
        return @"iPhone 5";
    }
    if ([platform isEqualToString:@"iPhone5,4"]||[platform isEqualToString:@"iPhone5,3"]) {
        return @"iPhone 5c";
    }
    if ([platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone6,1"]) {
        return @"iPhone 5s";
    }
    if ([platform isEqualToString:@"iPhone7,2"]) {
        return @"iPhone 6";
    }
    if ([platform isEqualToString:@"iPhone7,1"]) {
        return @"iPhone 6 Plus";
    }
    if ([platform isEqualToString:@"iPhone8,1"]) {
        return @"iPhone 6s";
    }
    if ([platform isEqualToString:@"iPhone8,2"]) {
        return @"iPhone 6s Plus";
    }
    
    return platform;
}


//获取供应商ID
+ (NSString *)vondorID{
    if (SYSTEM_VERSION >= 6){
        return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return nil;
}

@end
