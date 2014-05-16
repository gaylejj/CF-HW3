//
//  PostsTableViewCell.h
//  PostsTwo
//
//  Created by Jeff Gayle on 5/13/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Posts;

@interface PostsTableViewCell : UITableViewCell

@property (strong, nonatomic) Posts *post;
-(void)setPost:(Posts *)post;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@end
