//
//  RequestService.m
//  TurvoAssignment
//
//  Created by Pranay on 6/1/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "RequestService.h"

@implementation RequestService


+ (RequestService *)sharedInstance
{
    static RequestService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RequestService alloc] init];
    });
    return sharedInstance;
}

-(void)requestForFeaturedLocationDataWithURLString:(NSString*)urlString{
    
    [self requestForDataWithURLString:urlString completion:^(NSArray *data){
        
        [[FeaturedResponse sharedInstance] setFeaturedResponse:data];
        
    }];
}

-(void)requestForDataWithURLString:(NSString*)urlString completion:(void(^)(NSArray*))callback{
   
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
           
            NSError* error1;
            
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:kNilOptions
                                                                   error:&error1];
            NSArray *ary = json[@"data"];
            callback(ary);
        }
    }];
    
    [dataTask resume];
}

-(void)requestUsingAFNetwork{
    
}

@end
