//
//  ProgressVC.m
//  ManageBooks
//
//  Created by xiushanfan on 19/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "ProgressVC.h"

#define kLeftMargin     10
#define kTopMargin      10


#define kMinLegthOfPageTF       40
#define kMaxPomoCouStrLen       3
#define kMaxPageCouStrLen       5

#define kPageMiddleMargin       10

@interface ProgressVC()<UITextFieldDelegate>{
    BookModel *bookModel;
    UIScrollView *mainSV;
    
    
    
    
}

@property (nonatomic, strong) UITextField *curPageTf;
@property (nonatomic, strong) UITextField *tolPageTf;

@property (nonatomic, strong) UITextField *prePomoTF;
@property (nonatomic, strong) UITextField *curPomoTF;

@property (nonatomic, assign) CGFloat progress;

@end

@implementation ProgressVC

- (id)initWithBookModel:(BookModel *)tBookModel {
    self = [super init];
    if (self) {
        bookModel = tBookModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"进度控制";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backToHome:)];
    self.navigationItem.leftBarButtonItem=newBackButton;
    UIBarButtonItem *doneBackButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finisheDone:)];
    self.navigationItem.rightBarButtonItem =doneBackButton;
    
    mainSV = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    mainSV.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:mainSV];
    
    UIImageView *bookIV = [[UIImageView alloc] initWithFrame:CGRectMake(kLeftMargin, kTopMargin, 60, 84)];
    [bookIV setImageWithURL:[NSURL URLWithString:bookModel.images.mediumUrl] placeholderImage:nil];
    [mainSV addSubview:bookIV];
    
    NSMutableArray *pageTFArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 2; i++) {
        UITextField *pageTf = [[UITextField alloc] initWithFrame:CGRectMake( 0 , kTopMargin + 27, 40, 30)];
        pageTf.font = [UIFont systemFontOfSize:13.0f];
        pageTf.backgroundColor = [UIColor xiangyabai];
        pageTf.textColor = [UIColor darkTextColor];
        pageTf.delegate = self;
        [pageTFArray addObject:pageTf];
        [mainSV addSubview:pageTf];
    }
    self.curPageTf = [pageTFArray objectAtIndex:0];
    self.curPageTf.textAlignment = NSTextAlignmentRight;
    self.tolPageTf = [pageTFArray objectAtIndex:1];
    self.tolPageTf.textAlignment = NSTextAlignmentLeft;

    self.curPageTf.left = bookIV.right + 20;
    self.tolPageTf.left = self.curPageTf.right + kPageMiddleMargin;
    self.tolPageTf.text = bookModel.pages;
    
    UILabel *backslashLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.curPageTf.right, self.curPageTf.top, kPageMiddleMargin, 15)];
    backslashLabel.text = @"/";
    backslashLabel.backgroundColor = [UIColor xiangyabai];
    [mainSV addSubview:backslashLabel];
    
    NSMutableArray *promptLabels = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 2; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, 0, SCREEN_WIDTH - kLeftMargin*2, 40)];
        [promptLabels addObject:label];
        [mainSV addSubview:label];
    }
    
    UILabel *preLabel = [promptLabels objectAtIndex:0];
    UILabel *curLabel = [promptLabels objectAtIndex:1];
    preLabel.text = @"预计使用番茄钟数量：";
    preLabel.top = bookIV.bottom + 20;
    curLabel.text = @"已经使用的番茄钟：";
    
    NSMutableArray *pomoTFArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 2; i++) {
        UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 50)/2, 0, 100, 50)];
        tf.delegate = self;
        tf.layer.cornerRadius = 6.0f;
        tf.backgroundColor = [UIColor nenlv];
        tf.font = [UIFont systemFontOfSize:24];
        [pomoTFArray addObject:tf];
        [mainSV addSubview:tf];
    }
    self.prePomoTF = [pomoTFArray objectAtIndex:0];
    self.prePomoTF.top = preLabel.bottom + 10;
    curLabel.top = self.prePomoTF.bottom + 10;
    self.curPomoTF = [pomoTFArray objectAtIndex:1];
    self.curPomoTF.top = curLabel.bottom + 10;
    [self refreshPageTFFrame];
    [self fillAllView];
}


