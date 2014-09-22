//
//  AddCandyViewController.h
//  CandyTutorial
//
//  Created by Lynne Okada on 9/16/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AddCandyViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate> {
    //camera/photolibrary
    UIImagePickerController *photo1;
    UIImage *image;
    IBOutlet UIImageView *imageView;
    
    //location manager
    CLLocationManager *locationManager;
}

- (IBAction)TakePhoto;
- (IBAction)ChooseExisting;

@property (nonatomic, retain) UIImagePickerController *imgPicker;
@property (nonatomic, strong) NSMutableArray *candyList;

@end
