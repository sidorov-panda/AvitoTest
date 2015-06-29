//
//  ViewController.m
//  Avito
//
//  Created by Alexey Sidorov on 29/06/15.
//  Copyright (c) 2015 Alexey Sidorov. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "UserCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic, readwrite) NSArray *users;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadUsers {
    __weak typeof(self) welf  = self;
    [User usersWithCompletion:^(NSArray *users, NSError *error) {
        if (!error) {
            welf.users = users;
        }
        else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Не удалось ничего загрузить", @"Не удалось ничего загрузить")];
            });
            welf.users = @[];
        }
        [welf.tableView reloadData];
    }];
}

- (User *)userForIndexPath:(NSIndexPath *)indexPath {
    if (self.users.count > indexPath.row) {
        return self.users[indexPath.row];
    }
    return nil;
}

#pragma mark UITalbeView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.f;
}

#pragma mark UITableView Data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    User *user = [self userForIndexPath:indexPath];
    UserCell *cell =  (UserCell *)[tableView dequeueReusableCellWithIdentifier:@"UserCell"];
    
    [cell.contentView setNeedsUpdateConstraints];
    [cell.contentView updateConstraints];
    
    if ([user isKindOfClass:User.class]) {
        cell.loginLabel.text = user.login;
        [cell.avatarImageView setImageWithURL:user.avatarURL];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


@end
