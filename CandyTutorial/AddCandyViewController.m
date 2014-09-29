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
{
    UIImage *image;
}
@synthesize imgPicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imgPicker = [[UIImagePickerController alloc] init];
    self.imgPicker.allowsImageEditing = YES;
    self.imgPicker.delegate = self;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    self.addLatitude = @0;
    self.addLongitude = @0;
    
    _candyNameTextField.delegate = self;
    
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;

    candyBeingAdded = [NSEntityDescription insertNewObjectForEntityForName:@"Candy" inManagedObjectContext:context];
    NSLog(@"%@, %@",self.addLatitude,self.addLongitude);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToAddCandyViewController:(UIStoryboardSegue *)unwindSegue {

}

- (IBAction)addButtonPressed:(UIButton *)sender {
    [_candyList addObject:candyBeingAdded];
    candyBeingAdded.name = self.candyNameTextField.text;
    candyBeingAdded.latitude = self.addLatitude;
    candyBeingAdded.longitude = self.addLongitude;
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    //coredata
    // get access to the managed object context
    
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    
    NSError *error = nil;
    [context save:&error];
    if (error) {
        
    }
    
    candyBeingAdded.image = UIImagePNGRepresentation(self.imageView.image);
    [(AppDelegate *)[UIApplication sharedApplication].delegate saveContext];
    NSLog(@"lati:%@, longi:%@",self.addLatitude,self.addLongitude);
}

- (void)locationFoundWithLatitude:(float)latitude andLongitude:(float)longitude {
    self.addLatitude = @(latitude);
    self.addLongitude = @(longitude);
}

- (IBAction)TakePhoto {

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"findLocation"]) {
        AddLocationViewController *addLocationViewController = [segue destinationViewController];
        addLocationViewController.delegate = self;
    }
 }


@end
