//
//  RBCommitsTableViewController.h
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/17/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <RestKit/UI.h>

@class GHRepository;

@interface RBCommitsTableViewController : UITableViewController <RKTableControllerDelegate>

@property (nonatomic, strong) RKTableController *tableController;
@property (nonatomic, strong) GHRepository *repository;

- (void)loadNetworkTable;

@end
