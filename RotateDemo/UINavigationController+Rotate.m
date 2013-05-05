//
//  UINavigationController+Rotate.m
//  RotateDemo
//
//  Created by HaiLee on 13-5-5.
//  Copyright (c) 2013年 Hai Lee. All rights reserved.
//

#import "UINavigationController+Rotate.h"

@implementation UINavigationController (Rotate)

- (BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}

@end
