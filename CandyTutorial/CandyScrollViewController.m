//
//  CandyScrollViewController.m
//  CandyTutorial
//
//  Created by Lynne Okada on 9/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "CandyScrollViewController.h"

@interface CandyScrollViewController () 

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *candyScrollView;


@end

@implementation CandyScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.candyScrollView.delegate = self;
    
    //scrollView size equals image size
    self.candyScrollView.contentSize = self.imageView.image.size;
    
    //scrollImage equals image
    self.imageView.image = self.scrollImage;
    
    self.candyScrollView.minimumZoomScale = self.candyScrollView.frame.size.width / self.candyScrollView.frame.size.width;
    self.candyScrollView.maximumZoomScale = 2.0;
    [self.candyScrollView setZoomScale:self.candyScrollView.minimumZoomScale];

    //self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
}

- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
    CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width-frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
    }
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height-frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
    return frameToCenter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    self.imageView.frame = [self centeredFrameForScrollView:self.candyScrollView andUIView:self.imageView];
    return self.imageView;
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
