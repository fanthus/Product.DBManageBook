//
//  BookDetailVC.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BookDetailVC.h"
#import "BookDetailDC.h"
#import "ReadTypeView.h"
#import "AnnotationView.h"
#import "ThirdPartHeader.h"

#define DEBUGMODE 0

@interface BookDetailVC()<DCPathButtonDelegate,ReadTypeProtocol,AnnotationViewProtocol,BookDetailDataProtocol> {
    BookDetailDC *bookDetailDC;
    AFHTTPSessionManager *sessionManager;
    
    UIScrollView *mainSV;
    AnnotationView *annotationView ;
}

@end


@implementation BookDetailVC

- (id)initWithBookModel:(UserBookModel *)uBookModel {
    self = [super init];
    if (self) {
        bookDetailDC = [[BookDetailDC alloc] init];
        bookDetailDC.delegate = self;
        bookDetailDC.userBookModel = uBookModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = bookDetailDC.userBookModel.bookModel.title;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareBook:)];
    
    mainSV = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    mainSV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:mainSV];
    
    UIButton *bookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bookBtn.frame = CGRectMake(10, 10, 50, 50);
    bookBtn.layer.cornerRadius = 10.0f;
    bookBtn.clipsToBounds = YES;
    bookBtn.layer.borderColor = [UIColor greenColor].CGColor;
    [bookBtn addTarget:self action:@selector(showBigBookImage:) forControlEvents:UIControlEventTouchUpInside];
    [bookBtn setImageForState:UIControlStateNormal withURL:[NSURL URLWithString:bookDetailDC.userBookModel.bookModel.image] placeholderImage:[UIImage imageWithColor:[UIColor grayColor] andSize:CGSizeMake(20, 20)]];
    [mainSV addSubview:bookBtn];
    
    NSMutableArray *labelArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 2; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(bookBtn.right + 10, 0, SCREEN_WIDTH - bookBtn.right - 10 - 10, 20)];
#if DEBUGMODE
        label.backgroundColor = [UIColor randomColor];
#else
        label.backgroundColor = [UIColor clearColor];
#endif
        label.font = [UIFont systemFontOfSize:13.0f];
        label.textColor = [UIColor qingcong];
        [labelArray addObject:label];
        [mainSV addSubview:label];
    }
    UILabel *bookTitleLabel = [labelArray objectAtIndex:0];
    UILabel *authorLabel = [labelArray objectAtIndex:1];
    bookTitleLabel.text = [NSString stringWithFormat:@"书名:%@",bookDetailDC.userBookModel.bookModel.title];
    bookTitleLabel.top = 10;
    authorLabel.text = [NSString stringWithFormat:@"作者:%@",[bookDetailDC bookAuthorStringOfAuthors:bookDetailDC.userBookModel.bookModel.authors]];
    authorLabel.top = bookTitleLabel.bottom + 3;
    
    NSMutableArray *summaryArray = [NSMutableArray arrayWithObjects:[bookDetailDC bookSummary],[bookDetailDC authorSummary], nil];
    NSMutableArray *summaryLabels = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 2; i++) {
        UILabel *introLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, bookBtn.bottom + 10, SCREEN_WIDTH - 20, 80)];
#if DEBUGMODE
        introLabel.backgroundColor = [UIColor randomColor];
#else
        introLabel.backgroundColor = [UIColor clearColor];
