//
//  AppDelegate.h
//  iOSBoilerPlate
//
//  Created by Haris on 11/20/12.
//  Copyright (c) 2012 Haris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) UINavigationController * navigationController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (AppDelegate*) sharedDelegate;

+ (NSManagedObjectContext*)objectModel;

- (ViewController*)getRootViewController;

- (void)createNavigationController;

@end
