//
//  RBRepositoriesTableViewController.m
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/16/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "RBRepositoriesTableViewController.h"
#import "GHRepository.h"
#import "RBCommitsTableViewController.h"

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

    RKTableViewCellMapping *cellMapping = [RKTableViewCellMapping cellMapping];
    cellMapping.style = UITableViewCellStyleSubtitle;
    cellMapping.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cellMapping mapKeyPath:@"name" toAttribute:@"textLabel.text"];
    [cellMapping mapKeyPath:@"summary" toAttribute:@"detailTextLabel.text"];
    cellMapping.onSelectCellForObjectAtIndexPath = ^(UITableViewCell *cell, id object, NSIndexPath *indexPath) {
        RBCommitsTableViewController *viewController = [[RBCommitsTableViewController alloc] initWithStyle:UITableViewStylePlain];
        viewController.repository = (GHRepository *)object;
        [self.navigationController pushViewController:viewController animated:YES];
    };
    
    _tableController = [RKTableController tableControllerForTableViewController:self];
    [_tableController mapObjectsWithClass:[GHRepository class] toTableCellsWithMapping:cellMapping];
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
