//
//  ThirdMethodViewController.m
//  RotateDemo
//
//  Created by HaiLee on 13-5-29.
//  Copyright (c) 2013年 Hai Lee. All rights reserved.
//

#import "ThirdMethodViewController.h"

@interface ThirdMethodViewController ()
@property (nonatomic, assign) BOOL isShowingLandscapeView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel1;
@property (weak, nonatomic) IBOutlet UILabel *textLabel2;
@end

// 第三种方法,示例使用 UIDevice 的 notification.
// 这种方法,也是最不可取的. 仅可以做为Demo.
@implementation ThirdMethodViewController

- (void)viewDidLoad
{
    self.title = @"第三种方法";
    
    self.isShowingLandscapeView = NO;
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    // 直接展示一个 viewController 的效果实在是不理想.估计没人会采用.
//    if (UIDeviceOrientationIsLandscape(deviceOrientation) && !self.isShowingLandscapeView) {
//        ThirdMethodViewController *landScapeVC = [[ThirdMethodViewController alloc]
//                                                  initWithNibName:@"ThirdMethodLandViewController" bundle:nil];
//        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:landScapeVC];
//        [self presentViewController:navigationVC animated:YES completion:nil];
//        self.isShowingLandscapeView = YES;
//    } else if (UIDeviceOrientationIsPortrait(deviceOrientation) && self.isShowingLandscapeView) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//        self.isShowingLandscapeView = NO;
//    }
    
    // 同时还要注意一点的是,这里是根据 DeviceOrientation 来判断的,而不是根据UIInterfaceOrientation 来判断的,因此几乎没什么用.
    if (UIDeviceOrientationIsLandscape(deviceOrientation)) {
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

- (void)dealloc
{
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
