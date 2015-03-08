//
//  GithubClient.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/06.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "GithubClient.h"
#import "GithubUser.h"
#import <Overcoat/Overcoat.h>
#import <Overcoat/PromiseKit+Overcoat.h>

@implementation GithubClient

# pragma mark - lifecycle

- (instancetype)init {
    self = [super initWithBaseURL:[NSURL URLWithString:@"https://api.github.com/"]];
    return self;
}

# pragma mark - overcoat

+ (NSDictionary *)modelClassesByResourcePath {
    return @{
             @"users": [GithubUser class]
             };
}

- (PMKPromise *)fetchRandomUsers {
    NSInteger index = arc4random() % 100000 + 100000;
    NSDictionary *params = @{@"since": [NSNumber numberWithInteger:index] };
    return [self GET:@"users" parameters:params].then(^(OVCResponse *response) {
        return response.result;
    }).catch(^(NSError *error){
        NSLog(@"%@", error);
    });
}

@end
