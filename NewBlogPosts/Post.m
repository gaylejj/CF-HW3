//
//  Posts.m
//  NewBlogPosts
//
//  Created by Jeff Gayle on 5/16/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "Post.h"

@implementation Post

-(instancetype)initWithUserName:(NSString *)userName title:(NSString *)title content:(NSString *)content timeStamp:(NSDate *)timeStamp image:(UIImage *)photo
{
    self = [super init];
    if (self) {
        _userName = userName;
        _title = title;
        _content = content;
        _timeStamp = timeStamp;
        _photo = photo;
    }
    return self;
}

@end
