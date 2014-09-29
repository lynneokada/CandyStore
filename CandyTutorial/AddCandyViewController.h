//
//  AddCandyViewController.h
//  CandyTutorial
//
//  Created by Lynne Okada on 9/16/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddLocationViewController.h"

@interface AddCandyViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDelegate, UITextFieldDelegate, AddLocationViewControllerDelegate>

- (IBAction)TakePhoto;
- (IBAction)ChooseExisting;

@property (nonatomic, retain) UIImagePickerController *imgPicker;
@property (nonatomic, strong) NSMutableArray *candyList;
@property (nonatomic, strong) NSNumber *addLatitude;
@property (nonatomic, strong) NSNumber *addLongitude;

@end
