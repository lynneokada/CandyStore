//
//  AddLocationViewController.h
//  CandyTutorial
//
//  Created by Lynne Okada on 9/17/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface AddLocationViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    NSMutableArray *trackPointsArray;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
