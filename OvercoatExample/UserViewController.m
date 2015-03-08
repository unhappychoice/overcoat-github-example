//
//  UserViewController.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/09.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "UserViewController.h"
#import "GithubUser.h"

@interface UserViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation UserViewController

# pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showUser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

# pragma mark - private

- (void)showUser {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.user.url];
    [_webView loadRequest:request];
}

@end
