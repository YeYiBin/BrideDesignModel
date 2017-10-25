//
//  ViewController.m
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/24.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import "ViewController.h"
#import "AbstractRemoteControl.h"
#import "ConcreteRemoteControl.h"
#import "TVProtocol.h"
#import "AbstractTV.h"
#import "TVA.h"
#import "TVB.h"
#import "CarStreet.h"
#import "BusStreet.h"

#import "ConcreteSpeedWay.h"
#import "AbstractRoad.h"
#import "ConcreateCar.h"
#import "ConcreateBus.h"


//
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self badExample];
    NSLog(@"****************************");
    //
    [self solveBadExample];
    //
//    [self showBridgeModel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----  坏的案例

/*
   其实反过来  如果我们以 Car 为例 分出 bus autoCar  又分出在 高速公路 上的 bus 和 autoCar  和 在街道上的  bus 和 autoCar
   和我们以 Road 为例 通过继承 分出的是类似的
   现在的问题是：
   但是我们说这样的设计是脆弱的，仔细分析就可以发现，它还是存在很多问题，首先它在遵循开放-封闭原则的同时，违背了类的单一职责原则，即一个类只有一个引起它变化的原因，而这里引起变化的原因却有两个，即路类型的变化和汽车类型的变化；其次是重复代码会很多，不同的汽车在不同的路上行驶也会有一部分的代码是相同的；再次是类的结构过于复杂，继承关系太多，难于维护，最后最致命的一点是扩展性太差。如果变化沿着汽车的类型和不同的道路两个方向变化，我们会看到这个类的结构会迅速的变庞大。
   比如 有 10 种道路 和 10 种类型的车 那么有 10*10 = 100 个具体的类
 */
- (void)badExample
{
    //
    CarStreet *carStreet = [[CarStreet alloc] init];
    [carStreet run];
    
    //
    BusStreet *busStreet = [[BusStreet alloc] init];
    [busStreet run];
    
}


#pragma mark ---- 解决坏案例的方式

- (void)solveBadExample
{
    AbstractRoad *road1 = [[ConcreteSpeedWay alloc] init];
    road1.car = [[ConcreateCar alloc] init];
    [road1 run];
    
    AbstractRoad *road2 = [[ConcreteSpeedWay alloc] init];
    road2.car = [[ConcreateBus alloc] init];
    [road2 run];
}


#pragma mark ----  展示 桥接设计模式
- (void)showBridgeModel
{
    AbstractRemoteControl *remoteControl = [[ConcreteRemoteControl alloc] init];
    id<TVProtocol> tvProtocol = [[TVA alloc] init];
    remoteControl.tvProtocol = tvProtocol;
    [remoteControl detectTVFunction];
    NSLog(@"/////////////////////////////////////");
    
    tvProtocol = [[TVB alloc] init];
    remoteControl.tvProtocol = tvProtocol;
    [remoteControl detectTVFunction];
    
    /**
     *  桥接模式：将抽象部分与它的实现部分分离，使它们都可以独立地变化。
     *  在本例中，AbstractRemoteControl是抽象部分，TVProtocol是其实现部分。
     */
    
    /*
     桥接模式：
     通过桥接模式的应用，我们可以把抽象部分与实现部分分离，使它们都可以独立的变化。比如在本例中，对AbstractRemoteControl的修改，不会影响到TVProtocol。同样对TVProtocol的修改，也不会影响AbstractRemoteControl。这正是桥接模式带给我们的便利性。
     */
}








@end
