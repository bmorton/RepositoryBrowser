//
//  RBAppDelegate.m
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/16/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "RBAppDelegate.h"
#import <RestKit/RestKit.h>

@implementation RBAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
