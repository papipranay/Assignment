//
//  CustomLocationManager.m
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "CustomLocationManager.h"

@implementation CustomLocationManager

- (id)init
{
    self = [super init];
    
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        
        [_locationManager requestWhenInUseAuthorization];
        [_locationManager requestAlwaysAuthorization];
        _locationManager.delegate = self;
    }
    
    return self;
}

+ (CustomLocationManager *)sharedInstance
{
    static CustomLocationManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CustomLocationManager alloc] init];
    });
    return sharedInstance;
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
}

@end
