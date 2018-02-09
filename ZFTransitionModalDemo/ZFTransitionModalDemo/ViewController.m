//
//  ViewController.m
//  ZFTransitionModalDemo
//
//  路漫漫其修远兮 吾将上下而求索
//  Created by 张玉飞 on 2018/2/8  上午10:30.
//  Copyright © 2018年 tataufo. All rights reserved.
//


#import "ViewController.h"
#import "ZFModalTrantion.h"
#import "UIViewController+InteractiveTransition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(170, 457, 50, 44)];
    button1.layer.cornerRadius = 0;
    button1.layer.masksToBounds = YES;
    button1.titleLabel.font = [UIFont systemFontOfSize:14];
    [button1 setTitle:@"present" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget: self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(230, 457, 50, 44)];
    button.layer.cornerRadius = 0;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget: self action:@selector(dismissClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonClick:(UIButton *)button {
    ViewController *vc = [[ViewController alloc] init];
//    vc.transitioningDelegate = [ZFModalTrantion sharedModalTrantion];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dismissClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
