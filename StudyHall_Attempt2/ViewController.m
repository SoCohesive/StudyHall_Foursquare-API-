//
//  ViewController.m
//  StudyHall_Attempt2
//
//  Created by Sonam Dhingra on 5/24/13.
//  Copyright (c) 2013 Sonam Dhingra. All rights reserved.
//

#import "ViewController.h"
#import "VenueClass.h"
#import "StudyHallTipsDetailViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *responseDictionary;
    NSMutableArray *tipArray;
    CLLocationManager *locationManager;
    VenueClass *selectedStudyHall;
    
}

-(void)makeURLVenueLocationRequest;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    [locationManager startUpdatingLocation];

    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(41.90,-87.65);
    

    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    
    self.mapView.region = region;
     [self makeURLVenueLocationRequest];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)makeURLVenueLocationRequest {
    
    
    
    NSString *coffeeVenueURLString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/tips/search?ll=41.90,-87.65&query=study&&radius=5000&client_id=MFDIXCKNSUTA01UKTJUUCPDLOU2QX3GA4NAFF4YFHGF1KDXH&client_secret=S5MZYU1VDCK5FT21TYMKUBUYAS4PED30350KQKVBXYJW5IPJ&v=20130523"];
                                      
                                      
           // "https://api.foursquare.com/v2/venues/search?ll=41.90,-87.65&categoryId=4d4b7105d754a06374d81259&radius=5000&client_id=MFDIXCKNSUTA01UKTJUUCPDLOU2QX3GA4NAFF4YFHGF1KDXH&client_secret=S5MZYU1VDCK5FT21TYMKUBUYAS4PED30350KQKVBXYJW5IPJ&v=20130523"];
    
    NSURL *url = [NSURL URLWithString:coffeeVenueURLString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *urlResponse, NSData *data, NSError *error) {
           NSDictionary *resultsfromTips = [NSJSONSerialization JSONObjectWithData:data
                                                                           options:0 error:nil];
                               
                responseDictionary = [resultsfromTips objectForKey:@"response"];
                tipArray = [responseDictionary objectForKey:@"tips"];
                               
                               
                               
                            
                               
                               
                               
        
                               
                               
    //NSDictionary *resultsFromCoffeeFourSquare= [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//                               
//        responseDictionary = [resultsFromCoffeeFourSquare  objectForKey:@"response"];
//        NSMutableArray *venueArray = [responseDictionary objectForKey:@"venues"];
//                               
//                             //  NSLog(@"the venue array has %@",venueArray);
//                               
//    
//                               
                            for (NSMutableDictionary *dictionary in tipArray )  {

                        NSString *latitude = [[[dictionary objectForKey:@"venue"] objectForKey:@"location"] objectForKey:@"lat"];
                        NSString *longitude = [[[dictionary objectForKey:@"venue"] objectForKey:@"location"]objectForKey:@"lng"];
                        NSString *studyHallName = [[dictionary objectForKey:@"venue"] objectForKey:@"name"];
                        NSArray *tips =[dictionary objectForKey:@"text"];
                                
                                
                      
//
//                                
//                    
                VenueClass *studyHalls = [[VenueClass alloc] init];
                
                studyHalls.coordinate = CLLocationCoordinate2DMake([latitude floatValue], [longitude floatValue]);
                                studyHalls.title = studyHallName;
                                studyHalls.tipList=tips;
                    
                              //  NSLog(@"studyhall tip ist is %@",studyHalls.tipList);
                                
                
                                [self.mapView addAnnotation:studyHalls];
                                
                                  // NSLog(@"coffeeshop coordinates are %@",coffeeShops);
                                   
                               }
           
     
                               
                           }];
    
}

-(MKAnnotationView*) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    NSString *reuseIdentifier= @"reuseIdentifier";
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
    
    if(annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
        reuseIdentifier:reuseIdentifier];
        
        annotationView.canShowCallout= YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        ((MKPinAnnotationView *)(annotationView)).pinColor= MKPinAnnotationColorPurple;
        ((MKPinAnnotationView *)(annotationView)).animatesDrop = YES;
        
    } else {
        annotationView.annotation = annotation;
    }
    
    return annotationView;
    
    
    
    
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    
   selectedStudyHall= [mapView.selectedAnnotations objectAtIndex:0];
    
    
  //  selectedBusStop = ((BusStops *) (view.annotation));
    
    [self performSegueWithIdentifier:@"pushToDetails" sender:self];
    
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ((StudyHallTipsDetailViewController *)segue.destinationViewController).studyHallSelectedForDetails=selectedStudyHall;
    
}






@end
