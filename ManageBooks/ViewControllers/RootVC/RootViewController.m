//
//  ViewController.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "RootViewController.h"
#import "AuthViewController.h"
#import "RootDataController.h"
#import "BaseBookCell.h"
#import "BookDetailVC.h"
#import <AFNetworking.h>

#define kAccessTokenKey     @"access_token"
#define kDBUserIdKey        @"douban_user_id"
#define kDBUserNameKey      @"douban_user_name"
#define kExpiresInKey       @"expires_in"
#define kRefreshTokenKey    @"refresh_token"



//"access_token" = d5f9ddc6bac6728081ed995430535780;
//"douban_user_id" = 52549845;
//"douban_user_name" = Three;
//"expires_in" = 604799;
//"refresh_token" = 57de2f38172d8e65079a8da84588ab2f;

@interface RootViewController () <UIWebViewDelegate,AuthProtocol,UITableViewDelegate,UITableViewDataSource,RootDataProtocol,ProgressVCDelegate> {
    AuthViewController *authVC;
    UINavigationController *authNav;
    UIButton *authButton;
    UIImageView *authIV;
    UITableView *bookListTV;
    NSMutableArray *bookList;
    
    DataStore *dataStore;
    RootDataController *rootDC;
    FetchType fetchType;
    
    MJRefreshFooter *refreshFooter;
}

@end

@implementation RootViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        dataStore = [DataStore shareInstance];
        rootDC = [[RootDataController alloc] init];
        rootDC.delegate = self;
        bookList = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor  = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"想读",@"在读",@"读过"]];
    [segmentControl addTarget:self action:@selector(segChanged:) forControlEvents:UIControlEventValueChanged];
    segmentControl.selectedSegmentIndex = [self segIndexOfFetchType:dataStore.userSetting.fetchType];
    self.navigationItem.titleView = segmentControl;
    
    UIBarButtonItem *searchBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBooks:)];
    self.navigationItem.rightBarButtonItem = searchBtnItem;
    
    authButton = [UIButton buttonWithType:UIButtonTypeSystem];
    authButton.frame = CGRectMake((SCREEN_WIDTH - 200)/2 , 200, 200, 60);
    [authButton setTitle:@"豆瓣授权" forState:UIControlStateNormal];
    [authButton setTitleColor:[UIColor lvchen] forState:UIControlStateNormal];
    [authButton addTarget:self action:@selector(doubanAuth:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:authButton];
    authIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"douban_icon"]];
    authIV.frame = CGRectMake((SCREEN_WIDTH - 48)/2, authButton.top - 48 - 20, 48, 48);
    [self.view addSubview:authIV];
    
    bookListTV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    bookListTV.delegate = self;
    bookListTV.dataSource = self;
    bookListTV.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    bookListTV.separatorColor = [UIColor lightGrayColor];
    bookListTV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:bookListTV];
    bookListTV.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore:)];
    [bookListTV addSubview:refreshFooter];
    
    [rootDC fetchAllBooksWithType:dataStore.userSetting.fetchType dir:kFetchDirPre position:0];
}

- (void)segChanged:(UISegmentedControl *)segControl {
    fetchType = [self fetchTypeOfSegControl:segControl];
    dataStore.userSetting.fetchType = fetchType;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    [rootDC fetchAllBooksWithType:fetchType dir:kFetchDirPre position:0];
}

- (void)searchBooks:(id)sender {
    //
}


- (NSInteger)segIndexOfFetchType:(FetchType)tFetchType {
    NSInteger index = 0;
    switch (tFetchType) {
        case kFetchWish:{
            index = 0;
        }
            break;
        case kFeatchReading:{
            index = 1;
        }
            break;
        case kFetchRead:{
            index = 2;
        }
            break;
        default:
            break;
    }
    return index;
}

- (FetchType)fetchTypeOfSegControl:(UISegmentedControl *)segControl {
    FetchType tFetchType;
    if (segControl.selectedSegmentIndex == 0) {
        tFetchType = kFetchWish;
    }
    else if (segControl.selectedSegmentIndex == 1) {
        tFetchType = kFeatchReading;
    }
    else {
        tFetchType = kFetchRead;
    }
    return tFetchType;
}

- (void)viewWillAppear:(BOOL)animated {
    if (dataStore.userDataStore.userId) {
        authButton.hidden = YES;
        bookListTV.hidden = NO;
        self.navigationItem.titleView.hidden = NO;
    }
    else {
        authButton.hidden = NO;
        bookListTV.hidden = YES;
        self.navigationItem.titleView.hidden = YES;
    }
}

