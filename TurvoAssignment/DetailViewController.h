//
//  DetailViewController.h
//  TurvoAssignment
//
//  Created by Pranay on 5/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeaturedLocationObject.h"
#import "CustomMapView.h"


@interface DetailViewController : UIViewController{
    
}
@property(nonatomic,strong) FeaturedLocationObject *obj;
@property(nonatomic,strong) IBOutlet CustomCollectionView* detailCollectionView;
@property(nonatomic,strong) IBOutlet CustomMapView* mapView;
-(IBAction)showInMap:(id)sender;
@end
