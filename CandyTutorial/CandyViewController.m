//
//  CandyViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/16/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "CandyScrollViewController.h"
#import "CandyViewController.h"
#import "Candy.h"

@interface CandyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *candyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *candyImageView;

@end

@implementation CandyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _candyLabel.text = self.candy.name;
    _candyImageView.image = [UIImage imageWithData:self.candy.image];
    _candyImageView.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"imageScroll"]) {
        CandyScrollViewController *candyScrollViewController = [segue destinationViewController];
        candyScrollViewController.scrollImage = _candyImageView.image;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    if ([touch view] == _candyImageView){
         NSLog(@"touchrecieved");
        [self performSegueWithIdentifier:@"imageScroll" sender:self];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //self.candyLabel.text = self.candy.name;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //self.candy.name = self.candyNameTextField.text;
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
