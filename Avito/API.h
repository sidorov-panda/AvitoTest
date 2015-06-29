//
//  API.h
//  Avito
//
//  Created by Alexey Sidorov on 29/06/15.
//  Copyright (c) 2015 Alexey Sidorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

@interface API : NSObject

+ (id)sharedInstance;

- (void)userListWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
