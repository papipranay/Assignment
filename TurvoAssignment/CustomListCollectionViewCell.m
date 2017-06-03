//
//  CustomListCollectionViewCell.m
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "CustomListCollectionViewCell.h"

@implementation CustomListCollectionViewCell
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.nameLbl.text = @"";
    self.coordinateLbl.text = @"";
    self.imgView.image = nil;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
