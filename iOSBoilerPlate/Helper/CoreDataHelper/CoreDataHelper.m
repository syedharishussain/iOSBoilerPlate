//
//  CoreDataHelper.m
//  SocialRadar
//
//  Created by Waheeda on 5/3/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import "CoreDataHelper.h"
#import "AppDelegate.h"

@implementation CoreDataHelper


+(BOOL) save
{
    NSError *error = nil;
    if (![[AppDelegate objectModel] save:&error]) {
        
        return NO;
    }
    return YES;
}

+(NSEntityDescription *) insertEntity:(NSString *) entityName
{
    return [NSEntityDescription 
            insertNewObjectForEntityForName:entityName        
            inManagedObjectContext:[AppDelegate objectModel]];
}

+(NSEntityDescription *) getEntity:(NSString *) entityName
{
    return [NSEntityDescription 
            entityForName:entityName inManagedObjectContext:[AppDelegate objectModel]];
}

+(NSArray *) executeFetchRequest:(NSFetchRequest *) fetchRequest
{
    NSError *error = nil;
    NSArray *results = [[AppDelegate objectModel] executeFetchRequest:fetchRequest error:&error];
    return results;
}

+(int ) getCountForFetchRequest:(NSFetchRequest *) fetchRequest
{
    NSError *error = nil;
    return  [[AppDelegate objectModel] countForFetchRequest:fetchRequest error:&error];
}


@end
