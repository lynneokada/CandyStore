//
//  CandyLocationViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/17/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "CandyLocationViewController.h"

@interface CandyLocationViewController () {
    CLLocationManager *locationManager;
}
@end

@implementation CandyLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLLocationCoordinate2D zoomLocation;
//    zoomLocation.latitude = ;
//    zoomLocation.longitude = ;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.11*METERS_PER_MILE, 0.11*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    // 4
    [_mapView setRegion:adjustedRegion animated:YES];
    // Do any additional setup after loading the view.
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
