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

@interface AddCandyViewController () {
    Candy *_candyBeingAdded;
}
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
    _candyBeingAdded = [Candy new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    [_candyList addObject:_candyBeingAdded];
    _candyBeingAdded.candyName = self.candyNameTextField.text;
    [self.navigationController popToRootViewControllerAnimated:YES];
    //NSLog(@"%lu", (unsigned long)candyListTableViewController.candyList.count);
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
