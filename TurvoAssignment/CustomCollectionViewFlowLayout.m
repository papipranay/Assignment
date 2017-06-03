//
//  CustomCollectionViewFlowLayout.m
//  TurvoAssignment
//
//  Created by Pranay on 6/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "CustomCollectionViewFlowLayout.h"

@implementation CustomCollectionViewFlowLayout
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.minimumLineSpacing = 5.0;
        self.minimumInteritemSpacing = 5.0;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}
@end
