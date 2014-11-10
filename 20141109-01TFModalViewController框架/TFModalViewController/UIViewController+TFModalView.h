//
//  UIViewController+TFModalView.h
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//


/*========================== 以下为 TFModalViewController框架 使用说明 ==========================

    使用说明 :
 
        1. 本框架实现的功能为以动画形式展现一个控制器到屏幕界面上. 可以控制新界面进入屏幕的方向及显示比例.具体见方法说明.
 
        2. 基础方法示例:
            显示一个新控制器 : [self showTFModalViewControllerWithController:newController WithShowCompletionBlock:nil]
            隐藏之前由本框架方法展示出来的控制器 : [self hiddenTFModalViewController]
 
        3. 要展示的控制器默认都是添加到调用者的控制器之上 . 
 
        4. 后续会添加show到window上的方法. 敬请关注.
 
 

                                            --- 佰通 . 2014.11.11

========================== 以上为 TFModalViewController框架 使用说明 ==========================*/



#import <UIKit/UIKit.h>
#import "TFModalViewControllerPublic.h"



@interface UIViewController (TFModalView)

/** 弹出一个控制器在当前的控制器之上. (默认从右侧动画形式进入 , 显示的view的size为调用者view同等size) 
 *  @param completionBlock     界面显示完成后调用的block
 */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller WithShowCompletionBlock : (TFModalViewControllerShowCompletionBlock)completionBlock;


/**
 *  弹出一个控制器在当前的控制器之上. (默认从右侧动画形式进入 , 显示的view的宽度为调用者view的宽度 * scale参数) [scale取值为0~1]
 *
 *  @param controller 要显示的控制器
 *  @param scale      显示比例 , 取值范围 (0.0~1.0] ,超出范围的值会以默认值0.75的比例显示.
 *  @param completionBlock     界面显示完成后调用的block
 */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller AndShowScale : (CGFloat)scale WithShowCompletionBlock : (TFModalViewControllerShowCompletionBlock)completionBlock;

/**
 *  弹出一个控制器在当前的控制器之上. [scale : 弹出的比例]-[direction : 弹出的方向]
 *
 *  @param controller 要显示的控制器
 *  @param scale      显示比例 , 取值范围 (0.0~1.0] ,超出范围的值会以默认值0.75的比例显示.
 *  @param direction  弹出方向 , 见枚举值TFModalViewControllerShowDirection
 *  @param completionBlock     界面显示完成后调用的block
 */
- (void)showTFModalViewControllerWithController : (UIViewController *)controller AndShowScale : (CGFloat)scale AndShowDirection : (TFModalViewControllerShowDirection)direction WithShowCompletionBlock : (TFModalViewControllerShowCompletionBlock)completionBlock;


/** 隐藏弹出的控制器 , 当界面完全隐藏之后执行block内的代码 */
- (void)hiddenTFModalViewControllerWithHiddenCompletionBlock : (TFModalViewControllerHiddenCompletionBlock)completionBlock;

/** 隐藏弹出的控制器 */
- (void)hiddenTFModalViewController;



@end
