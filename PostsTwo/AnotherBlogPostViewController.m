//
//  AnotherBlogPostViewController.m
//  PostsTwo
//
//  Created by Jeff Gayle on 5/15/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "AnotherBlogPostViewController.h"

@interface AnotherBlogPostViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Posts *anotherPost;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *contentTextField;

@end

@implementation AnotherBlogPostViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)cancel:(id)sender
{
    [self.delegate anotherBlogPostViewControllerDidCancel:self];
}

-(IBAction)done:(id)sender
{
    [self.delegate anotherBlogPostViewControllerDidSave:self];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddPost" forIndexPath:indexPath];
    return cell;
}

@end
