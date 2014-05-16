//
//  Posts.m
//  PostsTwo
//
//  Created by Jeff Gayle on 5/13/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "Posts.h"

@implementation Posts

-(instancetype)initWithUserName:(NSString *)userName title:(NSString *)title content:(NSString *)content timeStamp:(NSDate *)timeStamp
{
    self = [super init];
    if (self) {
        _userName = userName;
        _title = title;
        _content = content;
        _timeStamp = timeStamp;
    }
    return self;
}


@end
