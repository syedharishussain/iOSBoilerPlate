//
//  Alert.h
//  SocialRadar
//
//  Created by Adil on 1/11/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alert : NSObject{}

+(void) show:(NSString*)title andMessage:(NSString*)message;
+(void) show:(NSString*)title andMessage:(NSString*)message withDelegate:(id)delegate;

+(void)showErrorMessageForCode:(int)code;


@end
