//
//  AddLocationViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/17/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "AddLocationViewController.h"


@interface AddLocationViewController ()

@end

@implementation AddLocationViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    trackPointsArray = [[NSMutableArray alloc] init];
    locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    //get latest location
    CLLocation *currentLocation = [locations lastObject];
    
    //store location
    [trackPointsArray addObject:currentLocation];
    
    NSLog(@"%@", trackPointsArray);
}

- (IBAction)addLocationPressed:(UIButton *)sender {
    //[self.navigationController popViewControllerAnimated:YES];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    
    mapView.delegate = self;
    //show the user location
    mapView.showsUserLocation = YES;
}
- (IBAction)no:(id)sender {
    locationManager = [[CLLocationManager alloc] init];
    [locationManager stopUpdatingLocation];
    locationManager = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
