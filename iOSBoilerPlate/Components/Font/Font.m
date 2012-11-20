//
//  Font.m
//  SlopeTours
//
//  Created by Syed Haris Hussain on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Font.h"

@implementation Font

+(UIFont*)normalFont{
    return [UIFont fontWithName:APPLICATION_FONT size:12];
}

+(UIFont*)mediumFontBold{
    return [UIFont fontWithName:APPLICATION_BOLD_FONT size:15];
}

+(UIFont*)mediumFont{
    return [UIFont fontWithName:APPLICATION_FONT size:15];
}

+(UIFont*)boldFont{
    return [UIFont fontWithName:APPLICATION_BOLD_FONT size:12];
}

+(UIFont*)largerBoldFont{
    return [UIFont fontWithName:APPLICATION_BOLD_FONT size:18];
}

+(UIFont*)smallBoldFont{
    return [UIFont fontWithName:APPLICATION_FONT size:11];
}
+(UIFont*)largeBoldFont{
    return [UIFont fontWithName:APPLICATION_BOLD_FONT size:14];
}

@end
