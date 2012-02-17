//
//  RBCommitsTableViewController.m
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/17/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "RBCommitsTableViewController.h"
#import "GHCommit.h"

@implementation RBCommitsTableViewController

@synthesize tableController = _tableController;
@synthesize repository = _repository;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Commits";
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
    
    RKTableViewCellMapping *cellMapping = [RKTableViewCellMapping cellMapping];
    cellMapping.style = UITableViewCellStyleSubtitle;
    [cellMapping mapKeyPath:@"commitMessage" toAttribute:@"textLabel.text"];
    [cellMapping mapKeyPath:@"SHA" toAttribute:@"detailTextLabel.text"];
    
    _tableController = [RKTableController tableControllerForTableViewController:self];
    [_tableController mapObjectsWithClass:[GHCommit class] toTableCellsWithMapping:cellMapping];
    [self loadNetworkTable];
}

- (void)loadNetworkTable {
    [_tableController loadTableFromResourcePath:[@"/repos/RestKit/:name/commits" interpolateWithObject:_repository]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
