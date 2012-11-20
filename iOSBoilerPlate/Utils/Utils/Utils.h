//
//  Utils.h
//  SocialRadar
//
//  Created by Adil on 1/16/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Reachability.h"
#import "Alert.h"
#import <AudioToolbox/AudioServices.h>
#import "Font.h"
#import "Color.h"


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define MERCATOR_OFFSET 268435456 /* (total pixels at zoom level 20) / 2 */
#define MERCATOR_RADIUS 85445659.44705395 /* MERCATOR_OFFSET / pi */

@interface Utils : NSObject{}

+ (NSNumber*) convertStringToNumber:(NSString*)string;
+ (BOOL) isInternetConnectionAvailable;
+ (void) delay :(SEL) action onDelegate:(id)delegate;
+ (void) longDelay :(SEL) action onDelegate:(id)delegate;
+ (void) delayWithTime : (float) time andSelector:(SEL) action onDelegate:(UIViewController*)delegate;
+ (void) showInternetActivityIndicator:(BOOL)value;
+ (BOOL) isSimulator;
+ (BOOL) isIPad;

+ (NSString*)joinUserName:(NSString*)firstName andLastName:(NSString*)lastName;
+ (NSMutableArray *) getPlistValues:(NSString*)plistName;

+ (void) makeCall : (NSString *) phoneNumber;
+ (void) sendSMS : (NSString *) phoneNumber;
+ (void) openMailComposer : (NSString *) emailAddress;
+ (NSMutableArray*) getAlphabets ;
+ (UIColor *) getTableViewItemBackgroundColor;

+ (NSString *) getDeviceName;
//+ (NSString *) getDeviceID;
+ (NSString *) getDeviceOS;
+ (NSMutableArray *) getInternationalCallingCodes; 

+ (BOOL) isValidEmailAddress : (NSString *) emailAddress;
+ (NSString *) trim : (NSString *) string;
+ (UIImage*)resizeImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (void)saveImagesToDocumentsDirectory:(NSData*)data withName:(NSString*)name;
+ (UIImage*)imageFromDocumentsDirectory:(NSString*)imageName;

+ (void) showNoConnectivityAlert;

+ (NSDate *) getDateFromString : (NSString *)dateString;
+ (NSDate *) getUTCDateFromString : (NSString *)dateString;

+ (NSString *) getDateFromSQLDate : (NSString *)datePlusTime;
+ (NSString *) getLocalDateFromUTCDate :(NSString *)gmtDateStr;
+ (NSString *) getTimeFromSQLDate : (NSString *)datePlusTime;
+ (NSString *) getCurrentDateTimeAsString;

+ (void) clearCookies;
+ (float) getScreenWidth;

+ (void) vibrate;
+ (void) playSound;

+ (BOOL) isIOS5orGreater;
+ (NSInteger) getSystemVersionAsAnInteger;
+ (void)showImplementationNotReady;
+ (UIImage*)resizeImage:(UIImage*)image andSize:(CGSize)size ;
+ (NSString *) getCurrentDateTimeAsStringWithFormat:(NSString*)dateFormat;
+ (BOOL) isNull:(id) object;
+(BOOL) isEmpty:(NSString *)string ;
+(NSString*) stringByTrimmingWhiteSpaces:(NSString*) string;
+(NSString*)getUniqueId;
+(NSArray*)getByteArrayOfImageData:(NSData*)data;
+(id)readFile:(NSString *)fileName;
+ (double)meterToFeetConversion:(double)meter;


+(BOOL)timeIntervalForDate:(NSDate*)fromDate toDate:(NSDate*)toDate Interval:(double)interval;

+ (NSDictionary*) locationMatricToEnglishConversion:(double)coordinateLatitude longitude:(double)coordinateLongitude;

+ (CGPoint)pointFromLocation:(CLLocation*)location zoomLevel:(int)zoom;

@end
