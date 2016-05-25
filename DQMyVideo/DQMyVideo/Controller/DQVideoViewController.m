//
//  DQVideoViewController.m
//  DQMyVideo
//
//  Created by youdingquan on 16/5/25.
//  Copyright © 2016年 youdingquan. All rights reserved.
//

#import "DQVideoViewController.h"
#import "DQMyPlayerViewController.h"
#import "DQAVPlayer.h"

@interface DQVideoViewController ()<DQAVPlayerDataSource>
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@property(nonatomic,strong)DQAVPlayer * avplayer;

@end

@implementation DQVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    
    self.avplayer = [[DQAVPlayer alloc] initWithFrame:CGRectMake(0, 20, 375, 200)];
    self.avplayer.backgroundColor = [UIColor blackColor];
    self.avplayer.datasource = self;
    [self.view addSubview:self.avplayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark 加载数据
-(void)loadData{
    self.urlTextField.text = nil;
}

#pragma mark -
#pragma mark button click
- (IBAction)currentPageClick:(UIButton *)sender {
    [self.avplayer reloadData];
}


#pragma mark -
#pragma mark segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //判断segue的id
    if ([segue.identifier isEqualToString:@"DQMyPlayer"]) {
        //进行相应的处理
        DQMyPlayerViewController * myPlayer = (DQMyPlayerViewController*)segue.destinationViewController;
        if (self.urlTextField.text.length > 0) {
            myPlayer.url = [NSURL fileURLWithPath:self.urlTextField.text];
        }else{
            myPlayer.url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Movie.m4v",[[NSBundle mainBundle] pathForResource:@"movie.bundle" ofType:nil]]];
        }
        
        
    }
}


#pragma mark -
#pragma mark DQAVplayer delegate & datasource
-(NSURL *)DQAVPlayerURL{
    return [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Movie.m4v",[[NSBundle mainBundle] pathForResource:@"movie.bundle" ofType:nil]]];
}
@end
