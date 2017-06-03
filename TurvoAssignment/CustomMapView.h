//
//  CustomMapView.h
//  TurvoAssignment
//
//  Created by Pranay on 5/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomLocationManager.h"
#import "CustomMKPointAnnotation.h"


@interface CustomMapView : MKMapView <MKMapViewDelegate,CLLocationManagerDelegate>{
    CustomLocationManager *locationManager;
}
-(void)setPointsOnMapViewForData:(NSArray*)array;
@end
