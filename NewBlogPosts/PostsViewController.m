//
//  PostsViewController.m
//  NewBlogPosts
//
//  Created by Jeff Gayle on 5/16/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "PostsViewController.h"
#import "PostsTableViewCell.h"
#import "Post.h"
#import "AdditionalPostsViewController.h"
#import "UIColor+RandomColor.h"

@interface PostsViewController () <UITableViewDataSource, UITableViewDelegate, AdditionalPostsViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *arrayOfPosts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) Post *currentPost;
@end

@implementation PostsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Creating an array of 10 objects
    _arrayOfPosts = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 10; i++) {
        Post *post = [[Post alloc]initWithUserName:[NSString stringWithFormat:@"Jeff #%d", i] title:@"Title" content:@"Test Content" timeStamp:[NSDate date] image:[UIImage imageNamed:@"images.jpeg"]];
        [_arrayOfPosts addObject:post];
    }
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"You Have %d Posts", (int)self.arrayOfPosts.count);
    self.view.backgroundColor = [UIColor randomColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UITableViewDelegate - Setting dequeue of cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostsCell" forIndexPath:indexPath];
    Post *post = [self.arrayOfPosts objectAtIndex:indexPath.row];
    
    // Cell is calling post based on object at row of table
    [cell setPost:post];
    
    NSLog(@"%@", post.userName);
    return cell;
}

// UITableViewDelegate - Number of rows in the section - Set equal to the Array length
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayOfPosts count];
}

// UITableViewDelegate - Set behavior when a cell is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Row: %ld", (long)indexPath.row);
    
    // Deselect the row
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Instance of object equal to the array object
    _currentPost = [self.arrayOfPosts objectAtIndex:indexPath.row];
    
    // Send using segue pathway "EditPost"
    [self performSegueWithIdentifier:@"EditPost" sender:self];
}

// Preprare for Segue behavior
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set new View Controller as destination controller
    AdditionalPostsViewController *addPostVC = segue.destinationViewController;
    
    // Set new View Controller delegate as self
    addPostVC.delegate = self;
    
    // If statement - if sent using AddPost Segue, create a new post, automatically set template user/title information. Add to instance of array as last object
    if ([segue.identifier isEqualToString:@"AddPost"]) {
        Post *newPost = [Post new];
        newPost.userName = @"New User";
        newPost.title = @"New Title";
        [_arrayOfPosts addObject:newPost];
        addPostVC.additionalPost = [_arrayOfPosts lastObject];
    } else if ([segue.identifier isEqualToString:@"EditPost"]) {
        // Otherwise, make a new post in AddPostVC
        addPostVC.additionalPost = _currentPost;
    }


    NSLog(@"Selected %@", addPostVC.additionalPost.userName);
}

// Swipe left to delete functionality
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [_arrayOfPosts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

// AdditionalPostViewControllerDelegate - pop nav controller back, reload data in tableview
- (void)postWasUpdated
{
    [self.navigationController popViewControllerAnimated:YES];
    [self.tableView reloadData];
}
@end