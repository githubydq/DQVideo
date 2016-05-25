//
//  DQAVPlayer.m
//  DQMyVideo
//
//  Created by youdingquan on 16/5/25.
//  Copyright © 2016年 youdingquan. All rights reserved.
//

#import "DQAVPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface DQAVPlayer ()
@property(nonatomic,strong)AVPlayer * player;
@property(nonatomic,strong)AVPlayerItem * playerItem;
@property(nonatomic,strong)AVPlayerLayer * playerLayer;
@end

@implementation DQAVPlayer

-(instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"%s",__FUNCTION__);
    }
    return self;
}


-(void)configUI{
    self.playerItem = [[AVPlayerItem alloc] initWithURL:[self.datasource DQAVPlayerURL]];
    self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = self.bounds;
    [self.layer addSublayer:self.playerLayer];
}
-(void)reloadData{
    self.playerItem = [[AVPlayerItem alloc] initWithURL:[self.datasource DQAVPlayerURL]];
    [self.player replaceCurrentItemWithPlayerItem:self.playerItem];
}

#pragma mark -
#pragma mark setter & getter
-(void)setDatasource:(id<DQAVPlayerDataSource>)datasource{
    _datasource = datasource;
    [self configUI];
}

-(void)setDelegate:(id<DQAVPlayerDelegate>)delegate{
    _delegate = delegate;
}

#pragma mark -
#pragma mark touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    if (touch.tapCount == 2) {
        if (self.player.rate == 0.0) {
            [self.player play];
        }else{
            [self.player pause];
        }
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}


@end
