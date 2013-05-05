//
//  ViewController.m
//  RotateDemo
//
//  Created by HaiLee on 13-5-5.
//  Copyright (c) 2013年 Hai Lee. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)nextButtonClicked
{
    UIWindow *window = ((AppDelegate *)[UIApplication sharedApplication].delegate).window;
    
    ViewController *vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [nvc pushViewController:secondVC animated:NO];
    
    window.rootViewController = nvc;
    // window.rootViewController = secondVC;
}

@end
