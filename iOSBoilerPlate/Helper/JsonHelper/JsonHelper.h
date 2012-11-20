//
//  JsonHelper.h
//  SocialRadar
//
//  Created by Mohsin on 1/25/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJSONDeserializer.h"
#import "CJSONSerializer.h"

@interface JsonHelper : NSObject{}

+ (id) objectWithData:(NSData*)data;

+ (id) objectWithString:(NSString*)string;

+ (NSString *) stringWithObject:(id)object;

@end
