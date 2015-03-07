//
//  GithubUsersDataSource.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/07.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "GithubUsersDataSource.h"
#import "GithubUser.h"

@interface GithubUsersDataSource()
@property (strong, nonatomic) NSArray *users;
@end

@implementation GithubUsersDataSource

- (instancetype)initWithUsers:(NSArray *)users {
    self = [super init];
    if (self) {
        _users = users;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"user";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    GithubUser *user = _users[indexPath.row];
    cell.textLabel.text = user.name;
    return cell;
}
@end
