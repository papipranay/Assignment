//
//  CustomCollectionView.h
//  TurvoAssignment
//
//  Created by Pranay on 5/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomGridCollectionViewCell.h"
#import "CustomCollectionViewFlowLayout.h"
#import "CustomListCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "CollectionViewCell.h"

@protocol CustomCollectionViewProtocolDelegate

@optional
- (void)selectedViewIndexInCollectionView:(NSIndexPath*)selectedRowIndex;

@end

@interface CustomCollectionView : UICollectionView <UICollectionViewDelegate,UICollectionViewDataSource>{
    NSArray *recipePhotos;
    int typeOfcollectionView;
    CustomCollectionViewFlowLayout *layout;
}
@property(nonatomic,weak) id customCollectionViewDelegate;


-(void)refreshCollectionViewWithNewData:(NSArray*)data andCollectionViewMode:(int)type delegate:(id)delegate;
-(void)changeCollectionViewMode:(int)type;
@end
