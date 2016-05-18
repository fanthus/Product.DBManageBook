//
//  BookDetailVC.m
//  ManageBooks
//
//  Created by xiushanfan on 18/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "BookDetailVC.h"
#import "BookDetailDC.h"

#define DEBUGMODE 0

@interface BookDetailVC() {
    BookDetailDC *bookDetailDC;
    AFHTTPSessionManager *sessionManager;
    
    UIScrollView *mainSV;
}

@end


@implementation BookDetailVC

- (id)initWithBookModel:(UserBookModel *)uBookModel {
    self = [super init];
    if (self) {
        bookDetailDC = [[BookDetailDC alloc] init];
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
    authorLabel.text = [NSString stringWithFormat:@"作者:%@",[self bookAuthorStringOfAuthors:bookDetailDC.userBookModel.bookModel.authors]];
    authorLabel.top = bookTitleLabel.bottom + 3;
    
    
    NSMutableArray *summaryArray = [NSMutableArray arrayWithObjects:[self bookSummary],[self authorSummary], nil];
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
    
    
    mainSV.contentSize = CGSizeMake(SCREEN_WIDTH, authorSummaryLabel.bottom > (SCREEN_HEIGHT + 1) ? authorSummaryLabel.bottom : (SCREEN_HEIGHT + 1));
    
}


- (NSAttributedString *)bookSummary  {
    NSString *bookSummaryStr = [NSString stringWithFormat:@"简介:\n\t%@",bookDetailDC.userBookModel.bookModel.summary];
    NSMutableAttributedString *bookSummary = [[NSMutableAttributedString alloc] initWithString:bookSummaryStr attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14.0f],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    [bookSummary addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor baolan],NSForegroundColorAttributeName, nil] range:NSMakeRange(0, 3)];
    return bookSummary;
}

- (NSAttributedString *)authorSummary {
    NSString *authorSummaryStr = [NSString stringWithFormat:@"作者:\n\t%@",bookDetailDC.userBookModel.bookModel.author_intro];
    NSMutableAttributedString *authorSummary = [[NSMutableAttributedString alloc] initWithString:authorSummaryStr attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14.0f],NSFontAttributeName,[UIColor blackColor],NSForegroundColorAttributeName, nil]];
    [authorSummary addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor baolan],NSForegroundColorAttributeName, nil] range:NSMakeRange(0, 3)];
    return authorSummary;
}

- (NSString *)bookAuthorStringOfAuthors:(NSArray *)authors {
    if (authors.count == 0) { return @"暂无"; }
    NSMutableString *author = [NSMutableString stringWithCapacity:0];
    for (NSString *tAuthor in authors) {
        [author appendString:tAuthor];
        [author appendString:@"&"];
    }
    [author deleteCharactersInRange:NSMakeRange(author.length - 1, 1)];
    return author;
}


- (void)showBigBookImage:(id)sender {
    
}



@end
