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
    double longitude;
    double latitude;
    AddCandyViewController* addCandyViewController;
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
    
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = latitude;
    zoomLocation.longitude = longitude;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.11*METERS_PER_MILE, 0.11*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    // 4
    [_mapView setRegion:adjustedRegion animated:YES];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AddCandyViewController *addCandyViewController = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"locationAdded"]) {
        latitude = locationManager.location.coordinate.latitude;
        longitude = locationManager.location.coordinate.longitude;
        //    addCandyViewController.addLatitude = [NSNumber numberWithDouble:latitude];
        //    addCandyViewController.addLongitude = [NSNumber numberWithDouble:longitude];
        
        if (self.delegate) {
            [self.delegate locationFoundWithLatitude:latitude andLongitude:longitude];
            NSLog(@"lat %f, long %f", latitude, longitude);
            
        }
    }
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
