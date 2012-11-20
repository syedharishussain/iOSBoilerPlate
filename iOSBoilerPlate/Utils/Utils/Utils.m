//
//  Utils.m
//  SocialRadar
//
//  Created by Adil on 1/16/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import "Utils.h"
#import "AppDelegate.h"

@implementation Utils

+ (NSNumber*) convertStringToNumber:(NSString*)string{
    return[NSNumber numberWithInteger:[string integerValue]];
}

+ (NSMutableArray *) getPlistValues:(NSString*)plistName{
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSMutableDictionary *plistDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    NSMutableArray *plistValuesArray= (NSMutableArray*)[plistDictionary allValues];
    return [plistValuesArray objectAtIndex:0];
}



+ (BOOL)isInternetConnectionAvailable{
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus netWorkStatus = [r currentReachabilityStatus];
    
    if((netWorkStatus != ReachableViaWiFi) && (netWorkStatus != ReachableViaWWAN)) {
//        [Alert show:@"Connection Failure" andMessage:@"No Internet Connectivity Available"];
        return NO;
    }
    
    return YES;
}

+ (void) delay :(SEL) action onDelegate:(id)delegate{
    [delegate performSelector:action withObject:nil afterDelay:0.05];
}

+ (void) longDelay :(SEL) action onDelegate:(id)delegate{
    [delegate performSelector:action withObject:nil afterDelay:1.5];
}

+ (void) delayWithTime:(float)time andSelector:(SEL)action onDelegate:(UIViewController *)delegate {
    
    [delegate performSelector:action withObject:nil afterDelay:time];
}

+ (void)showInternetActivityIndicator:(BOOL)value{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = value;
}


+ (BOOL) isSimulator {
    NSString *device = [[UIDevice currentDevice] model];
    return ([device hasSuffix:@"Simulator"]);
}

+ (BOOL) isIPad {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? YES : NO;
}

+ (NSString*) joinUserName:(NSString*)firstName andLastName:(NSString*)lastName{
    if([lastName length] == 0)
        return @"Person";
    
    return [NSString stringWithFormat:@"%@, %@",lastName,firstName];
}

+ (void) makeCall:(NSString *) phoneNumber {

    if (![self isSimulator]) {
        phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *uri = [NSString stringWithFormat:@"tel://%@", phoneNumber];
        NSURL *url = [NSURL URLWithString:uri];
        [[UIApplication sharedApplication] openURL:url];
    }
}

+ (void) sendSMS:(NSString *) phoneNumber {

    if (![self isSimulator]) {
        phoneNumber = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *uri = [NSString stringWithFormat:@"sms://%@", phoneNumber];
        NSURL *url = [NSURL URLWithString:uri];
        [[UIApplication sharedApplication] openURL:url];
    }
}

+ (void) openMailComposer:(NSString *)emailAddress {

    if (![self isSimulator]) {
        
        NSString *body = @"";
        NSString *mailtoURLString = [NSString stringWithFormat:@"mailto:%@?body=%@", emailAddress, [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailtoURLString]];
    }
}

+ (NSMutableArray*) getAlphabets {
    
    return [[NSMutableArray alloc]initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", 
     @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", 
            @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
}

+ (UIColor *) getTableViewItemBackgroundColor {
    return [UIColor colorWithRed:242/256.0 green:242/256.0 blue:242/256.0 alpha:1.0];
    //return [UIColor whiteColor];
}

+ (NSString *) getDeviceName {
    
    return [[UIDevice currentDevice] model];
}

+ (NSString *) getDeviceOS {

    NSString *systemVersion = [[UIDevice currentDevice]systemVersion];
    return systemVersion;
}

+ (NSMutableArray *) getInternationalCallingCodes {
    
    NSMutableArray *test = [[NSMutableArray alloc]init];
    NSMutableDictionary *test1 = [[NSMutableDictionary alloc] init];
    [test1 setObject:@"+92 Pakistan" forKey:@"Name"];
    [test1 setObject:@"92" forKey:@"ID"];
    
    NSMutableDictionary *test2 = [[NSMutableDictionary alloc] init];
    [test2 setObject:@"+1 United States" forKey:@"Name"];
    [test2 setObject:@"1" forKey:@"ID"];
    
    NSMutableDictionary *test3 = [[NSMutableDictionary alloc] init];
    [test3 setObject:@"+91 India" forKey:@"Name"];
    [test3 setObject:@"91" forKey:@"ID"];

    [test addObject:test1];
    [test addObject:test2];
    [test addObject:test3];
    
    return test;
}

+ (BOOL) isValidEmailAddress:(NSString *)emailAddress {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailAddress];
}

