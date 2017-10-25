//
//  AbstractTV.m
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/24.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import "AbstractTV.h"

@implementation AbstractTV

- (void)switchChannel
{
    NSLog(@"切换频道,由具体的子类来实现");
}


- (void)adjustVolume
{
    NSLog(@"调节音量,由具体的子类来实现");
}

- (void)powerSwitch
{
    NSLog(@"电源开关,由具体的子类来实现");
}

@end
