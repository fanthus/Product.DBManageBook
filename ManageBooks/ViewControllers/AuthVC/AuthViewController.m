//
//  AuthViewController.m
//  ManageBooks
//
//  Created by xiushanfan on 16/5/16.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "AuthViewController.h"
#import "AuthDataController.h"


//Related Douban Guide url:https://developers.douban.com/wiki/?title=oauth2

@interface AuthViewController ()<UIWebViewDelegate> {
    
}

@end

@implementation AuthViewController

- (void)viewDidLoad {
    self.title = @"豆瓣授权页面";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelAuth:)];
    NSString *url = [UrlBuilder urlWithType:kDBAuth andDict:[AuthDataController authParamDict]];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.view addSubview:webView];
}

- (void)cancelAuth:(UIBarButtonItem *)barButtonItem {
    if ([self.delegate respondsToSelector:@selector(finishedGetToken:)]) {
        [self.delegate finishedGetToken:nil];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"shouldStartLoadWithRequest = %@",request);
    if ([request.URL.absoluteString hasPrefix:DBRedirectUrl]) {
        NSArray *comArray = [request.URL.absoluteString componentsSeparatedByString:@"?"];
        NSString *codeUrl = [comArray objectAtIndex:1];
        if ([codeUrl rangeOfString:@"code"].length > 0) {
            NSString *code = [[codeUrl componentsSeparatedByString:@"="] objectAtIndex:1];
            AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] init];
            sessionManager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
            sessionManager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
            [sessionManager POST:[UrlBuilder urlWithType:kDBToken andDict:nil]
                      parameters:[AuthDataController tokenParamDictWithAuthCode:code]
                        progress:^(NSProgress * _Nonnull uploadProgress) {}
                         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                             NSLog(@"responseObject = %@",responseObject);
                             NSDictionary *accessJsonDict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                                            options:NSJSONReadingAllowFragments
                                                                                              error:nil];
                             if ([self.delegate respondsToSelector:@selector(finishedGetToken:)]) {
                                 [self.delegate finishedGetToken:accessJsonDict];
                             }
                         }
                         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                             NSLog(@"error = %@",error);
                         }];
        }
        else {
            if ([self.delegate respondsToSelector:@selector(finishedGetToken:)]) {
                [self.delegate finishedGetToken:nil];
            }
        }
        return NO;
    }
    return  YES;
}



@end
