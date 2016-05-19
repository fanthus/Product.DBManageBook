//
//  AnnotationView.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "AnnotationView.h"
#import "AnnotationCell.h"
#import "AnnotationModel.h"
#import "AnnotationAuthor.h"

@interface AnnotationView() <UITableViewDelegate,UITableViewDataSource>{
    NSArray *annotationArray;
}

@end

@implementation AnnotationView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.layer.cornerRadius = 5.0f;
        self.delegate = self;
        self.dataSource = self;
        self.separatorInset = UIEdgeInsetsZero;
    }
    return self;
}

- (void)fetchAnnotationList {
    if ([self.URLDelegate respondsToSelector:@selector(fetchAnnotationList)]) {
        [self.URLDelegate fetchAnnotationList];
    }
}

- (void)refreshWithAnnotaionList:(NSArray *)tAnnotationArray {
    annotationArray = tAnnotationArray;
    [self reloadData];
}

#pragma mark - UITableViewDelegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return annotationArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kAnnotationCellHeight;
}

- (AnnotationCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = @"annotationCell";
    AnnotationCell *annotationCell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (annotationCell == nil) {
        annotationCell = [[AnnotationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        annotationCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    AnnotationModel *annotationModel = [annotationArray objectAtIndex:indexPath.row];
    annotationCell.annoModel = annotationModel;
    return annotationCell;
}



@end
