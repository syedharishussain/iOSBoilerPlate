//
//  Color.m
//  SlopeTours
//
//  Created by Syed Haris Hussain on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Color.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation Color

+(UIColor*)blueColor{
   return [UIColor colorWithRed:0.2 green:0.4 blue:0.7 alpha:1.0];
}

+ (UIColor*) darkBlueColor{
    return [UIColor colorWithRed:60.0/256.0 green:88.0/256.0 blue:151.0/256.0 alpha:1.0];
}


+(UIColor*)gridBackgroundColor{
    return [UIColor colorWithRed:0.2 green:0.4 blue:0.7 alpha:1.0];
}

+(UIColor*)imageBackground{
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@""]];
    return background;
}

+(UIColor*)fadeColor{
    
    return [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:.5];
}

+(UIColor*)lightGreyColor{
    
    return [UIColor lightGrayColor];
    
}

+ (UIColor*) lightestGrayColor{
    return [UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1.0];
}

+ (UIColor*)torquiseColor{
    NSString * hexString = @"#FFFFFF";
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];

    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:0.7];
}


@end
