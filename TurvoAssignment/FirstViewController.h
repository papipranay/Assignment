//
//  FirstViewController.h
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//


@interface FirstViewController : UIViewController<CustomCollectionViewProtocolDelegate>
@property(nonatomic,strong) IBOutlet CustomCollectionView* collectionView;
-(IBAction)changePresentation:(id)sender;

@end

