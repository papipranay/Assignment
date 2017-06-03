//
//  FirstViewController.m
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController (){
    BOOL isGridMode;
    NSArray *recipePhotos;
    int selectedRow;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadInitialData:)
                                                 name:@"FeaturedLocationNotification"
                                               object:nil];
    isGridMode = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadInitialData:(NSArray*)data{
    
    recipePhotos = [FeaturedResponse sharedInstance].getFeaturedList;
    
    [self.collectionView refreshCollectionViewWithNewData:recipePhotos andCollectionViewMode:(isGridMode)?1:2 delegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)changePresentation:(id)sender{

    isGridMode = !isGridMode;
    [self.collectionView changeCollectionViewMode:(isGridMode)?1:2];

}

- (void)selectedViewIndexInCollectionView:(NSIndexPath*)selectedRowIndex{
    NSLog(@"%ld",(long)selectedRowIndex.row);
    selectedRow = (int)selectedRowIndex.row;
    
    [self performSegueWithIdentifier:@"DetailedView" sender:self];
    
    //DetailedView
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"DetailedView"]) {
        DetailViewController *controller = (DetailViewController *)segue.destinationViewController;
        controller.obj = recipePhotos[selectedRow];
    }
}


@end
