//
//  AppDelegate.m
//  GitHubFriends
//
//  Created by ian kunneke on 7/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "AppDelegate.h"
#import "FriendsTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navController = [[UINavigationController alloc] init];
    FriendsTableViewController *friendsTVC = [[FriendsTableViewController alloc] init];
    navController.viewControllers = @[friendsTVC];
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
