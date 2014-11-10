//
//  BTTestAController.m
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//

#import "BTTestAController.h"

#import "UIColor+BTTools.h"

#import "UIViewController+TFModalView.h"
@implementation BTTestAController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = BTRandomColor;


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton * testButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    testButton.center = self.view.center;
    
    [testButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];

}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hiddenTFModalViewController];

}


- (void)clickButton : (UIButton *)button
{
    
    BTTestAController * test = [[BTTestAController alloc] init];
    test.view.backgroundColor = BTRandomColor;
    
    [self showTFModalViewControllerWithController:test AndShowScale:1.0 WithShowCompletionBlock:^{
        NSLog(@"--测试界面显示了");
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [test hiddenTFModalViewControllerWithHiddenCompletionBlock:^{
            NSLog(@"--测试界面隐藏了");
        }];
    });
}


- (void)dealloc
{
    NSLog(@"[%s--第%d行]--[测试界面A被销毁了.]--%@",__func__,__LINE__,self);

}


@end
