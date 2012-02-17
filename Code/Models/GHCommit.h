//
//  GHCommit.h
//  RepositoryBrowser
//
//  Created by Brian Morton on 2/17/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import <RestKit/UI.h>

@interface GHCommit : NSObject

@property (nonatomic, retain) NSString *SHA;
@property (nonatomic, retain) NSString *commitMessage;
@property (nonatomic, retain) NSDictionary *author;
@property (nonatomic, retain) NSDictionary *committer;
@property (nonatomic, retain) NSURL *URL;

+ (RKObjectMapping *)objectMapping;

@end
