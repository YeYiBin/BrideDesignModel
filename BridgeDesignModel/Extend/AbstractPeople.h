//
//  AbstractPeople.h
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/25.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractRoad.h"

@interface AbstractPeople : NSObject

@property (nonatomic,strong)AbstractRoad *road;

- (void)peopleRun;

@end