- (void)fillAllView {
    ProgressModel *progressModel = [ProgressManager progressModelOfBookID:bookModel.bookId];
    self.curPageTf.text = [NSString stringWithFormat:@"%ld",progressModel.curPage];
    self.tolPageTf.text = [NSString stringWithFormat:@"%ld",progressModel.allPage];
    self.prePomoTF.text = [NSString stringWithFormat:@"%ld",progressModel.allPomo];
    self.curPomoTF.text = [NSString stringWithFormat:@"%ld",progressModel.curPomo];
}

-(void)backToHome:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)finisheDone:(UIBarButtonItem *)sender {
    ProgressModel *progressModel = [ProgressManager progressModelOfBookID:bookModel.bookId];
    if (progressModel == nil) {
        progressModel = [[ProgressModel alloc] init];
        progressModel.bookId = bookModel.bookId;
        progressModel.allPomo = [self.prePomoTF.text integerValue];
        progressModel.curPomo = [self.curPomoTF.text integerValue];
        progressModel.allPage = [self.tolPageTf.text integerValue];
        progressModel.curPage = [self.curPageTf.text integerValue];
        [ProgressManager insertProgressModel:progressModel];
    }
    else {
        progressModel.allPomo = [self.prePomoTF.text integerValue];
        progressModel.curPomo = [self.curPomoTF.text integerValue];
        progressModel.allPage = [self.tolPageTf.text integerValue];
        progressModel.curPage = [self.curPageTf.text integerValue];
        [ProgressManager updateProgressModel:progressModel];
    }
    
    if ([self.delegate respondsToSelector:@selector(finishSetBookID:withProgress:)]) {
        [self.delegate finishSetBookID:bookModel.bookId withProgress:[self progressOfBook]];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSInteger tfMaxLength = 0;
    if (textField == self.prePomoTF || textField == self.curPomoTF) {
        tfMaxLength = kMaxPomoCouStrLen;
    }
    else {
        tfMaxLength = kMaxPageCouStrLen;
    }
    if (textField.text.length >= tfMaxLength) {
        if (range.location == tfMaxLength - 1 && range.length == 1 && string.length == 0) {
            return YES;
        }
        return NO;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.curPomoTF) {
        NSInteger curPage = [self.tolPageTf.text integerValue] * [self progressOfBook];
        self.curPageTf.text = [NSString stringWithFormat:@"%ld",curPage];
    }
    [self refreshPageTFFrame];
}


- (CGFloat)progressOfBook {
    return [self.curPomoTF.text floatValue] / [self.prePomoTF.text floatValue];
}

- (void)refreshPageTFFrame {
    CGSize curPagesize = [self pageTFSizeOfString:self.curPageTf.text];
    self.curPageTf.size = curPagesize;
    CGSize tolPagesize = [self pageTFSizeOfString:self.tolPageTf.text];
    self.tolPageTf.size = tolPagesize;
    self.tolPageTf.left = self.curPageTf.right + kPageMiddleMargin;
}


- (CGSize)pageTFSizeOfString:(NSString *)pageStr {
    CGSize size = [pageStr sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0f],NSFontAttributeName,nil]];
    if (size.width < kMinLegthOfPageTF) {
        size.width = kMinLegthOfPageTF;
    }
    return size;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if ([self isDigit:textField.text]) {
        return YES;
    }
    return NO;
}

- (BOOL)isDigit:(NSString *)string {
    NSCharacterSet *notDemicalDigitSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange demicalDigitRange  = [string rangeOfCharacterFromSet:notDemicalDigitSet options:NSCaseInsensitiveSearch];
    if (demicalDigitRange.location == NSNotFound) {
        return YES;
    }
    return NO;
}


@end
