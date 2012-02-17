//
//  RBRepositoriesTableViewController.h
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/16/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <RestKit/UI.h>

@interface RBRepositoriesTableViewController : UITableViewController <RKTableControllerDelegate>

@property (strong, nonatomic) RKTableController *tableController;

- (void)loadNetworkTable;

@end
