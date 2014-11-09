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

    UIView * testView = [[UIView alloc] init];
    testView.backgroundColor = BTRandomColor;
    
    
    
    self.animei = [[TFModalContentView alloc] initWithVisibleView:testView AndScale:0.5 AndDirection:TFModalViewControllerShowDirectionFromRight];
    self.animei.backgroundColor = BTRandomColor;
    self.animei.frame = CGRectMake(50, 50, 200, 200);
    [self.view addSubview:self.animei];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    static int i = 0;
    
    if (i  == 0)
    {
        [self.animei showAnimationInWithCompletionBlock:^{
//            NSLog(@"[%s--第%d行]--[动画显示完成]",__func__,__LINE__);
        }];
    }
    else
    {
        [self.animei showAnimationOutWithCompletionBlock:^{
//            NSLog(@"[%s--第%d行]--[动画隐藏完成]",__func__,__LINE__);
        }];
    }
    
    i++;
    
//    NSLog(@"[%s--第%d行]--[点击了主界面]",__func__,__LINE__);
//    
//    UITableViewController * tab = [[UITableViewController alloc] init];
//    tab.view.backgroundColor = [UIColor redColor];
//    
//    [self showTFModalViewControllerWithController:tab AndShowScale:0.5];
//    
//    NSLog(@"%@",NSStringFromCGRect(tab.view.frame));
    


//    BTTestAController * testAVC = [[BTTestAController alloc] init];
//    testAVC.view.backgroundColor = BTRandomColor;
//    
//    //[self showViewController:testAVC sender:nil];
//
//    //[self showDetailViewController:testAVC sender:nil];
//   [self presentViewController:testAVC animated:YES completion:^{
//        NSLog(@"[%s--第%d行]--[完成弹出%@]",__func__,__LINE__,testAVC);
//    }];
}


@end
