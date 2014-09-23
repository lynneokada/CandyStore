//
//  AddCandyViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/16/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "AddCandyViewController.h"
#import "CandyViewController.h"
#import "CandyListTableViewController.h"
#import "AddLocationViewController.h"
#import "Candy.h"
#import "AppDelegate.h"

@interface AddCandyViewController () {
    Candy *candyBeingAdded;
}
@property (weak, nonatomic) IBOutlet UITextField *candyNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation AddCandyViewController
@synthesize imgPicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imgPicker = [[UIImagePickerController alloc] init];
    self.imgPicker.allowsImageEditing = YES;
    self.imgPicker.delegate = self;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    _candyNameTextField.delegate = self;
    
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;

    candyBeingAdded = [NSEntityDescription insertNewObjectForEntityForName:@"Candy" inManagedObjectContext:context];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    [_candyList addObject:candyBeingAdded];
    candyBeingAdded.name = self.candyNameTextField.text;
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    //coredata
    // get access to the managed object context
    candyBeingAdded.name = self.candyNameTextField.text;
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSError *error = nil;
    [context save:&error];
    if (error) {
        
    }
    
    candyBeingAdded.image = UIImagePNGRepresentation(self.imageView.image);
    [(AppDelegate *)[UIApplication sharedApplication].delegate saveContext];
}

- (IBAction)findLocation:(UIButton *)sender {

}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"addCandyConfirmed"]) {
//        Candy *candy = [Candy new];
//        CandyListTableViewController *candyListTableViewController = [CandyListTableViewController new];
//        CandyViewController *_candyViewController = [segue destinationViewController];
//        [candyListTableViewController.candyList addObject:candy];
//        _candyViewController.candy = candy;
//        self.candy.candyName = self.candyNameTextField.text;
//    }
//}

- (IBAction)TakePhoto {
//    photo1 = [[UIImagePickerController alloc] init];
//    photo1.delegate = self;
//    [photo1 setSourceType:UIImagePickerControllerSourceTypeCamera];
//    [self presentViewController:photo1 animated:YES completion:NULL];
//    [photo1 reloadInputViews];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

//- (IBAction)ChooseExisting {
//    photo2 = [[UIImagePickerController alloc] init];
//    photo2.delegate = self;
//    [photo2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//    [self presentViewController:photo1 animated:YES completion:NULL];
//    //[photo2 reloadInputViews];
//}

- (IBAction)ChooseExisting {
    //[self presentModalViewController:self.imgPicker animated:YES];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
