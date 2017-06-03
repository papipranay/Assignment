//
//  RequestService.h
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface RequestService : NSObject{
    
}
+ (RequestService *)sharedInstance;
-(void)requestForFeaturedLocationDataWithURLString:(NSString*)urlString;
@end
