//
//  CustomCollectionViewCell.m
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "CustomGridCollectionViewCell.h"

@implementation CustomGridCollectionViewCell
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.nameLbl.text = @"";
    self.imgView.image = nil;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
