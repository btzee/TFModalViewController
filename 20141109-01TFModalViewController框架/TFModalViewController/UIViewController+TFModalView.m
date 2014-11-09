//
//  UIViewController+TFModalView.m
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//

#import "UIViewController+TFModalView.h"

#import "TFModalViewController.h"


@interface UIViewController ()<TFModalViewControllerDelegate>

@end


@implementation UIViewController (TFModalView)


#pragma mark - 外部调用方法

///** 弹出一个控制器在当前的控制器之上. */
//- (void)showTFModalViewControllerWithController : (UIViewController *)controller
//{
//    
//    TFModalViewController * mVC = [[TFModalViewController alloc] init];
//    mVC.TFdelegate = self;
//    [self addChildViewController:mVC];
//    
//    [self.view addSubview:mVC.view];
//
//}


/** 弹出一个控制器在当前的控制器之上. (默认从右侧动画形式进入 , 显示的view的size为调用者view同等size) */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller
{
    [self showTFModalViewControllerWithController:controller AndShowScale:1.0];
}


/**
 *  弹出一个控制器在当前的控制器之上. (默认从右侧动画形式进入 , 显示的view的宽度为调用者view的宽度 * scale参数) [scale取值为0~1]
 *
 *  @param controller 要显示的控制器
 *  @param scale      显示比例 , 取值范围 (0.0~1.0] ,超出范围的值会以默认值0.75的比例显示.
 */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller AndShowScale : (CGFloat)scale
{
    [self showTFModalViewControllerWithController:controller AndShowScale:scale AndShowDirection:TFModalViewControllerShowDirectionFromRight];
}

/**
 *  弹出一个控制器在当前的控制器之上. [scale : 弹出的比例]-[direction : 弹出的方向]
 *
 *  @param controller 要显示的控制器
 *  @param scale      显示比例 , 取值范围 (0.0~1.0] ,超出范围的值会以默认值0.75的比例显示.
 *  @param direction  弹出方向 , 见枚举值TFModalViewControllerShowDirection
 */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller AndShowScale : (CGFloat)scale AndShowDirection : (TFModalViewControllerShowDirection)direction
{
    TFModalViewController * modalVC = [TFModalViewController sharedModalViewController];
    [modalVC showModalViewWithController:controller AndShowScale:scale AndShowDirection:direction FromSuperViewController:self];
    
}


/** 隐藏弹出的控制器 , 当界面完全隐藏之后执行block内的代码 */
- (void)hiddenTFModalViewControllerWithHiddenCompletionBlock : (TFModalViewControllerHiddenCompletionBlock)completionBlock
{


}

/** 隐藏弹出的控制器 */
- (void)hiddenTFModalViewController
{
    [self hiddenTFModalViewControllerWithHiddenCompletionBlock:nil];
}




#pragma mark - TFModalViewControllerDelegate 代理方法

/** 代理方法 : 当modalViewController隐藏了以后 , 销毁modalViewController */
- (void)TFModalViewControllerDidDisappear:(TFModalViewController *)modalViewController
{

    NSLog(@"[%s--第%d行]--[代理方法:%@隐藏了]",__func__,__LINE__,modalViewController);

    NSLog(@"删除前:%@",self.childViewControllers);
    
    if (modalViewController.view && modalViewController.view.superview)
        [modalViewController.view removeFromSuperview];
    if (modalViewController)
        [modalViewController removeFromParentViewController];
    
    NSLog(@"删除后:%@",self.childViewControllers);
    

}



@end
