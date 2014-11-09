//
//  UIViewController+TFModalView.h
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFModalViewControllerPublic.h"



@interface UIViewController (TFModalView)

/** 弹出一个控制器在当前的控制器之上. (默认从右侧动画形式进入 , 显示的view的size为调用者view同等size) */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller;

/**
 *  弹出一个控制器在当前的控制器之上. (默认从右侧动画形式进入 , 显示的view的宽度为调用者view的宽度 * scale参数) [scale取值为0~1]
 *
 *  @param controller 要显示的控制器
 *  @param scale      显示比例 , 取值范围 (0.0~1.0] ,超出范围的值会以默认值0.75的比例显示.
 */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller AndShowScale : (CGFloat)scale;

/**
 *  弹出一个控制器在当前的控制器之上. [scale : 弹出的比例]-[direction : 弹出的方向]
 *
 *  @param controller 要显示的控制器
 *  @param scale      显示比例 , 取值范围 (0.0~1.0] ,超出范围的值会以默认值0.75的比例显示.
 *  @param direction  弹出方向 , 见枚举值TFModalViewControllerShowDirection
 */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller AndShowScale : (CGFloat)scale AndShowDirection : (TFModalViewControllerShowDirection)direction;


/** 隐藏弹出的控制器 , 当界面完全隐藏之后执行block内的代码 */
- (void)hiddenTFModalViewControllerWithHiddenCompletionBlock : (TFModalViewControllerHiddenCompletionBlock)completionBlock;

/** 隐藏弹出的控制器 */
- (void)hiddenTFModalViewController;



@end
