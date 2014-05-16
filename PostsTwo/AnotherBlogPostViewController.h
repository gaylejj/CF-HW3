//
//  AnotherBlogPostViewController.h
//  PostsTwo
//
//  Created by Jeff Gayle on 5/15/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Posts.h"

@class AnotherBlogPostViewController;

@protocol AnotherBlogPostViewControllerDelegate <NSObject>

-(void)anotherBlogPostViewControllerDidCancel:(AnotherBlogPostViewController *)controller;
-(void)anotherBlogPostViewControllerDidSave:(AnotherBlogPostViewController *)controller;

@end

@interface AnotherBlogPostViewController : UIViewController

@property (nonatomic, unsafe_unretained) id<AnotherBlogPostViewControllerDelegate> delegate;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;


@end
