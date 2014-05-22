//
//  AdditionalPostsViewController.h
//  NewBlogPosts
//
//  Created by Jeff Gayle on 5/19/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@protocol AdditionalPostsViewControllerDelegate <NSObject>

// Required Delegate Method
- (void)postWasUpdated;

@end

@interface AdditionalPostsViewController : UIViewController

// Set new Post property for creating posts
@property (weak, nonatomic) Post *additionalPost;

// Call Delegate Property
@property (nonatomic, unsafe_unretained) id<AdditionalPostsViewControllerDelegate> delegate;

// ImageView for New Post
@property (strong, nonatomic) IBOutlet UIImageView *createImageView;

@end
