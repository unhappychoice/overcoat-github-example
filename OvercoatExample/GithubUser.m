//
//  GithubUser.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/06.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "GithubUser.h"

@implementation GithubUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userID": @"id",
             @"name": @"login",
             @"avatarURL": @"avatar_url",
             };
}

+ (NSValueTransformer *)avatarURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
