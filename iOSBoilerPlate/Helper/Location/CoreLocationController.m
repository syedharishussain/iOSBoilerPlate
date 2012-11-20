//
//  CoreLocationController.m
//  CoreLocationDemo
//
//  Created by Nicholas Vellios on 8/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CoreLocationController.h"


@implementation CoreLocationController

@synthesize locMgr;
@synthesize delegate;
@synthesize isLocationOn;
@synthesize isRecordingOn;
@synthesize isLocationServiceOn;

+ (id)sharedCoreLocationController
{
    static dispatch_once_t onceQueue;
    static CoreLocationController *coreLocationController = nil;
    
    dispatch_once(&onceQueue, ^{ coreLocationController = [[self alloc] init]; });
    return coreLocationController;
}

- (void)initialize{
    if (self.locMgr == nil) {
        self.locMgr = [[CLLocationManager alloc] init];
		self.locMgr.delegate = self;
    }
}

- (void)startUpdating{
    [self initialize];
    [self.locMgr startUpdatingLocation];
}

- (void)stopUpdating{
    [self.locMgr stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self.delegate locationUpdate:newLocation];
	}
    
    // Here we are setting a dictionary containing location's lat & long
    NSDictionary * dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newLocation, KEY_LOCATION, [NSNumber numberWithDouble:newLocation.coordinate.latitude], KEY_LATITUDE, [NSNumber numberWithDouble:newLocation.coordinate.longitude], KEY_LONGITUDE,  nil];
    
    // Posting notification for location update.
    [[NSNotificationCenter defaultCenter] postNotificationName:KEY_NOTIFICATION_LOCATION object:nil userInfo:dictionary];}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self.delegate locationError:error];
	}
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSString *lsStatus = @"";
    switch (status)
    {
        case kCLAuthorizationStatusNotDetermined:
            lsStatus = @"Undetermined";
            break;
            
        case kCLAuthorizationStatusRestricted:
            lsStatus = @"Restricted";
            break;
            
        case kCLAuthorizationStatusDenied:
            lsStatus = @"Denied";
            break;
            
        case kCLAuthorizationStatusAuthorized:
            lsStatus = @"Authorized";
            break;
            
        default:
            break;
    }
    NSLog(@"%@", lsStatus);
}



@end
