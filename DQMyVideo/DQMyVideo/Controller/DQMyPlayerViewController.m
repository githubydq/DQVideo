//
//  DQMyPlayerViewController.m
//  DQMyVideo
//
//  Created by youdingquan on 16/5/24.
//  Copyright © 2016年 youdingquan. All rights reserved.
//

#import "DQMyPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface DQMyPlayerViewController ()

@end

@implementation DQMyPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.url);
    if (self.url) {
        self.player = [[AVPlayer alloc] initWithURL:self.url];
        [self.player play];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

@end
