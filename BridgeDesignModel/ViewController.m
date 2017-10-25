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

//
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showBridgeModel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
