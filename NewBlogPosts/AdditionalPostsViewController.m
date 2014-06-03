//
//  AdditionalPostsViewController.m
//  NewBlogPosts
//
//  Created by Jeff Gayle on 5/19/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

#import "AdditionalPostsViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MessageUI/MessageUI.h>

@interface AdditionalPostsViewController () <UIImagePickerControllerDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

// Outlet to Done/Cancel Buttons
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

// UIImagePicker Property
@property (strong, nonatomic) UIImagePickerController *imagePicker;



@end

@implementation AdditionalPostsViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Set additionalPost attributes based on text fields
    
    self.nameTextField.text = self.additionalPost.userName;
    self.titleTextField.text = self.additionalPost.title;
    self.contentTextField.text = self.additionalPost.content;
//    _createImageView.layer.cornerRadius = _createImageView.frame.size.width / 2;
//    [_createImageView setClipsToBounds:YES];
    self.createImageView.image = self.additionalPost.photo;
}

- (IBAction)updatePost:(id)sender
{
    // If there is something in the text fields, when Done button is pushed, set additionalPost attributes
    if (self.nameTextField.text.length > 0 && self.titleTextField.text.length > 0 && self.contentTextField.text.length > 0) {
        self.additionalPost.userName = self.nameTextField.text;
        self.additionalPost.title = self.titleTextField.text;
        self.additionalPost.content = self.contentTextField.text;
        self.additionalPost.photo = self.createImageView.image;
        
        [self saveImageToLibrary:self.additionalPost.photo];
    }
    
    // Notify delegate that post was updated
    [self.delegate postWasUpdated];
}

// When cancel button hit, notify delegate
- (IBAction)cancel:(id)sender
{
    [self.delegate postWasUpdated];
}

#pragma mark - UIImagePicker

// Set a picker controller
-(void)showPickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *picker = [UIImagePickerController new];
    
    // Set picker delegate is important!!
    picker.delegate = self;
    picker.sourceType = sourceType;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

// Button for setting a picture
-(IBAction)takePicture:(id)sender
{
    // If camera is available, offer options
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Choose Source Type"
                                                                delegate:self
                                                       cancelButtonTitle:@"Cancel"
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:@"Camera", @"Photo Library", nil];
        [actionSheet showFromBarButtonItem:sender animated:YES];
    } else {
        // Otherwise access library
        [self showPickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

// Actionsheet for above button. Tie button titles to sourcetypes
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];

    if ([buttonTitle isEqualToString:@"Camera"]) {
        [self showPickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    } else if ([buttonTitle isEqualToString:@"Photo Library"]) {
        [self showPickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}

// Save image to Library
- (void)saveImageToLibrary:(UIImage *)editedImage
{
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary writeImageToSavedPhotosAlbum:editedImage.CGImage
                                    orientation:ALAssetOrientationUp
                                completionBlock:^(NSURL *assetURL, NSError *error) {
                                    NSLog(@"Asset URL: %@", assetURL);
                                }];
}

// Once finished picking an image, set the image equal to self.createImageView.image
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    _createImageView.image = editedImage;
    self.additionalPost.photo = editedImage;
    
    [self dismissViewControllerAnimated:YES completion:^{
        [self saveImageToLibrary:editedImage];
            }];
    NSLog(@"Image saved");
}

#pragma mark - MFMailComposeViewController

- (IBAction)sendMail:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        [self sendMailComposed];
    }
    
}

- (void)sendMailComposed {
    MFMailComposeViewController *mailCompose = [[MFMailComposeViewController alloc]init];
    mailCompose.mailComposeDelegate = self;
    NSData *picture = UIImageJPEGRepresentation(self.additionalPost.photo, 1.0);
    
    [mailCompose addAttachmentData:picture mimeType:@"image/jpeg" fileName:@"puppy picture"];
    [mailCompose setSubject:@"title"];
    [mailCompose setToRecipients:@[@"jeff.j.gayle@gmail.com"]];
    [mailCompose setMessageBody:@"See this cute puppy!" isHTML:NO];
    [self presentViewController:mailCompose animated:YES completion:NULL];
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}




@end