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

@interface PostsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *arrayOfPosts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) Post *currentPost;
@end

@implementation PostsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    _arrayOfPosts = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 4; i++) {
        Post *post = [[Post alloc]initWithUserName:[NSString stringWithFormat:@"Jeff #%d", i] title:@"Title" content:@"Test Content" timeStamp:[NSDate date]];
        [_arrayOfPosts addObject:post];
    }
    
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostsCell" forIndexPath:indexPath];
    Post *post = [self.arrayOfPosts objectAtIndex:indexPath.row];
    [cell setPost:post];
    
    NSLog(@"%@", post.userName);
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayOfPosts count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Row: %ld", (long)indexPath.row);
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    _currentPost = [self.arrayOfPosts objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EditPost" sender:self];
}

-(IBAction)unwindToPosts:(UIStoryboardSegue *)segue
{
    NSLog(@"Unwind");
    [_tableView reloadData];
    NSLog(@"Unwind");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AdditionalPostsViewController *addPostVC = segue.destinationViewController;

    if ([segue.identifier isEqualToString:@"AddPost"]) {
        Post *newPost = [Post new];
        newPost.userName = @"New User";
        newPost.title = @"New Title";
        [_arrayOfPosts addObject:newPost];
        addPostVC.additionalPost = [_arrayOfPosts lastObject];
    } else if ([segue.identifier isEqualToString:@"EditPost"]) {
        addPostVC.additionalPost = _currentPost;
    }


    NSLog(@"Selected %@", addPostVC.additionalPost.userName);
}



@end