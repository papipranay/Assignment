//
//  CustomCollectionView.m
//  TurvoAssignment
//
//  Created by Pranay on 5/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "CustomCollectionView.h"

enum{
    
    GRID=1,
    LIST,
    HIGHLIGHTLIST
    
};

@implementation CustomCollectionView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initailSetUp];
    
}
-(void)refreshCollectionViewWithNewData:(NSArray*)data andCollectionViewMode:(int)type delegate:(id)delegate {
    
    recipePhotos = data;
    self.customCollectionViewDelegate = delegate;
    typeOfcollectionView = type;
    //[self reloadItemsAtIndexPaths:[self indexPathsForVisibleItems]];
    [self reloadData];
    
}

-(void)changeCollectionViewMode:(int)type{
    typeOfcollectionView = type;
    [self reloadItemsAtIndexPaths:[self indexPathsForVisibleItems]];
    [self reloadData];
}
-(void)initailSetUp{
    self.delegate = self;
    self.dataSource = self;
    layout = [[CustomCollectionViewFlowLayout alloc] init];
    self.collectionViewLayout = layout;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1.0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return recipePhotos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(typeOfcollectionView == GRID){
        UINib *nib = [UINib nibWithNibName:@"CustomGridCollectionViewCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
        
        CustomGridCollectionViewCell *cell = (CustomGridCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        
        FeaturedLocationObject *fObj = [recipePhotos objectAtIndex:indexPath.row];
        cell.nameLbl.text = fObj.name;
        [self setImageforCell:cell withImgURLString:fObj.imageUrl];
        
        return cell;
    }
    else if (typeOfcollectionView == LIST){
        UINib *nib = [UINib nibWithNibName:@"CustomListCollectionViewCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:@"CellList"];
        
        CustomListCollectionViewCell *cell = (CustomListCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"CellList" forIndexPath:indexPath];

            
            FeaturedLocationObject *fObj = [recipePhotos objectAtIndex:indexPath.row];;
            cell.nameLbl.text = fObj.name;
            cell.coordinateLbl.text = [NSString stringWithFormat:@"Lat :%@/Lon : %@",fObj.location[@"lat"],fObj.location[@"long"]];
            
            [self setImageforCell:cell withImgURLString:fObj.imageUrl];

        
        return cell;
    }
    else{
        
        UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
        [collectionView registerNib:nib forCellWithReuseIdentifier:@"highlightCell"];
        
        CollectionViewCell *cell = (CollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"highlightCell" forIndexPath:indexPath];
       
        cell.highlightLbl.text = [recipePhotos objectAtIndex:indexPath.row];
        
        return cell;
        
    }
    
}

-(void)setImageforCell:(id)cell withImgURLString:(NSString*)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"first"];
    
    
    
    if([cell isKindOfClass:[CustomGridCollectionViewCell class]]){
        
        CustomGridCollectionViewCell *tempCell = (CustomGridCollectionViewCell*)cell;
        __weak  CustomGridCollectionViewCell *weakCell = tempCell;
        
        [tempCell.imgView setImageWithURLRequest:request
                                placeholderImage:placeholderImage
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                             
                                             weakCell.imgView.image = image;
                                             [weakCell setNeedsLayout];
                                             
                                         } failure:nil];
        
    }
    else if([cell isKindOfClass:[CustomListCollectionViewCell class]]){
        
        CustomListCollectionViewCell *tempCell = (CustomListCollectionViewCell*)cell;
        __weak  CustomListCollectionViewCell *weakCell = tempCell;
        
        [tempCell.imgView setImageWithURLRequest:request
                                placeholderImage:placeholderImage
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                             
                                             weakCell.imgView.image = image;
                                             [weakCell setNeedsLayout];
                                             
                                         } failure:nil];
    }
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self sizingForRowAtIndexPath:indexPath];
}

- (CGSize)sizingForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     if (typeOfcollectionView == GRID){
        
        NSInteger numberOfColumns = 3;
        CGFloat itemWidth = CGRectGetWidth(self.frame)/ numberOfColumns;
        return CGSizeMake(itemWidth-10, itemWidth-10);
    }
    else  if (typeOfcollectionView == LIST){
        
        NSInteger numberOfColumns = 1;
        CGFloat itemWidth = CGRectGetWidth(self.frame)/ numberOfColumns;
        return CGSizeMake(itemWidth, 70);
    }
    else{
        NSInteger numberOfColumns = 2;
        CGFloat itemWidth = CGRectGetWidth(self.frame)/ numberOfColumns;
        return CGSizeMake(itemWidth-10, 30);
    }
}
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (typeOfcollectionView == GRID){
        [self.customCollectionViewDelegate selectedViewIndexInCollectionView:indexPath];
    }
    else  if (typeOfcollectionView == LIST){
       [self.customCollectionViewDelegate selectedViewIndexInCollectionView:indexPath];
    }
    
}

@end