#endif
        introLabel.numberOfLines = 0;
        introLabel.attributedText = [summaryArray objectAtIndex:i];
        [introLabel sizeToFit];
        [summaryLabels addObject:introLabel];
        [mainSV addSubview:introLabel];
    }
    UILabel *bookSummaryLabel = [summaryLabels objectAtIndex:0];
    bookSummaryLabel.top = bookBtn.bottom + 10;
    UILabel *authorSummaryLabel = [summaryLabels objectAtIndex:1];
    authorSummaryLabel.top = bookSummaryLabel.bottom + 10;

    DCPathButton *pathBtn = [[DCPathButton alloc] initWithButtonFrame:CGRectMake(SCREEN_WIDTH - 10 - 40, mainSV.bottom - 10 - 40 - 64, 40, 40)
                                                          centerImage:[UIImage imageNamed:@"green"]
                                                     highlightedImage:[UIImage imageNamed:@""]];
    pathBtn.delegate = self;
    pathBtn.bloomDirection = kDCPathButtonBloomDirectionTopLeft;
    DCPathItemButton *readTypeBtn = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"green"] highlightedImage:nil backgroundImage:nil backgroundHighlightedImage:nil];
    DCPathItemButton *commentListBtn = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"green"] highlightedImage:nil backgroundImage:nil backgroundHighlightedImage:nil];
    DCPathItemButton *myCommentBtn = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"green"] highlightedImage:nil backgroundImage:nil backgroundHighlightedImage:nil];
    
    [pathBtn addPathItems:@[readTypeBtn,commentListBtn,myCommentBtn]];
    [self.view addSubview:pathBtn];
    
    CGFloat svContentHeight = authorSummaryLabel.bottom > (SCREEN_HEIGHT + 40) ? authorSummaryLabel.bottom : (SCREEN_HEIGHT + 40);
    mainSV.contentSize = CGSizeMake(SCREEN_WIDTH, svContentHeight);
}

- (void)shareBook:(id)sender {
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[[bookDetailDC shareContent]]
                                                                             applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypeAssignToContact, UIActivityTypeAirDrop];
    [self presentViewController:activityVC animated:TRUE completion:nil];
}

- (void)showBigBookImage:(id)sender {
    
}

#pragma mark - BookDetailDataProtocol 

- (void)fetchAnnotationListFinished:(NSArray *)annotationList {
    [annotationView refreshWithAnnotaionList:annotationList];
}

#pragma mark - DCPathItemButtonDelegate 

- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex {
    if (itemButtonIndex == 0) {
        ReadTypeView *readTypeView = [[ReadTypeView alloc] init];
        readTypeView.delegate = self;
        [FRMaskImageViewManager showDisplayedViewOnmaskView:readTypeView withOrigin:CGPointMake(0, SCREEN_HEIGHT - 200) maskAlpha:0.5 animation:YES];
    }
    else if (itemButtonIndex == 1) {
        annotationView = [[AnnotationView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 84) style:UITableViewStylePlain];
        annotationView.URLDelegate = self;
        [annotationView fetchAnnotationList];
        [FRMaskImageViewManager showDisplayedViewOnmaskView:annotationView withOrigin:CGPointMake(10, 50) maskAlpha:0.3 animation:YES];
    }
    else if (itemButtonIndex == 2) {
        //
    }
    
}

#pragma mark - AnnotationViewProtocol 

- (void)fetchAnnotationList {
    NSString *fetchBookAnnotationUrl = [UrlBuilder urlWithType:kDBBookAnnotationiList andDict:[NSDictionary dictionaryWithObject:bookDetailDC.userBookModel.bookModel.bookId forKey:kBookIDKey]];
    [bookDetailDC fetchBookAnnotationWithUrl:fetchBookAnnotationUrl];
}

#pragma mark - ReadTypeProtocol 

- (void)readType:(ReayType)readType {
    NSString *status = @"";
    switch (readType) {
        case kReadWish: {
            status = @"wish";
        }
            break;
        case kReadReaded:{
            status = @"read";
        }
            break;
        case kReadReading: {
            status = @"reading";
        }
        default:
            break;
    }
    NSString *modifyBookColUrl = [UrlBuilder urlWithType:kDBModifyBookCol andDict:[NSDictionary dictionaryWithObject:bookDetailDC.userBookModel.bookModel.bookId forKey:kBookIDKey]];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:status forKey:@"status"];
    [bookDetailDC modifyBookColWithUrl:modifyBookColUrl
                              withDict:dict];
    [FRMaskImageViewManager dismissMaskView];
}

@end
