//
//  Alert.m
//  SocialRadar
//
//  Created by Adil on 1/11/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import "Alert.h"
#import "AppDelegate.h"


@implementation Alert

NSString * const ERROR_CODES[] =        {       @"Failure with unknown message code.",  //0
    @"A connection failure occurred.",              //1
    @"The request timed out.",                              //2
    @"Failure with unknown message code."           //3
    @"Failure with unknown message code."           //4
    @"Failure with unknown message code."           //5
    @"Unable to start HTTP connection."             //6
};

+(void) show:(NSString*)title andMessage:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

+(void) show:(NSString*)title andMessage:(NSString*)message withDelegate:(id)delegate{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}



+(void)showErrorMessageForCode:(int)code{
    if(ERROR_CODES[code])
        [Alert show:@"Connection Fail!" andMessage:ERROR_CODES[code]];
    else 
        [Alert show:@"Connection Fail!" andMessage:ERROR_CODES[0]];
}

/*
+ (void) showProgressDialog:(NSString *)message {
    
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] showProgressDialog:message];
}

+ (void) updateProgressDialogWithValue:(float)value {
    
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] updateProgressDialogWithValue:value];
}

+ (void) hideProgressDialog {

    [(AppDelegate*)[[UIApplication sharedApplication] delegate] hideProgressDialog];
}
*/

@end
