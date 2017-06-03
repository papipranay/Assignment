//
//  CustomMKPointAnnotation.h
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CustomMKPointAnnotation : MKPointAnnotation<MKAnnotation>
@property(nonatomic,assign)NSString *urlString;

@end
