//
//  AddLocationViewController.h
//  CandyTutorial
//
//  Created by Lynne Okada on 9/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddCandyViewController.h"
#define METERS_PER_MILE 1609.344

@interface AddLocationViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
