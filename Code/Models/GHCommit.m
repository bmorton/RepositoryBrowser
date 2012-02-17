//
//  GHCommit.m
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/17/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import "GHCommit.h"

static RKObjectMapping *objectMapping = nil;

@implementation GHCommit

@synthesize SHA = _SHA;
@synthesize commitMessage = _commitMessage;
@synthesize author = _author;
@synthesize committer = _committer;
@synthesize URL = _URL;

#pragma mark - Object mappings

+ (RKObjectMapping *)objectMapping {
    if (objectMapping == nil) {
        objectMapping = [RKObjectMapping mappingForClass:self];
        [objectMapping mapAttributes:@"author", @"committer", nil];
        [objectMapping mapKeyPath:@"commit.message" toAttribute:@"commitMessage"];
        [objectMapping mapKeyPath:@"sha" toAttribute:@"SHA"];
        [objectMapping mapKeyPath:@"url" toAttribute:@"URL"];
    }
    return objectMapping;
}


#pragma mark - String representation

- (NSString *)description {
    return [NSString stringWithFormat:@"GHCommit: %@ - %@", _SHA, _commitMessage];
}

@end