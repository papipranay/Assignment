//
//  CollectionViewCell.m
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.highlightLbl.text = @"";
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
