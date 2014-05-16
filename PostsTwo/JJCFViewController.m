//
//  JJCFViewController.m
//  PostsTwo
//
//  Created by Jeff Gayle on 5/13/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "JJCFViewController.h"
#import "Posts.h"
#import "PostsTableViewCell.h"
#import "AnotherBlogPostViewController.h"

@interface JJCFViewController () <UITableViewDataSource, UITableViewDelegate, AnotherBlogPostViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *posts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JJCFViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *posts = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 10; i++) {
        Posts *post = [[Posts alloc]initWithUserName:@"Jeff" title:@"Title" content:@"Content" timeStamp:[NSDate date]];
        [posts addObject:post];
    }
    self.posts = posts;
    
//    Posts *postOne = [[Posts alloc]init];
//    postOne.userName = @"Jeff";
//    postOne.title = @"NFL Draft - Second Round";
//    postOne.content = @"The Seahawks selected Paul Richardson in the 2nd round";
//    postOne.timeStamp = [NSDate date];
//    
//    Posts *postTwo = [[Posts alloc]init];
//    postTwo.userName = @"Jeff";
//    postTwo.title = @"NFL Draft - Late Second Round";
//    postTwo.content = @"The Seahawks selected Justin Britt at the end of the 2nd round";
//    postTwo.timeStamp = [NSDate date];
//    
//    Posts *postThree = [[Posts alloc]init];
//    postThree.userName = @"Jeff";
//    postThree.title = @"NFL Draft - Fourth Round";
//    postThree.content = @"The Seahawks selected Cassius Marsh in the 4th round";
//    postThree.timeStamp = [NSDate date];
//    
//    Posts *postFour = [[Posts alloc]init];
//    postFour.userName = @"Jeff";
//    postFour.title = @"NFL Draft - Late Fourth Round";
//    postFour.content = @"The Seahawks selected Kevin Norwood near the end of the 4th round";
//    postFour.timeStamp = [NSDate date];
//    
//    Posts *postFive = [[Posts alloc]init];
//    postFive.userName = @"Jeff";
//    postFive.title = @"NFL Draft - Late Fourth Round";
//    postFive.content = @"The Seahawks selected Kevin Pierre-Lois at the end of the 4th round";
//    postFive.timeStamp = [NSDate date];
//    
//    Posts *postSix = [[Posts alloc]init];
//    postSix.userName = @"Jeff";
//    postSix.title = @"NFL Draft - Fifth Round";
//    postSix.content = @"The Seahawks selected Jimmy Staten in the 5th round";
//    postSix.timeStamp = [NSDate date];
//    
//    Posts *postSeven = [[Posts alloc]init];
//    postSeven.userName = @"Jeff";
//    postSeven.title = @"NFL Draft - Sixth Round";
//    postSeven.content = @"The Seahawks selected Garrett Scott in the 6th round";
//    postSeven.timeStamp = [NSDate date];
//    
//    Posts *postEight = [[Posts alloc]init];
//    postEight.userName = @"Jeff";
//    postEight.title = @"NFL Draft - Late Sixth Round";
//    postEight.content = @"The Seahawks selected Eric Pinkins at the end of the 6th round";
//    postEight.timeStamp = [NSDate date];
//    
//    Posts *postNine = [[Posts alloc]init];
//    postNine.userName = @"Jeff";
//    postNine.title = @"NFL Draft - Seventh Round";
//    postNine.content = @"The Seahawks selected Kiero Small in the 7th round";
//    postNine.timeStamp = [NSDate date];
//    
//    Posts *postTen = [[Posts alloc]init];
//    postTen.userName = @"Jeff";
//    postTen.title = @"NFL Draft - Thoughts and predictions";
//    postTen.content = @"The Seahawks selected a few players earlier than most thought they would be drafted. While this is not unusual, we will have to see how these players develop within the Seahawks system (One of the best in the league) in order to determine the real value of these picks. That won't happen for many years.";
//    postTen.timeStamp = [NSDate date];
//    
//    self.posts = [[NSMutableArray alloc]init];
//    
//    [self.posts addObject:postOne];
//    [self.posts addObject:postTwo];
//    [self.posts addObject:postThree];
//    [self.posts addObject:postFour];
//    [self.posts addObject:postFive];
//    [self.posts addObject:postSix];
//    [self.posts addObject:postSeven];
//    [self.posts addObject:postEight];
//    [self.posts addObject:postNine];
//    [self.posts addObject:postTen];
//    
//    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostsCell" forIndexPath:indexPath];
    
    Posts *post = [self.posts objectAtIndex:indexPath.row];
    
    [cell setPost:post];
    
    return cell;
}

#pragma mark - Another Blog Post

-(void)anotherBlogPostViewControllerDidCancel:(AnotherBlogPostViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)anotherBlogPostViewControllerDidSave:(AnotherBlogPostViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPost"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AnotherBlogPostViewController *createBlogPostViewController = [navigationController viewControllers][0];
        createBlogPostViewController.delegate.self;
    }
}











@end
