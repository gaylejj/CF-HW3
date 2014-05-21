//
//  AdditionalPostsViewController.m
//  NewBlogPosts
//
//  Created by Jeff Gayle on 5/19/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "AdditionalPostsViewController.h"

@interface AdditionalPostsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@end

@implementation AdditionalPostsViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameTextField.text = self.additionalPost.userName;
    self.titleTextField.text = self.additionalPost.title;
    self.contentTextField.text = self.additionalPost.content;
}

- (IBAction)updatePost:(id)sender
{
    if (self.nameTextField.text.length > 0 && self.titleTextField.text.length > 0 && self.contentTextField.text.length > 0) {
        self.additionalPost.userName = self.nameTextField.text;
        self.additionalPost.title = self.titleTextField.text;
        self.additionalPost.content = self.contentTextField.text;
    }
    
    [self.delegate postWasUpdated];
}

- (IBAction)cancel:(id)sender
{
    [self.delegate postWasUpdated];
}
@end