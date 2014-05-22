//
//  PostsTableViewCell.m
//  NewBlogPosts
//
//  Created by Jeff Gayle on 5/16/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "PostsTableViewCell.h"

@implementation PostsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setPost:(Post *)post
{
    _post = post;
    self.postNameLabel.text = post.userName;
    self.postContentLabel.text = post.content;
    self.postTitleLabel.text = post.title;
    self.pictureImageView.image = post.photo;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
