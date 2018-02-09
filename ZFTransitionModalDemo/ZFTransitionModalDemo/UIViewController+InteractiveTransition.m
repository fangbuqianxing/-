//
//  UIViewController+InteractiveTransition.m
//  ZFTransitionModalDemo
//
//  路漫漫其修远兮 吾将上下而求索
//  Created by 张玉飞 on 2018/2/8  下午12:50.
//  Copyright © 2018年 tataufo. All rights reserved.
//


#import "UIViewController+InteractiveTransition.h"
#import <objc/runtime.h>
#import "ZFModalTrantion.h"

//static char    ZFPanGesture;
//static CGPoint ZFStartPoint;
//static CGPoint ZFEndPoint;
static BOOL    ZFShouldCompleteTransition;

const NSString *ZFVerticalSwipeGestureKey = @"ZFVerticalSwipeGestureKey";

@implementation UIViewController (InteractiveTransition)

- (void)viewDidLoad {
    
    UIPanGestureRecognizer *gesture = objc_getAssociatedObject(self.view, (__bridge const void *)(ZFVerticalSwipeGestureKey));
    if (gesture) { [self.view removeGestureRecognizer:gesture];}
    gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ZFPanGestureRecognizerHandle:)];
    [self.view addGestureRecognizer:gesture];
    objc_setAssociatedObject(self.view, (__bridge const void *)(ZFVerticalSwipeGestureKey), gesture,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)ZFPanGestureRecognizerHandle:(UIPanGestureRecognizer *)pan {
    
    CGPoint translation = [pan translationInView:pan.view.superview];
    
    NSLog(@"==%zd====%@======", pan.state, NSStringFromCGPoint(translation));
    switch (pan.state) {
        case UIGestureRecognizerStateBegan: {
            
            BOOL topToBottomSwipe = translation.y > 0;
            
            // perform the required navigation operation ...
            
            // for pop operation, fire on top-to-bottom
            if (topToBottomSwipe) {
                
                [ZFModalTrantion sharedModalTrantion].interaction = YES;
                self.transitioningDelegate = [ZFModalTrantion sharedModalTrantion];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            if ([ZFModalTrantion sharedModalTrantion].interaction ) {
                // compute the current position
                CGFloat fraction = fabs(fmaxf(translation.y, 0.0) / pan.view.superview.bounds.size.height);
                fraction = fminf(fmaxf(fraction, 0.0), 1.0);
                ZFShouldCompleteTransition = (fraction > 0.3);
                
                NSLog(@"======%f======", fraction);
                // if an interactive transitions is 100% completed via the user interaction, for some reason
                // the animation completion block is not called, and hence the transition is not completed.
                // This glorious hack makes sure that this doesn't happen.
                // see: https://github.com/ColinEberhardt/VCTransitionsLibrary/issues/4
                if (fraction >= 1.0)
                    fraction = 0.99;
                [[ZFModalTrantion sharedModalTrantion].interactionController updateInteractiveTransition:fraction];
                
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            if ([ZFModalTrantion sharedModalTrantion].interaction) {
                [ZFModalTrantion sharedModalTrantion].interaction = YES;
                if (!ZFShouldCompleteTransition || pan.state == UIGestureRecognizerStateCancelled) {
                    
                    [[ZFModalTrantion sharedModalTrantion].interactionController cancelInteractiveTransition];
                }
                else {
                    [[ZFModalTrantion sharedModalTrantion].interactionController finishInteractiveTransition];
                }
                NSLog(@"%s",__func__);
            }
            break;
        default:
            break;
    }
}

//- (void)setPanGesture:(UIPanGestureRecognizer *)panGesture {
//    [self willChangeValueForKey:@"panGesture"];
//    objc_setAssociatedObject(self, &ZFPanGesture, panGesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    [self didChangeValueForKey:@"panGesture"];
//
//}
//- (UIPanGestureRecognizer *)panGesture {
//    return objc_getAssociatedObject(self, &ZFPanGesture);
//}

//- (void)setStartPoint:(CGPoint)startPoint {
//    [self willChangeValueForKey:@"startPoint"];
//
//    objc_setAssociatedObject(self, &ZFStartPoint, NSStringFromCGPoint(startPoint), OBJC_ASSOCIATION_COPY_NONATOMIC);
//    [self didChangeValueForKey:@"startPoint"];
//}
//- (CGPoint)startPoint {
//    return CGPointFromString(objc_getAssociatedObject(self, &ZFStartPoint));
//}
//
//- (void)setEndPoint:(CGPoint)endPoint {
//    [self willChangeValueForKey:@"endPoint"];
//
//    objc_setAssociatedObject(self, &ZFEndPoint, NSStringFromCGPoint(endPoint), OBJC_ASSOCIATION_COPY_NONATOMIC);
//    [self didChangeValueForKey:@"endPoint"];
//}
//- (CGPoint)endPoint {
//    return CGPointFromString(objc_getAssociatedObject(self, &ZFEndPoint));
//}

- (void)dealloc {
    NSLog(@"%s",__func__);
}
@end
