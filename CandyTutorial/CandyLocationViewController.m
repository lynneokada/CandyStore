//
//  CandyLocationViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/17/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "CandyLocationViewController.h"
#import "Candy.h"


@implementation CandyLocationViewController
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D zoomLocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
//    zoomLocation = CLLocationCoordinate2DMake(self.candy.latitude.doubleValue, self.candy.longitude.doubleValue);
    zoomLocation.latitude = [self.candy.latitude doubleValue];
    zoomLocation.longitude = [self.candy.longitude doubleValue];

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.11*METERS_PER_MILE, 0.11*METERS_PER_MILE);
    
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    
    [_mapView setRegion:adjustedRegion animated:YES];
    // Do any additional setup after loading the view.
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    CLLocationCoordinate2D candyLocation = CLLocationCoordinate2DMake(zoomLocation.latitude, zoomLocation.longitude);
    NSLog(@"%f,%f", zoomLocation.latitude,zoomLocation.longitude);
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(candyLocation, 2000, 2000);
    [self.mapView setRegion:zoomRegion animated:YES];
    [mapView setCenterCoordinate:candyLocation];
}
//
//- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
//    //get coordinates
//    //CLLocationCoordinate2D currentLocation = [userLocation coordinate];
//    CLLocationCoordinate2D candyLocation = CLLocationCoordinate2DMake(zoomLocation.latitude, zoomLocation.longitude);
//
//    //define zoom region
//    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(candyLocation, 2000, 2000);
//    
//    //show the location
//    [self.mapView setRegion:zoomRegion animated:YES];
//    [mapView setCenterCoordinate:candyLocation];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewDidAppear:(BOOL)animated {
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
