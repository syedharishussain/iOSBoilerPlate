//
//  CoreDataHelper.h
//  SocialRadar
//
//  Created by Waheeda on 5/3/12.
//  Copyright (c) 2012 TenPearls. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataHelper : NSObject


+(BOOL) save;
+(NSEntityDescription *) insertEntity:(NSString *) entityName;
+(NSEntityDescription *) getEntity:(NSString *) entityName;
+(NSArray *) executeFetchRequest:(NSFetchRequest *) fetchRequest;
+(int ) getCountForFetchRequest:(NSFetchRequest *) fetchRequest;

@end
