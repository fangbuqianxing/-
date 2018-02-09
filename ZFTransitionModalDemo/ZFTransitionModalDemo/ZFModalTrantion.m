//
//  ZFModalTrantion.m
//  ZFTransitionModalDemo
//
//  路漫漫其修远兮 吾将上下而求索
//  Created by 张玉飞 on 2018/2/8  上午11:09.
//  Copyright © 2018年 tataufo. All rights reserved.
//


#import "ZFModalTrantion.h"
#import "AnimationController.h"

@implementation ZFModalTrantion

+ (instancetype)sharedModalTrantion {
    
    static ZFModalTrantion *modalTrantion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modalTrantion = [[ZFModalTrantion alloc] init];
    });
    return modalTrantion;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    [AnimationController sharedTransitionAnimation].reverse = NO;
    
    return [AnimationController sharedTransitionAnimation];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    [AnimationController sharedTransitionAnimation].reverse = YES;
    
    return [AnimationController sharedTransitionAnimation];
}


- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    
    if (_interaction) {
        return self.interactionController;
    }
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    
    if (_interaction) {
        return self.interactionController;
    }
    return nil;
}

//- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
//
//    UIPresentationController *present = [[UIPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
//
//    return present;
//}

- (UIPercentDrivenInteractiveTransition *)interactionController {
    if (_interactionController == nil) {
        _interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return _interactionController;
}

@end
