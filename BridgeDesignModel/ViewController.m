//
//  ViewController.m
//  BridgeDesignModel
//
//  Created by meitianhui2 on 2017/10/24.
//  Copyright © 2017年 DeLongYang. All rights reserved.
//

#import "ViewController.h"
#import "CarStreet.h"
#import "BusStreet.h"
#import "ConcreteSpeedWay.h"
#import "AbstractRoad.h"
#import "ConcreateCar.h"
#import "ConcreateBus.h"
#import "Man.h"
#import "Women.h"

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
    [self extendPeople];
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
/*
 可以看到，通过对象组合的方式，Bridge 模式把两个角色之间的继承关系改为了耦合的关系，从而使这两者可以从容自若的各自独立的变化，这也是Bridge模式的本意。
 这样增加了客户程序与路与汽车的耦合。其实这样的担心是没有必要的，因为这种耦合性是由于对象的创建所带来的，完全可以用创建型模式去解决。在应用时结合创建型设计模式来处理具体的问题。
 关键的代码是 AbstractRoad 里有个 AbstractCar 这样的对应关系
 可以看出来 如果 Road  和 Car 是 需要的类的总数 是 N+M 的关系 而坏的例子中是 N*M 的类的总数
 */
- (void)solveBadExample
{
    AbstractRoad *road1 = [[ConcreteSpeedWay alloc] init];
    road1.car = [[ConcreateCar alloc] init];
    [road1 run];
    
    AbstractRoad *road2 = [[ConcreteSpeedWay alloc] init];
    road2.car = [[ConcreateBus alloc] init];
    [road2 run];
}

#pragma mark ----  进一步拓展 桥接模式
/*
 结合上面的例子,增加一个维度"人",不同的人开着不同的汽车在不同的路上行驶(三个维度);
 结合上面增加一个类"人",并重新调用.
 */
- (void)extendPeople
{
    NSLog(@"---------------------------------");
    AbstractRoad *road3 = [[ConcreteSpeedWay alloc] init];
    road3.car = [[ConcreateBus alloc] init];
    
    AbstractPeople *p = [[Man alloc] init];
    p.road = road3;
    [p peopleRun];
    
    AbstractPeople *p2 = [[Women alloc] init];
    p2.road = road3;
    [p2 peopleRun];
    
}








@end
