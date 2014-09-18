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

@interface AddCandyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *candyNameTextField;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addCandyConfirmed"]) {
        Candy *candy = [Candy new];
        CandyViewController *candyViewController = [CandyViewController new];
        CandyListTableViewController *candyListTableViewController = [segue destinationViewController];
        [candyListTableViewController.candyList addObject:candy];
        candyViewController.candy = candy;
    }
    //else if ([segue.identifier isEqualToString:@"addLocation]) {
    //        AddLocationViewController *addLocationViewController = [segue destinationViewController];
    //        addLocationViewController.candy = self.candyList[-1];
    //                } else if ([segue.identifier isEqualToString:@"])
    //    }
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.candyNameTextField.text = self.candy.candyName;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.candy.candyName = self.candyNameTextField.text;
}

- (IBAction)TakePhoto {
    photo1 = [[UIImagePickerController alloc] init];
    photo1.delegate = self;
    [photo1 setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:photo1 animated:YES completion:NULL];
    [photo1 reloadInputViews];
}

//- (IBAction)ChooseExisting {
//    photo2 = [[UIImagePickerController alloc] init];
//    photo2.delegate = self;
//    [photo2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//    [self presentViewController:photo1 animated:YES completion:NULL];
//    //[photo2 reloadInputViews];
//}

- (IBAction)ChooseExisting {
    [self presentModalViewController:self.imgPicker animated:YES];
}

//ASK BENJI
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    [imageView setImage:image];
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}


//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    self->imageView.image = chosenImage;
//    
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//    
//}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    [self->imageView setImage:img];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
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
