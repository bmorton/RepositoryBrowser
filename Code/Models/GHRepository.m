//
//  GHRepository.m
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/16/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "GHRepository.h"

static RKObjectMapping *objectMapping = nil;

@implementation GHRepository

@synthesize name = _name;
@synthesize summary = _summary;
@synthesize homepageURL = _homepageURL;
@synthesize masterBranch = _masterBranch;
@synthesize isPrivate = _isPrivate;
@synthesize isFork = _isFork;
@synthesize numberOfForks = _numberOfForks;
@synthesize numberOfWatchers = _numberOfWatchers;
@synthesize numberOfOpenIssues = _numberOfOpenIssues;
@synthesize htmlURL = _htmlURL;
@synthesize cloneURL = _cloneURL;
@synthesize gitURL = _gitURL;
@synthesize sshURL = _sshURL;
@synthesize lastPushedAt = _lastPushedAt;
@synthesize createdAt = _createdAt;

#pragma mark - Object mappings

+ (RKObjectMapping *)objectMapping {
    if (objectMapping == nil) {
        objectMapping = [RKObjectMapping mappingForClass:self];
        [objectMapping mapAttributes:@"name", nil];
        [objectMapping mapKeyPath:@"description" toAttribute:@"summary"];
        [objectMapping mapKeyPath:@"homepage" toAttribute:@"homepageURL"];
        [objectMapping mapKeyPath:@"master_branch" toAttribute:@"masterBranch"];
        [objectMapping mapKeyPath:@"private" toAttribute:@"isPrivate"];
        [objectMapping mapKeyPath:@"fork" toAttribute:@"isFork"];
        [objectMapping mapKeyPath:@"forks" toAttribute:@"numberOfForks"];
        [objectMapping mapKeyPath:@"watchers" toAttribute:@"numberOfWatchers"];
        [objectMapping mapKeyPath:@"open_issues" toAttribute:@"numberOfOpenIssues"];
        [objectMapping mapKeyPath:@"html_url" toAttribute:@"htmlURL"];
        [objectMapping mapKeyPath:@"clone_url" toAttribute:@"cloneURL"];
        [objectMapping mapKeyPath:@"git_url" toAttribute:@"gitURL"];
        [objectMapping mapKeyPath:@"ssh_url" toAttribute:@"sshURL"];
        [objectMapping mapKeyPath:@"pushed_at" toAttribute:@"lastPushedAt"];
        [objectMapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    }
    return objectMapping;
}


#pragma mark - String representation

- (NSString *)description {
    return [NSString stringWithFormat:@"GHRepository: %@ - %@", _name, _summary];
}

@end