- (void)doubanAuth:(id)sender {
    authVC = [[AuthViewController alloc] init];
    authVC.delegate = self;
    authNav = [[UINavigationController alloc] initWithRootViewController:authVC];
    [self presentViewController:authNav
                       animated:YES
                     completion:^{
                         //
                     }];
}

- (void)revokeDBAccessToken:(UIButton *)button {
    //
}

- (void)requestDBAccessToken:(UIButton *)button {
    
}

- (void)loadMore:(id)sender {
    [rootDC fetchAllBooksWithType:fetchType dir:kFetchDirAft position:bookList.count];
}

#pragma mark - AuthProtocol 

- (void)finishedGetToken:(NSDictionary *)tokenDict {
    [authNav dismissViewControllerAnimated:YES
                                completion:^{}];
    if (tokenDict == nil) { return; }
    if (authButton.superview) {
        [authButton removeFromSuperview];
    }
    dataStore.userDataStore.userName = [tokenDict objectForKey:kDBUserNameKey];
    dataStore.userDataStore.userId = [tokenDict objectForKey:kDBUserIdKey];
    dataStore.userDataStore.accessToken = [tokenDict objectForKey:kAccessTokenKey];
    dataStore.userDataStore.rerefreshToken = [tokenDict objectForKey:kRefreshTokenKey];
    [dataStore.userDataStore saveUserDataStore];
    self.title = dataStore.userDataStore.userName;
    //
    self.navigationItem.titleView.hidden = NO;
    bookListTV.hidden = NO;
    [rootDC fetchAllBooksWithType:kFetchWish dir:kFetchDirPre position:0];
}

#pragma mark - UITableViewDelegate 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UserBookModel *uBookModel = (UserBookModel *)[bookList objectAtIndex:indexPath.row];
    BookDetailVC *bookDetailVC = [[BookDetailVC alloc] initWithBookModel:uBookModel];
    [self.navigationController pushViewController:bookDetailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kBaseBookCellHeight;
}

#pragma mark - UITableViewDataSource

- (BaseBookCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseBookCell  *cell = (BaseBookCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSString *cellId = @"BookCell";
    if (cell == nil) {
        cell = [[BaseBookCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    UserBookModel *uBookModel = [bookList objectAtIndex:indexPath.row];
    [cell.bookIV setImageWithURL:[NSURL URLWithString:uBookModel.bookModel.image]];
    cell.titleLabel.text = uBookModel.bookModel.title;
    NSMutableString *authorStr = [NSMutableString stringWithCapacity:0];
    for (NSString *author in uBookModel.bookModel.authors) {
        [authorStr appendString:author];
        [authorStr appendString:@"&"];
    }
    if (authorStr.length > 0) {
        [authorStr deleteCharactersInRange:NSMakeRange(authorStr.length-1, 1)];
    }
    cell.authorLabel.text = authorStr;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@",uBookModel.bookModel.price];
    if (fetchType == kFeatchReading) {
        ProgressModel *progressModel = [ProgressManager progressModelOfBookID:uBookModel.bookModel.bookId];
        cell.progress = progressModel.progress;
        [cell tapProgressBlock:^{
            ProgressVC *progressVC  = [[ProgressVC alloc] initWithBookModel:uBookModel.bookModel];
            progressVC.delegate = self;
            [self.navigationController pushViewController:progressVC animated:YES];
        }];
    }
    else {
        cell.progressView.hidden = YES;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return bookList.count;
}

#pragma mark - ProgressVCDelegate

- (void)finishSetBookID:(NSString *)bookId withProgress:(CGFloat)progress {
    NSInteger index = 0;
    for (int i = 0;i < bookList.count;i ++) {
        UserBookModel *uBookModel = [bookList objectAtIndex:i];
        if ([bookId isEqualToString:uBookModel.bookModel.bookId]) {
            index = i;
        }
    }
    BaseBookCell *cell = [bookListTV cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    cell.progress = progress;
}

#pragma mark - RootDataProtocol 

- (void)fetchAllBooksFinished:(NSArray *)allBooks withDir:(FetchDir)fetchDir{
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
    if (allBooks.count == 0) {
        [refreshFooter endRefreshingWithNoMoreData];
    }
    else {
        [refreshFooter endRefreshing];
    }
    switch (fetchDir) {
        case kFetchDirAft:
        {
            [bookList addObjectsFromArray:allBooks];
        }
            break;
        case kFetchDirPre: {
            [bookList removeAllObjects];
            [bookList addObjectsFromArray:allBooks];
        }
        default:
            break;
    }
    [bookListTV reloadData];
}

- (void)fetchBooksFailed {
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
    MBProgressHUD *textHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    textHud.mode = MBProgressHUDModeText;
    textHud.labelText = @"获取信息失败";
    [textHud hide:YES afterDelay:0.5];
    
}

@end
