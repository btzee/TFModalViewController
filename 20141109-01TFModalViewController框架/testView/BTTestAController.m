//
//  BTTestAController.m
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//

#import "BTTestAController.h"

#import "UIColor+BTTools.h"

@implementation BTTestAController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = BTRandomColor;


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    UIButton * testButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    testButton.center = self.view.center;
    
    [testButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testButton];

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[%s--第%d行]--[测试界面A被点击]",__func__,__LINE__);

}


- (void)clickButton : (UIButton *)button
{

    NSLog(@"[%s--第%d行]--[]",__func__,__LINE__);
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"[%s--第%d行]--[界面完成了隐藏]",__func__,__LINE__);
    }];
}


- (void)dealloc
{
    NSLog(@"[%s--第%d行]--[测试界面A被销毁了.]--%@",__func__,__LINE__,self);

}


@end
