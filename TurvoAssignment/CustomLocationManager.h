//
//  CustomLocationManager.h
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface CustomLocationManager : NSObject<CLLocationManagerDelegate>{
    
}
+ (CustomLocationManager *)sharedInstance;
@property (readonly) CLLocationManager *locationManager;
@end
