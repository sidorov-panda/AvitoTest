//
//  UserCell.m
//  Avito
//
//  Created by Alexey Sidorov on 29/06/15.
//  Copyright (c) 2015 Alexey Sidorov. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.loginLabel.text = @"";
    self.avatarImageView.image = nil;
}

@end
