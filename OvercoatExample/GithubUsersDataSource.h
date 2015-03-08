//
//  GithubUsersDataSource.h
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/07.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GithubUsersDataSource : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSArray *users;

- (instancetype)initWithUsers:(NSArray *)users;

@end
