//
//  AddLocationViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "AddLocationViewController.h"
#import "AddCandyViewController.h"

@interface AddLocationViewController () {
    CLLocationManager *locationManager;
}


@end

@implementation AddLocationViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    locationManager = [CLLocationManager new];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingHeading];
    
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        self.mapView.showsUserLocation = YES;
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    //get coordinates
    CLLocationCoordinate2D currentLocation = [userLocation coordinate];
    
    //define zoom region
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(currentLocation, 2000, 2000);
    
    //show the location
    [self.mapView setRegion:zoomRegion animated:YES];
    [mapView setCenterCoordinate:currentLocation];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addLocation:(UIButton *)sender {
    _latitude = locationManager.location.coordinate.latitude;
    _longitude = locationManager.location.coordinate.longitude;
    NSLog(@"lat %f, long %f", _latitude, _longitude);
    
    NSArray *array = [self.navigationController viewControllers];
    [self.navigationController popToViewController:[array objectAtIndex:1] animated:YES];
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
