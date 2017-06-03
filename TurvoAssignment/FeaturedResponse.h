//
//  FeaturedResponse.h
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeaturedResponse : NSObject{
    
    NSMutableArray *featuredList;
}
+ (FeaturedResponse *)sharedInstance;
-(void)setFeaturedResponse:(NSArray*)responseDict;
-(NSArray*)getFeaturedList;
@end
