//
//  SecondViewController.m
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)refreshMapWithArray:(NSArray*)array{
    
    [self.mapView setPointsOnMapViewForData:array];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
