//
//  ViewController.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/06.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "UsersViewController.h"
#import "GithubClient.h"
#import "GithubUser.h"
#import "GithubUsersDataSource.h"
#import "UserViewController.h"
#import <Overcoat/Overcoat.h>
#import <Overcoat/PromiseKit+Overcoat.h>

@interface UsersViewController () <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) GithubClient *client;
@property (strong, nonatomic) GithubUsersDataSource *dataSource;
@end

@implementation UsersViewController

# pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUsers];
    _tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"userProfile"]) {
        NSIndexPath *selectedPath = self.tableView.indexPathForSelectedRow;
        GithubUser *user = self.dataSource.users[selectedPath.row];
        UserViewController *c = (UserViewController *)segue.destinationViewController;
        c.user = user;
    }
}

# pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"userProfile" sender:self];
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
