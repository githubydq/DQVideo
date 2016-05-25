//
//  DQAVPlayer.h
//  DQMyVideo
//
//  Created by youdingquan on 16/5/25.
//  Copyright © 2016年 youdingquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DQAVPlayerDataSource <NSObject>

@required
-(NSURL*)DQAVPlayerURL;

@end

@protocol DQAVPlayerDelegate <NSObject>


@end

@interface DQAVPlayer : UIView
@property(nonatomic,assign)id <DQAVPlayerDataSource> datasource;
@property(nonatomic,assign)id <DQAVPlayerDelegate> delegate;

/**
 数据的重新加载
 */
-(void)reloadData;
@end
