//
//  AddCandyViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/16/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "AddCandyViewController.h"
#import "CandyViewController.h"
#import "CandyListTableViewController.h"
#import "AddLocationViewController.h"
#import "Candy.h"

@interface AddCandyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *candyNameTextField;

@end

@implementation AddCandyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addCandyConfirmed"]) {
        CandyViewController* candyViewController = [segue destinationViewController];
        candyViewController.candy = 
//    } else if ([segue.identifier isEqualToString:@"addLocation]) {
//        AddLocationViewController *addLocationViewController = [segue destinationViewController];
//        addLocationViewController.candy = self.candyList[-1];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.candyNameTextField.text = self.candy.candyName;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
