//
//  AWNavigationController.m
//  Awesome
//
//  Created by qm on 2017/11/13.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface AWNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation AWNavigationController


+ (void)initialize
{
    // 导航
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = [UIColor redColor];
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [navBar setTitleTextAttributes:dict];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.interactivePopGestureRecognizer.enabled = NO;
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage: @"navigationbar_back"];
        viewController.hidesBottomBarWhenPushed = YES;
        
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.interactivePopGestureRecognizer.enabled = YES;
}


- (void)back
{
    [self popViewControllerAnimated:YES];
}



/*    两种自定义导航的方式（1.更换整个返回按钮 2.只更换返回指示器），都要保证侧滑手势有效
 
 
 1. 整个替换导航返回按钮image
 遵循协议  <UINavigationControllerDelegate, UIGestureRecognizerDelegate>
 
 
 + (void)initialize
 {
 // 导航
 UINavigationBar *navBar = [UINavigationBar appearance];
 navBar.barTintColor = [UIColor redColor];
 NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
 [navBar setTitleTextAttributes:dict];
 }
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 
 self.interactivePopGestureRecognizer.delegate = self;
 self.delegate = self;
 }
 
 - (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
 {
 self.interactivePopGestureRecognizer.enabled = NO;
 if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
 viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage: @"navigationbar_back"];
 viewController.hidesBottomBarWhenPushed = YES;
 
 
 }
 
 [super pushViewController:viewController animated:animated];
 }
 
 - (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
 {
 self.interactivePopGestureRecognizer.enabled = YES;
 }
 
 
 - (void)back
 {
 [self popViewControllerAnimated:YES];
 }
 
 <====================================================================================>
 
 2. 只替换返回箭头 backIndicatorImage backIndicatorTransitionMaskImage
 
 + (void)initialize
 {
 // 导航
 UINavigationBar *navBar = [UINavigationBar appearance];
 navBar.barTintColor = [UIColor redColor];
 NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
 [navBar setTitleTextAttributes:dict];
 
 
 // 设置整个项目所有item的主题样式
 UIBarButtonItem *item = [UIBarButtonItem appearance];
 
 // 设置普通状态
 UIFont *font = [UIFont systemFontOfSize:15];
 NSDictionary *normalAttr = @{
 NSForegroundColorAttributeName: [UIColor whiteColor],
 NSFontAttributeName: font
 };
 [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
 
 // 设置不可用状态
 NSDictionary *disableAttr = @{
 NSForegroundColorAttributeName: [UIColor lightGrayColor],
 NSFontAttributeName: font
 };
 [item setTitleTextAttributes:disableAttr forState:UIControlStateDisabled];
 // 返回按钮
 // 设置文字，水平偏移到看不见的位置
 [item setBackButtonTitlePositionAdjustment:UIOffsetMake(LONG_MIN, 0) forBarMetrics:UIBarMetricsDefault];
 
 }
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 
 self.navigationBar.backIndicatorImage = [[UIImage imageNamed:@"navi_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 self.navigationBar.backIndicatorTransitionMaskImage = [[UIImage imageNamed:@"navi_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 }
 
 - (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
 {
 if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
 viewController.hidesBottomBarWhenPushed = YES;
 }
 
 [super pushViewController:viewController animated:animated];
 }
 
 
 
 */



@end
