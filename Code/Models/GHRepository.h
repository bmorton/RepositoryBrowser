//
//  GHRepository.h
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/16/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface GHRepository : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSURL *homepageURL;
@property (nonatomic, retain) NSString *masterBranch;

@property (nonatomic) BOOL isPrivate;
@property (nonatomic) BOOL isFork;

@property (nonatomic, retain) NSNumber *numberOfForks;
@property (nonatomic, retain) NSNumber *numberOfWatchers;
@property (nonatomic, retain) NSNumber *numberOfOpenIssues;

@property (nonatomic, retain) NSURL *htmlURL;
@property (nonatomic, retain) NSURL *cloneURL;
@property (nonatomic, retain) NSURL *gitURL;
@property (nonatomic, retain) NSURL *sshURL;

@property (nonatomic, retain) NSDate *lastPushedAt;
@property (nonatomic, retain) NSDate *createdAt;

+ (RKObjectMapping*)objectMapping;

@end