+ (NSString *) trim:(NSString *)string {
    
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

+ (UIImage*)resizeImage:(UIImage *)image scaledToSize:(CGSize)newSize {

    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (void)saveImagesToDocumentsDirectory:(NSData*)data withName:(NSString *)name{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:name];
    NSData *imageData = UIImagePNGRepresentation([UIImage imageWithData:data]);
    [imageData writeToFile:savedImagePath atomically:NO];
}

+ (UIImage*)imageFromDocumentsDirectory:(NSString*)imageName{
    return [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",IMAGES_DIRECTORY_PATH,imageName]];
}

+ (void) showNoConnectivityAlert {
    
    [Alert show:ALERT_CONNECTION_FAILURE_TITLE andMessage:ALERT_CONNECTION_FAILURE_TEXT];
}

+ (NSDate *) getUTCDateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSDate *date = [dateFormat dateFromString:dateString]; 
    dateFormat = nil;
    
    return date;
}


+ (NSDate *) getDateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDate *date = [dateFormat dateFromString:dateString]; 
    dateFormat = nil;
    
    return date;
}

+ (NSString *) getDateFromSQLDate:(NSString *)datePlusTime{
    
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DATE_TIME_FORMAT_FOR_DISPLAY];
    
    dateString = [formatter stringFromDate:[self getDateFromString:datePlusTime]];
    
    formatter = nil;
    
    NSString *localDateTimeInStringFormat = [self getLocalDateFromUTCDate:dateString];
    return localDateTimeInStringFormat;
}

+ (NSString *) getLocalDateFromUTCDate :(NSString *)gmtDateStr {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DATE_TIME_FORMAT_FOR_DISPLAY];
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [formatter setTimeZone:gmt];
    
    NSDate *localDate = [formatter dateFromString:gmtDateStr]; // get the date
    NSTimeInterval timeZoneOffset = [[NSTimeZone systemTimeZone] secondsFromGMT]; // You could also use the systemTimeZone method
    
    NSTimeInterval gmtTimeInterval = [localDate timeIntervalSinceReferenceDate] + timeZoneOffset;
    NSDate *gmtCurrentDate = [NSDate dateWithTimeIntervalSinceReferenceDate:gmtTimeInterval];
    return [formatter stringFromDate:gmtCurrentDate];
}

+ (NSString *) getTimeFromSQLDate:(NSString *)datePlusTime{
    
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm a"];
    
    dateString = [formatter stringFromDate:[self getDateFromString:datePlusTime]];
    
    formatter = nil;
    
    return dateString;
}

+ (NSString *) getCurrentDateTimeAsString {
    
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    NSDate *now = [[NSDate alloc] init];
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DATE_TIME_FORMAT_FOR_SQL];    
    dateString = [formatter stringFromDate:now];
    
    formatter = nil;
    
    return dateString;
}
+ (NSString *) getCurrentDateTimeAsStringWithFormat:(NSString*)dateFormat {
    
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    NSDate *now = [[NSDate alloc] init];
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];    
    dateString = [formatter stringFromDate:now];
    
    formatter = nil;
    return dateString;
}

+ (void) clearCookies {
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
}

+ (float) getScreenWidth {
    
    return [[UIScreen mainScreen]bounds].size.width;
}

+ (void) vibrate {
    
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

+ (void) playSound {
    
    SystemSoundID systemSoundId;
    NSString *sndPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"wav"];
    CFURLRef sndURL = (__bridge CFURLRef)[[NSURL alloc] initFileURLWithPath:sndPath];
    AudioServicesCreateSystemSoundID(sndURL, &systemSoundId);
    AudioServicesPlaySystemSound(systemSoundId);
}


+(BOOL) isIOS5orGreater{
    return ([Utils getSystemVersionAsAnInteger] >= __IPHONE_5_0);
}

+ (NSInteger) getSystemVersionAsAnInteger
{
    int index = 0;
    NSInteger version = 0;
    
    NSArray* digits = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    NSEnumerator* enumer = [digits objectEnumerator];
    NSString* number;
    while (number = [enumer nextObject]) {
        if (index>2) {
            break;
        }
        NSInteger multipler = powf(100, 2-index);
        version += [number intValue]*multipler;
        index++;
    }
    return version;
}

+(void)showImplementationNotReady{
    [Alert show:@"Work In Progress..." andMessage:@"Functionality has not been implemented yet."];
}

+(BOOL) isEmpty:(NSString *)string 
{
	if(string == nil || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)
		return TRUE;
	else return FALSE;
	
}
+(NSString *) stringByTrimmingWhiteSpaces:(NSString *) string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

