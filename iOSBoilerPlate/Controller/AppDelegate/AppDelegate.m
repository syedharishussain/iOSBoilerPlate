//
//  AppDelegate.m
//  iOSBoilerPlate
//
//  Created by Haris on 11/20/12.
//  Copyright (c) 2012 Haris. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize viewController;
@synthesize managedObjectContext;
@synthesize persistentStoreCoordinator;
@synthesize managedObjectModel;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createNavigationController];
    
    return YES;
}

#pragma mark - App Delegate Shared Instance

+ (AppDelegate*)sharedDelegate{
    
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

#pragma mark - Navigation Controller and RootViewController 

- (void)createNavigationController{
    if (navigationController == nil) 
        navigationController = [[UINavigationController alloc]
                                 initWithRootViewController:[self getRootViewController]];
    
    [self.window addSubview:navigationController.view];
}

- (ViewController*)getRootViewController{
    if (viewController == nil) 
        viewController = [[ViewController alloc] init];
    
    return viewController;
}

#pragma mark - App Delegate Life Cycle

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - CoreData Methods

+ (NSManagedObjectContext*)objectModel{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return appDelegate.managedObjectContext;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *localManagedObjectContext = self.managedObjectContext;
    if (localManagedObjectContext != nil)
    {
        if ([localManagedObjectContext hasChanges] && ![localManagedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (managedObjectModel != nil)
    {
        return managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SlopeTours" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

@end
