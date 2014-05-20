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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (self.nameTextField.text.length > 0 && self.titleTextField.text.length > 0 && self.contentTextField.text.length > 0) {
        self.additionalPost.userName = self.nameTextField.text;
        self.additionalPost.title = self.titleTextField.text;
        self.additionalPost.content = self.contentTextField.text;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameTextField.text = self.additionalPost.userName;
    self.titleTextField.text = self.additionalPost.title;
    self.contentTextField.text = self.additionalPost.content;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end