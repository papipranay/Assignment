//
//  FeaturedResponse.m
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "FeaturedResponse.h"

@implementation FeaturedResponse
+ (FeaturedResponse *)sharedInstance
{
    static FeaturedResponse *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FeaturedResponse alloc] init];
        [sharedInstance setup];
    });
    return sharedInstance;
}

-(void)setup{
    if(!featuredList){
        featuredList = [[NSMutableArray alloc] init];
    }
}
-(void)setFeaturedResponse:(NSArray*)responseArray{
    
    [responseArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        FeaturedLocationObject *fLObj = [[FeaturedLocationObject alloc] init];
        fLObj.name = obj[@"name"];
        fLObj.highlightsAry = obj[@"highlights"];
        fLObj.location = obj[@"coordinates"];
        fLObj.imageUrl = obj[@"Image"];
        
        [featuredList addObject:fLObj];
        
    }];
    
    [[NSNotificationCenter defaultCenter]     postNotificationName:@"FeaturedLocationNotification"
     object:featuredList];
    
}

-(NSArray*)getFeaturedList{
    
    return featuredList;
}

@end
