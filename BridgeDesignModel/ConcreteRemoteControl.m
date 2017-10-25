//
//  ConcreteRemoteControl.m
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/24.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import "ConcreteRemoteControl.h"

@implementation ConcreteRemoteControl


/**
 检测 TV 的功能
 */
- (void)detectTVFunction
{
    [self.tvProtocol switchChannel];
    [self.tvProtocol adjustVolume];
    [self.tvProtocol powerSwitch];
}

@end
