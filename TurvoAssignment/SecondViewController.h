//
//  SecondViewController.h
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property(nonatomic,strong) IBOutlet CustomMapView* mapView;
-(void)refreshMapWithArray:(NSArray*)array;


@end

