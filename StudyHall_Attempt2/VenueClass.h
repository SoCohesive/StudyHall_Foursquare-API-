//
//  VenueClass.h
//  StudyHall_Attempt2
//
//  Created by Sonam Dhingra on 5/24/13.
//  Copyright (c) 2013 Sonam Dhingra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h> 

@interface VenueClass : NSObject <MKAnnotation>  

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property(nonatomic,copy)   NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic,copy) NSArray *tipList; 

@end
