//
//  AppDelegate.m
//  ZFTransitionModalDemo
//
//  路漫漫其修远兮 吾将上下而求索
//  Created by 张玉飞 on 2018/2/8  上午10:30.
//  Copyright © 2018年 tataufo. All rights reserved.
//


#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
