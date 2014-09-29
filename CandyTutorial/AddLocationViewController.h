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
#define METERS_PER_MILE 1609.344

@protocol AddLocationViewControllerDelegate <NSObject>
-(void) locationFoundWithLatitude:(float)latitude andLongitude:(float)longitude;

@end

@interface AddLocationViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) id <AddLocationViewControllerDelegate> delegate;


@end
