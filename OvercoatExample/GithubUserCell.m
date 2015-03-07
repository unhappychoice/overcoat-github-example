//
//  GithubUserCell.m
//  OvercoatExample
//
//  Created by yuji ueki on 2015/03/07.
//  Copyright (c) 2015年 yudo. All rights reserved.
//

#import "GithubUserCell.h"
#import "GithubUser.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation GithubUserCell

- (instancetype)init {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"user"];
    return self;
}

- (void)setUser:(GithubUser *)user {
    self.textLabel.text = user.name;
    [self.imageView sd_setImageWithURL:user.avatarURL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self setNeedsLayout];
    }];
}

@end
