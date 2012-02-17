//
//  RBAppDelegate.m
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/16/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "RBAppDelegate.h"
#import <RestKit/RestKit.h>
#import "GHRepository.h"
#import "RBRepositoriesTableViewController.h"

#pragma mark - Private methods declaration
@interface RBAppDelegate ()
- (void)initializeRestKit;
- (void)constructViews;
@end

@implementation RBAppDelegate

@synthesize window = _window;

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self initializeRestKit];
    [self constructViews];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - Private methods

- (void)initializeRestKit {
    // Configure RestKit logging
    RKLogConfigureByName("RestKit", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDebug);
    RKLogConfigureByName("RestKit/Network/Queue", RKLogLevelDebug);
    // RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    
    // Define the shared objectManager
    RKObjectManager *manager = [RKObjectManager objectManagerWithBaseURL:[NSURL URLWithString:@"https://api.github.com"]];
    [manager.requestQueue setShowsNetworkActivityIndicatorWhenBusy:YES];
    
    // Setup the MIME types
    manager.acceptMIMEType = RKMIMETypeJSON;
    manager.serializationMIMEType = RKMIMETypeJSON;
    
    // Setup all objectMappings for their respective resource paths
    [manager.mappingProvider setObjectMapping:[GHRepository objectMapping] forResourcePathPattern:@"/orgs/:name/repos"];
}

- (void)constructViews {
    RBRepositoriesTableViewController *viewController = [[RBRepositoriesTableViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
}

@end
