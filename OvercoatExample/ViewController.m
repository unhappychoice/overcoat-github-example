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
#import "GithubUsersDataSource.h"
#import <Overcoat/Overcoat.h>
#import <Overcoat/PromiseKit+Overcoat.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) GithubClient *client;
@property (strong, nonatomic) GithubUsersDataSource *dataSource;
@end

@implementation ViewController

# pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

# pragma mark - private

- (void)loadUsers {
    _client = [GithubClient new];
    [_client fetchRandomUsers].then(^(NSArray *users){
        _dataSource = [[GithubUsersDataSource alloc] initWithUsers:users];
        _tableView.dataSource = _dataSource;
        [_tableView reloadData];
    });
}
@end
