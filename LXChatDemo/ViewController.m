//
//  ViewController.m
//  LXChatDemo
//
//  Created by Lai on 2019/7/5.
//  Copyright © 2019 manman. All rights reserved.
//

#import "ViewController.h"
#import "LXChatController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"LXChatDemo";
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    UIButton *button =[UIButton LXButtonWithTitle:@"点击进入" titleFont:Font(15) Image:nil backgroundImage:nil backgroundColor:[UIColor whiteColor] titleColor:[UIColor redColor] frame:CGRectMake(50, 100, 100, 40)];
    
    [self.view addSubview:button];

    
    __weak typeof(self) weakSelf = self;
    [button addClickBlock:^(UIButton *button) {
            __strong typeof(weakSelf) self = weakSelf;
        LXChatController *chatVC = [[LXChatController alloc]init];
        [self.navigationController pushViewController:chatVC animated:YES];
    }];
}


@end