+(UIImage*)resizeImage:(UIImage*)image andSize:(CGSize)size {
	
	CGImageRef imageRef = [image CGImage];
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
	CGColorSpaceRef colorSpaceInfo = CGColorSpaceCreateDeviceRGB();
	
    if (alphaInfo == kCGImageAlphaNone)
		alphaInfo = kCGImageAlphaNoneSkipLast;
	
    
	CGContextRef bitmap;
    bitmap = CGBitmapContextCreate(NULL, size.width, size.height, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, alphaInfo);
    
	CGContextDrawImage(bitmap, CGRectMake(0, 0, size.width, size.height), imageRef);
	CGImageRef ref = CGBitmapContextCreateImage(bitmap);
	UIImage *result = [UIImage imageWithCGImage:ref];
	
	CGColorSpaceRelease(colorSpaceInfo);
	CGContextRelease(bitmap);
	CGImageRelease(ref);
	
	return result;	
}

+ (BOOL) isNull:(id) object
{
    return (object == nil ||  [object isKindOfClass:[NSNull class]]);
}

+(NSString*)getUniqueId
{
  return [[NSProcessInfo processInfo] globallyUniqueString];
}

+ (NSArray*)getByteArrayOfImageData:(NSData*)data{
    const unsigned char  *values = [data bytes];
    int cnt = [data length];
    
    NSMutableArray *byteArray = [NSMutableArray array];
    
    for (int i = 0; i < cnt; ++i)
    {
        [byteArray addObject:[NSNumber numberWithInt: values[i]]];
    }
    return byteArray;
}
+ (double)meterToFeetConversion:(double)meter
{
    double feetValue=meter/0.304800610;
    return feetValue;
}


+(id)readFile:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];
    return appFile;
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:appFile])
        
    {
        NSError *error= NULL;
        
        id resultData=[NSString stringWithContentsOfFile:appFile encoding:NSUTF8StringEncoding error:&error];
        
        if (error == NULL)
        {
            return resultData;
        }
    }
    return NULL;
}


+(BOOL)timeIntervalForDate:(NSDate*)fromDate toDate:(NSDate*)toDate Interval:(double)interval{
    
    NSTimeInterval fromDateInterval = [fromDate timeIntervalSince1970];
    NSTimeInterval toDateInterval   = [toDate timeIntervalSince1970];
    
    if (( toDateInterval - fromDateInterval ) >= interval ) {
        return YES;
    }
    return NO;
}

+ (NSDictionary*) locationMatricToEnglishConversion:(double)coordinateLatitude longitude:(double)coordinateLongitude {
    
    double latitude = coordinateLatitude;
    double longitude = coordinateLongitude;
    
    int latSeconds = (int)round(abs(latitude * 3600));
    int latDegrees = latSeconds / 3600;
    
    latSeconds = latSeconds % 3600;
    
    int latMinutes = latSeconds / 60;
    
    latSeconds %= 60;
    
    int longSeconds = (int)round(abs(longitude * 3600));
    int longDegrees = longSeconds / 3600;
    
    longSeconds = longSeconds % 3600;
    
    int longMinutes = longSeconds / 60;
    
    longSeconds %= 60;
    
    char latDirection = (latitude >= 0) ? 'N' : 'S';
    char longDirection = (longitude >= 0) ? 'E' : 'W';
    
    NSString * EnglistLat = [NSString stringWithFormat:@"%i° %i' %i\" %c",latDegrees, latMinutes, latSeconds, latDirection];
    NSString * EnglisyLong = [NSString stringWithFormat:@"%i° %i' %i\" %c",longDegrees, longMinutes, longSeconds, longDirection];
    
    return [NSDictionary dictionaryWithObjectsAndKeys:EnglistLat,@"latitude",
            EnglisyLong,@"longitude", nil];
//    [NSString stringWithFormat:@"%i° %i' %i\" %c, %i° %i' %i\" %c %f ft Elevation Above Sea Level", latDegrees, latMinutes, latSeconds, latDirection, longDegrees, longMinutes, longSeconds, longDirection, [_locationData altitude]];
}

+ (CGPoint)pointFromLocation:(CLLocation*)location zoomLevel:(int)zoom{
    
    CGPoint point;     
    
    CGFloat x = round((MERCATOR_OFFSET + MERCATOR_RADIUS * location.coordinate.longitude * M_PI / 180.0)/(20-zoom));
    CGFloat y = round((MERCATOR_OFFSET - MERCATOR_RADIUS * logf((1 + sinf(location.coordinate.latitude * M_PI / 180.0)) / (1 - sinf( location.coordinate.latitude * M_PI / 180.0))) / 2.0)/(20-zoom));
    
    point = CGPointMake(x, y);
    
    return point;
}


@end
