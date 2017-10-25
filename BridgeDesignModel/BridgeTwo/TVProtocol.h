//
//  TVProtocol.h
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/24.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TVProtocol <NSObject>

 @required

- (void)switchChannel;

- (void)adjustVolume;

- (void)powerSwitch;

@end
