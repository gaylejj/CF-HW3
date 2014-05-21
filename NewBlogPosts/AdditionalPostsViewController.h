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

- (void)postWasUpdated;

@end

@interface AdditionalPostsViewController : UIViewController

@property (weak, nonatomic) Post *additionalPost;
@property (nonatomic, unsafe_unretained) id<AdditionalPostsViewControllerDelegate> delegate;
@end
