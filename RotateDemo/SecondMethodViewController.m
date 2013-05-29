//
//  SecondMethodViewController.m
//  RotateDemo
//
//  Created by HaiLee on 13-5-29.
//  Copyright (c) 2013年 Hai Lee. All rights reserved.
//

#import "SecondMethodViewController.h"

@interface SecondMethodViewController ()
@property (strong, nonatomic) IBOutlet UIView *potraitView;
@property (strong, nonatomic) IBOutlet UIView *landscapeView;
@end

@implementation SecondMethodViewController

- (void)viewDidLoad
{
    self.title = @"第二种方法";
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        self.view = self.landscapeView;
    } else {
        self.view = self.potraitView;
    }
}

@end
