//
//  CandyLocationViewController.h
//  CandyTutorial
//
//  Created by Lynne Okada on 9/17/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#define METERS_PER_MILE 1609.344

@class Candy;

@interface CandyLocationViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) Candy *candy;
@property (nonatomic, assign) double inputLongitude;
@property (nonatomic, assign) double inputLatitude;

@end
