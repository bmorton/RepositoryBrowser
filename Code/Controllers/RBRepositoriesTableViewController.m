//
//  RBRepositoriesTableViewController.m
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/16/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "RBRepositoriesTableViewController.h"
#import "GHRepository.h"

@implementation RBRepositoriesTableViewController

@synthesize tableController = _tableController;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Repositories";
    }
    return self;
}


#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableController = [RKTableController tableControllerForTableViewController:self];
    [self loadNetworkTable];
}

- (void)loadNetworkTable {
    [_tableController loadTableFromResourcePath:@"/orgs/RestKit/repos"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
