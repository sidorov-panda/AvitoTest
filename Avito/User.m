//
//  User.m
//  Avito
//
//  Created by Alexey Sidorov on 29/06/15.
//  Copyright (c) 2015 Alexey Sidorov. All rights reserved.
//

#import "User.h"
#import "API.h"
#import <Mantle/Mantle.h>

NSString * const kUserJSONKeyLogin = @"login";
NSString * const kUserJSONKeyAvatarURL = @"avatar_url";

@interface User () <MTLJSONSerializing>

@end


@implementation User


+ (void)usersWithCompletion:(void (^)(NSArray *users, NSError *error))completion {
    [[API sharedInstance] userListWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:NSArray.class]) {
            NSError *mantleUserError = nil;
            NSArray *users = [MTLJSONAdapter modelsOfClass:User.class fromJSONArray:responseObject error:&mantleUserError];
            return completion(users, mantleUserError);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}


#pragma mark - MTL

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{NSStringFromSelector(@selector(login)) : kUserJSONKeyLogin,
             NSStringFromSelector(@selector(avatarURL)) : kUserJSONKeyAvatarURL,
             };
}


@end
