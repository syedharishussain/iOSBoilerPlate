//
//  JsonHelper.m
//  SocialRadar
//
//  Created by Mohsin on 1/25/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import "JsonHelper.h"

@implementation JsonHelper

+ (id) objectWithData:(NSData*)data{
    CJSONDeserializer *jsonDeserializer = [CJSONDeserializer deserializer];
    NSError *error;
    return [jsonDeserializer deserialize:data error:&error];
}

+ (id) objectWithString :(NSString*)string{
    return [JsonHelper objectWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}

+ (NSString *) stringWithObject:(id)object{
    
    CJSONSerializer *jsonSerializer = [CJSONSerializer serializer];
    NSError *error;
    return [[NSString alloc] initWithData:
            [jsonSerializer serializeObject:object error:&error] encoding:NSUTF8StringEncoding];
}

@end
