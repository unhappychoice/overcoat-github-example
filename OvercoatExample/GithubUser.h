//
//  GithubUser.h
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/06.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface GithubUser : MTLModel <MTLJSONSerializing>
@property (copy, nonatomic, readonly) NSNumber *userID;
@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSURL *url;
@property (copy, nonatomic, readonly) NSURL *avatarURL;
@end
