//
//  ViewController.m
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//

#import "ViewController.h"
#import "TFModalContentView.h"


#import "BTTestAController.h"
#import "UIColor+BTTools.h"
#import "UIViewController+TFModalView.h"

@interface ViewController ()


@property (nonatomic , strong) TFModalContentView * animei;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BTTestAController * testVC = [[BTTestAController alloc] init];
    
    [self addChildViewController:testVC];
    
    //testVC.view.frame = CGRectMake(50, 50, 300, 600);
    testVC.view.backgroundColor = BTRandomColor;
    [self.view addSubview:testVC.view];
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"[%s--第%d行]--[点击了主界面]",__func__,__LINE__);
    
//    BTTestAController * tab = [[BTTestAController alloc] init];
//    tab.view.backgroundColor = [UIColor redColor];
//    
//    [self showTFModalViewControllerWithController:tab AndShowScale:1 AndShowDirection:TFModalViewControllerShowDirectionFromLeft WithShowCompletionBlock:^{
//        NSLog(@"界面展示成功!");
//    }];

}


@end
