//
//  ZFModalTrantion.h
//  ZFTransitionModalDemo
//
//  路漫漫其修远兮 吾将上下而求索
//  Created by 张玉飞 on 2018/2/8  上午11:09.
//  Copyright © 2018年 tataufo. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZFModalTrantion : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) BOOL interaction;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;

+ (instancetype)sharedModalTrantion;

@end
