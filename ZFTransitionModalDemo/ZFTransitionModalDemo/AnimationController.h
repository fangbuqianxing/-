//
//  AnimationController.h
//  ZFTransitionDemo
//
//  路漫漫其修远兮 吾将上下而求索
//  Created by 张玉飞 on 2018/2/7  下午3:40.
//  Copyright © 2018年 tataufo. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationController : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) NSTimeInterval duration;

/**
 The direction of the animation.
 */
@property (nonatomic, assign) BOOL reverse;

+ (instancetype)sharedTransitionAnimation;

@end
