//
//  TFModalViewControllerPublic.h
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//

#ifndef _0141109_01TFModalViewController___TFModalViewControllerPublic_h
#define _0141109_01TFModalViewController___TFModalViewControllerPublic_h

/** 界面隐藏完全后的回调block */
typedef void(^TFModalViewControllerHiddenCompletionBlock)(void);

/** 界面显示完成后的回调block */
typedef void(^TFModalViewControllerShowCompletionBlock)(void);


/** 界面进入视野的方向 */
typedef enum {
    
    TFModalViewControllerShowDirectionFromRight = 0 ,   //默认从右边进入
    TFModalViewControllerShowDirectionFromLeft,     
    TFModalViewControllerShowDirectionFromTop,
    TFModalViewControllerShowDirectionFromBottom
    
}TFModalViewControllerShowDirection;




#endif
