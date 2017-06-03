//
//  CustomListCollectionViewCell.h
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomListCollectionViewCell : UICollectionViewCell
@property (nonatomic, retain) IBOutlet UILabel *nameLbl;
@property (nonatomic, retain) IBOutlet UILabel *coordinateLbl;
@property (nonatomic, retain) IBOutlet UIImageView *imgView;
@end
