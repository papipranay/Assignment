//
//  DetailViewController.m
//  TurvoAssignment
//
//  Created by Pranay on 5/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.detailCollectionView refreshCollectionViewWithNewData:self.obj.highlightsAry andCollectionViewMode:3 delegate:self];
    [self.mapView setPointsOnMapViewForData:[NSArray arrayWithObjects:self.obj, nil]];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showInMap:(id)sender{
    
    NSArray *viewControllers = [self.tabBarController viewControllers];
    [viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UINavigationController *myNavController = (UINavigationController *)obj;
        
        if([[[myNavController childViewControllers] firstObject] isKindOfClass:[SecondViewController class]]){
            SecondViewController *secVC = [[myNavController childViewControllers] firstObject];
            [secVC refreshMapWithArray:[NSArray arrayWithObjects:self.obj, nil]];
            
            [self.tabBarController setSelectedIndex:1];
            
            [self.navigationController popToRootViewControllerAnimated:NO];
            *stop = YES;
        }
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
