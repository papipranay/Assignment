//
//  FeaturedLocationObject.h
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeaturedLocationObject : NSObject{
    
}
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSArray* highlightsAry;
@property(nonatomic,strong)NSDictionary* location;
@property(nonatomic,strong)NSString* imageUrl;

@end
