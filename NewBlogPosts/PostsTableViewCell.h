//
//  PostsTableViewCell.h
//  NewBlogPosts
//
//  Created by Jeff Gayle on 5/16/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostsTableViewCell : UITableViewCell

@property (strong, nonatomic) Post *post;
-(void)setPost:(Post *)post;

@property (strong, nonatomic) IBOutlet UILabel* postTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *postContentLabel;
@property (strong, nonatomic) IBOutlet UILabel *postNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;


@end
