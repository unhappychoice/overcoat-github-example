//
//  ViewController.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/06.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "ViewController.h"
#import "GithubClient.h"
#import "GithubUser.h"
#import <Overcoat/Overcoat.h>
#import <Overcoat/PromiseKit+Overcoat.h>

@interface ViewController ()
@property(strong, nonatomic)GithubClient *client;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _client = [GithubClient new];
    [_client fetchRandomUsers].then(^(NSArray *users){
        for (GithubUser *user in users) {
            NSLog(@"%@", user);
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
