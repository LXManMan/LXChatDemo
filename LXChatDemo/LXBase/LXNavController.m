//
//  LXNavController.m
//  LXChatDemo
//
//  Created by Lai on 2019/7/5.
//  Copyright © 2019 manman. All rights reserved.
//

#import "LXNavController.h"

@interface LXNavController ()<UIGestureRecognizerDelegate>

@end

@implementation LXNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationBar.translucent = NO;
    self.interactivePopGestureRecognizer.delegate = self;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    NSLog(@"%s, %@",__func__,viewController);
    // 左上角的返回键
    // 注意：第一个控制器不需要返回键
    // if不是第一个push进来的子控制器{
    if (self.childViewControllers.count >= 1) {
        // 左上角的返回按钮
        
        viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"fanhui"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    // super的push方法一定要写到最后面
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view
    // 也就会调用viewController的viewDidLoad方法
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];// 这里不用写self.navigationController，因为它自己就是导航控制器
}

@end
