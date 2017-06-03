//
//  MainTabBarController.m
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // Do any additional setup after loading the view.
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if ([viewController.childViewControllers.firstObject isKindOfClass:[SecondViewController class]]) {
        SecondViewController* secVc = (SecondViewController*)viewController.childViewControllers.firstObject;
        [secVc refreshMapWithArray:[[FeaturedResponse sharedInstance] getFeaturedList]];
    }
    
    NSLog(@"Called didSelectViewController");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
