//
//  AbstractRoad.h
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/25.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractCar.h"

@interface AbstractRoad : NSObject

@property (nonatomic,strong)AbstractCar *car;


/**
 抽象的方法
 */
- (void)run;

@end
