//
//  SqlightResult.h
//  sqlight
//
//  Created by Jiajun.Gao on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

@class SqliteResult,SMEventModel;


@interface SqliteResult : NSObject

@property (nonatomic, assign)NSInteger code;
@property (nonatomic, strong)NSString* msg;
@property (nonatomic, strong)NSMutableArray* data;

@end