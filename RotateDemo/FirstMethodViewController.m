//
//  FirstMethodViewController.m
//  RotateDemo
//
//  Created by HaiLee on 13-5-28.
//  Copyright (c) 2013年 Hai Lee. All rights reserved.
//

#import "FirstMethodViewController.h"

@interface FirstMethodViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel1;
@property (weak, nonatomic) IBOutlet UILabel *textLabel2;
@end

@implementation FirstMethodViewController

- (void)viewDidLoad
{
    self.title = @"第一种方法";
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willRotate, self.view.frame:%@", NSStringFromCGRect(self.view.frame));
}

// 在这个时候, view.frame 才发生变化.
- (void)viewWillLayoutSubviews
{
    NSLog(@"viewWillLayout, self.view.frame:%@", NSStringFromCGRect(self.view.frame));
}

// 第一种方法,直接修改几个 view 的 frame.
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"willAnimateRotation, self.view.frame:%@", NSStringFromCGRect(self.view.frame));
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.textLabel1.frame = self.view.frame;
        self.textLabel2.hidden = YES;
    } else {
        self.textLabel2.hidden = NO;
        CGFloat viewFrameWidth = self.view.frame.size.width;
        CGFloat viewFrameHeight = self.view.frame.size.height;
        self.textLabel1.frame = CGRectMake(0, 0, viewFrameWidth, viewFrameHeight / 2);
        self.textLabel2.frame = CGRectMake(0, viewFrameHeight / 2, viewFrameWidth, viewFrameHeight / 2);
    }
}

@end
