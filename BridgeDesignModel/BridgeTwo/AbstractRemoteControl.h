//
//  AbstractRemoteControl.h
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/24.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVProtocol.h"

@interface AbstractRemoteControl : NSObject

@property (nonatomic,weak) id<TVProtocol> tvProtocol;

- (void)detectTVFunction;

@end
