//
//  API.m
//  Avito
//
//  Created by Alexey Sidorov on 29/06/15.
//  Copyright (c) 2015 Alexey Sidorov. All rights reserved.
//

#import "API.h"
#import <AFNetworking/AFNetworking.h>

@implementation API

NSString * const kGitHubURLString = @"https://api.github.com";

+ (id)sharedInstance {
    static dispatch_once_t p = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (AFHTTPRequestOperationManager *)defaultManager {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    return manager;
}

- (void)userListWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    [[self defaultManager] GET:[NSString stringWithFormat:@"%@/users", kGitHubURLString] parameters:nil success:success failure:failure];
}

@end
