//
//  PostsTableViewCell.m
//  PostsTwo
//
//  Created by Jeff Gayle on 5/13/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "PostsTableViewCell.h"
#import "Posts.h"

@implementation PostsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setPost:(Posts *)post
{
    _post = post;
    self.userNameLabel.text = post.userName;
    self.titleLabel.text = post.title;
    self.contentLabel.text = post.content;
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
