//
//  User.h
//  Avito
//
//  Created by Alexey Sidorov on 29/06/15.
//  Copyright (c) 2015 Alexey Sidorov. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface User : MTLModel


extern NSString * const kUserJSONKeyLogin;
extern NSString * const kUserJSONKeyAvatarURL;


@property (strong, nonatomic) NSString *login;

@property (strong, nonatomic) NSURL *avatarURL;

+ (void)usersWithCompletion:(void (^)(NSArray *users, NSError *error))completion;

@end
