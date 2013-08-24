//
//  AppDelegate.m
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/20/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "RootViewController.h"
#import "WCAlertView.h"
#import "Reachability.h"

@interface AppDelegate()

// properties

/** Root navigation view controller
 */
@property (nonatomic, retain) BaseNavigationController* navController;

/** Root view controller
 */
@property (nonatomic, retain) RootViewController* rootViewController;

/** Reachability
 */
@property (nonatomic, retain) Reachability* reachability;

// methods


@end

@implementation AppDelegate

// public properties
@synthesize window;

// private properties
@synthesize navController;
@synthesize rootViewController;
@synthesize reachability;


- (void)dealloc
{
    self.window             = nil;
    self.navController      = nil;
    self.rootViewController = nil;
    self.reachability       = nil;
    
    [super dealloc];
}

- (BOOL)           application: (UIApplication*) application
 didFinishLaunchingWithOptions: (NSDictionary*)  launchOptions
{
    // Initialization window
    self.window = [[[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]] autorelease];

    // Initialization root view controller
    self.rootViewController = [[[RootViewController alloc] init] autorelease];
    
    // Initialization root navigation controller
    self.navController = [[[BaseNavigationController alloc] initWithRootViewController: self.rootViewController] autorelease];
    
    // Set root window view controller
    self.window.rootViewController = self.navController;
    
    [self.window makeKeyAndVisible];
    
    // Initilization reachability
    self.reachability = [Reachability reachabilityForInternetConnection];
    
    return YES;
}

- (void) applicationWillResignActive: (UIApplication*) application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void) applicationDidEnterBackground: (UIApplication*) application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void) applicationWillEnterForeground: (UIApplication*) application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void) applicationDidBecomeActive: (UIApplication*) application
{
    if (![self.reachability isReachable])
    {
        [WCAlertView setDefaultStyle: WCAlertViewStyleWhiteHatched];
        
        [WCAlertView showAlertWithTitle: @"No internet"
                                message: @"No internet connection. Please check Settings."
                     customizationBlock: ^(WCAlertView* alertView) {
                                              
                     }
                        completionBlock: ^(NSUInteger buttonIndex, WCAlertView* alertView) {
                                                 
                        }
                      cancelButtonTitle: @"Cancel"
                      otherButtonTitles: @"Ok", nil];
    }
}

- (void) applicationWillTerminate: (UIApplication*) application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
