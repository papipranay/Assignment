//
//  CustomMapView.m
//  TurvoAssignment
//
//  Created by Pranay on 5/2/17.
//  Copyright © 2017 Pranay. All rights reserved.
//

#import "CustomMapView.h"

@implementation CustomMapView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initailSetUp];
    
}
-(void)initailSetUp{
    
     self.delegate = self;
    
    locationManager = [CustomLocationManager sharedInstance];
    
}

-(void)setPointsOnMapViewForData:(NSArray*)array{
    
    [self removeAnnotations:self.annotations];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        FeaturedLocationObject *fObj = (FeaturedLocationObject*)obj;
        // Add an annotation
        CustomMKPointAnnotation *point = [[CustomMKPointAnnotation alloc] init];
        point.coordinate = CLLocationCoordinate2DMake([fObj.location[@"lat"] doubleValue], [fObj.location[@"long"] doubleValue]);
        point.title = fObj.name;
        point.urlString = fObj.imageUrl;
        
        [self addAnnotation:point];
    }];
    
    [self showAnnotations:self.annotations animated:YES];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
   
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *annotationViewReuseIdentifier = @"annotationViewReuseIdentifier";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[self dequeueReusableAnnotationViewWithIdentifier:annotationViewReuseIdentifier];
    
    if (annotationView == nil) {
        
        // if you want to show pinPoint create object of MKPinAnnotationView class instead of MKAnnotationView class
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewReuseIdentifier];
    }
    
    annotationView.canShowCallout = YES;
    
    CustomMKPointAnnotation *tempAnnotation = (CustomMKPointAnnotation*)annotation;
    
    // Add a custom image to the left side of the callout.
    [self loadImageIntoImageViewFromURL:tempAnnotation.urlString onImageView:annotationView];
    
    
    return annotationView;
}

-(void)loadImageIntoImageViewFromURL:(NSString*)imageURL onImageView:(MKAnnotationView*)annotationView{
   
    __block MKAnnotationView *templeftCalloutAccessoryView = annotationView;
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    __weak UIImageView* tempImageView = imageView;
    
    NSURL *url = [NSURL URLWithString:imageURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [imageView setImageWithURLRequest:request
                         placeholderImage:[UIImage imageNamed:@"first"]
                                  success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                      tempImageView.image = image;
                                      templeftCalloutAccessoryView.leftCalloutAccessoryView = tempImageView;
                                      
                                  } failure:nil];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
