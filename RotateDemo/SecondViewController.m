//
//  SecondViewController.m
//  RotateDemo
//
//  Created by HaiLee on 13-5-5.
//  Copyright (c) 2013年 Hai Lee. All rights reserved.
//

#import "SecondViewController.h"
#define degreeToRadian(X) (M_PI * (X) / 180)

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
    CGAffineTransform transform = CGAffineTransformMakeRotation(degreeToRadian(90));
    self.navigationController.view.transform = transform;
    self.navigationController.view.bounds = CGRectMake(0, 0, 480, 320);
    self.navigationController.navigationBar.frame = CGRectMake(0, 20, 480, 32);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    CGAffineTransform transform = CGAffineTransformMakeRotation(degreeToRadian(0));
    self.navigationController.view.transform = transform;
    self.navigationController.view.bounds = CGRectMake(0, 0, 320, 480);
    self.navigationController.navigationBar.frame = CGRectMake(0, 20, 320, 44);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

@end
