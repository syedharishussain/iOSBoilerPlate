//
//  CoreLocationController.h
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Constant.h"

@protocol CoreLocationControllerDelegate
@required

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;

@end


@interface CoreLocationController : NSObject <CLLocationManagerDelegate> 

+ (CoreLocationController  *) sharedCoreLocationController;
- (void)initialize;
- (void)startUpdating;
- (void)stopUpdating;

@property (nonatomic, retain) CLLocationManager *locMgr;
@property (nonatomic, strong) id delegate;
@property BOOL isLocationOn;
@property BOOL isRecordingOn;
@property BOOL isLocationServiceOn;

@end
