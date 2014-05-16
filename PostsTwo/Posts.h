//
//  Posts.h
//  PostsTwo
//
//  Created by Jeff Gayle on 5/13/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Posts : NSObject

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (strong, nonatomic) NSDate *timeStamp;

-(instancetype)initWithUserName:(NSString *)userName title:(NSString *)title content:(NSString *)content timeStamp:(NSDate *)timeStamp;

@end
