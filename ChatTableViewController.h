//
//  ChatTableViewController.h
//  CandyTutorial
//
//  Created by Lynne Okada on 9/25/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewController : UITableViewController <UITextFieldDelegate, NSURLSessionDelegate>
@property (strong, nonatomic) NSMutableArray *chatList;
@property (strong, nonatomic) UITableView *tableView;

@end
