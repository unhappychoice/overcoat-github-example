//
//  GithubClient.h
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/06.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "OVCHTTPSessionManager.h"

@class PMKPromise;

@interface GithubClient : OVCHTTPSessionManager

- (PMKPromise *)fetchRandomUsers;

@end
