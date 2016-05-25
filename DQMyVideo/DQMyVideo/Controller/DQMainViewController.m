//
//  DQMainViewController.m
//  DQMyVideo
//
//  Created by youdingquan on 16/5/24.
//  Copyright © 2016年 youdingquan. All rights reserved.
//

#import "DQMainViewController.h"

@interface DQMainViewController ()

@end

@implementation DQMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * titleArray = @[@"在线视频",@"本地视频"];
    for (NSInteger i = 0 ; i < self.viewControllers.count; i++) {
        UIViewController * vc = self.viewControllers[i];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArray[i] image:nil selectedImage:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
