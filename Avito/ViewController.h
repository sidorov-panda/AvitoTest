//
//  ViewController.h
//  Avito
//
//  Created by Alexey Sidorov on 29/06/15.
//  Copyright (c) 2015 Alexey Sidorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic, readonly) NSArray *users;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

