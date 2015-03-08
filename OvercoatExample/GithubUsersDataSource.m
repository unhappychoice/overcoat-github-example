//
//  GithubUsersDataSource.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/07.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "GithubUsersDataSource.h"
#import "GithubUser.h"
#import "GithubUserCell.h"

@implementation GithubUsersDataSource

# pragma mark - lifecycle

- (instancetype)initWithUsers:(NSArray *)users {
    self = [super init];
    if (self) {
        _users = users;
    }
    return self;
}

# pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GithubUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"user"];
    if (!cell) {
        cell = [GithubUserCell new];
    }
    
    [cell setUser:_users[indexPath.row]];
    return cell;
}

@end
