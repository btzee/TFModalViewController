//
//  TFModalContentView.m
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//



#import "TFModalContentView.h"


#define ModalView_Background_Color [UIColor darkGrayColor]
#define ModalView_Background_Alpha 0.7
#define ModalView_ShowScale_Default 0.75
/** 动画时间 */
#define Animation_Duration 0.75


@interface TFModalContentView ()

/** 遮板 */
@property (nonatomic , weak) UIView * backgroundView;

/** 要显示的view */
@property (nonatomic , weak) UIView * visibleView;

/** 要显示的view的显示比例 */
@property (nonatomic , assign) CGFloat  scale;

/** 要显示的view的入场方向 */
@property (nonatomic , assign) TFModalViewControllerShowDirection  direction;


/** 动画进行标志位 */
@property (nonatomic , assign) BOOL  animationFlag;


@end

@implementation TFModalContentView

#pragma mark - 初始化

/** 初始化方法 */
- (instancetype)initWithVisibleView : (UIView *)visibleView AndScale : (CGFloat)scale AndDirection: (TFModalViewControllerShowDirection)direction
{
    self = [super init];
    if (self)
    {
        if (scale <= 0 || scale >1)
            scale = ModalView_ShowScale_Default;
        
        if (!visibleView)
        {
            NSLog(@"[%s--第%d行]--[错误:传入的显示界面参数有误!]",__func__,__LINE__);
            return self;
        }
        
        /** 初始化蒙板 */
        [self backgroundView];
        
        [self addSubview:visibleView];
        self.visibleView = visibleView;
        self.visibleView.hidden = YES;
        
        self.scale = scale;
        self.direction = direction;
        self.backgroundColor = [UIColor clearColor];
    
    }

    return self;
}


#pragma mark - 参数懒加载

/** 遮板 */
- (UIView *)backgroundView
{
    if(_backgroundView == nil)
    {
        UIView * temp = [[UIView alloc] init];
        
        temp.backgroundColor = ModalView_Background_Color;
        temp.alpha = ModalView_Background_Alpha;
        
        [self addSubview:temp];
        _backgroundView = temp ;
    }
    
    return _backgroundView;
}


#pragma mark - Frame 计算方法


- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    /** 布局底层遮板 */
    [self layoutMyBackgroundView];

    if (!self.animationFlag)
    {
        /** 布局visibleView */
        [self layoutMyVisibleView];
    
    }

}

/** 布局底层遮板 */
- (void)layoutMyBackgroundView
{
    self.backgroundView.frame = self.bounds;
}

/** 布局visibleView */
- (void)layoutMyVisibleView
{
   
    /** 计算visibleView的size */
    CGSize size = CGSizeZero;
    
    if (self.direction == TFModalViewControllerShowDirectionFromLeft || self.direction == TFModalViewControllerShowDirectionFromRight)
    {
        CGFloat height = self.bounds.size.height;
        CGFloat width = self.bounds.size.width * self.scale;
        
        size = CGSizeMake(width, height);
    }
    else if (self.direction == TFModalViewControllerShowDirectionFromTop || self.direction == TFModalViewControllerShowDirectionFromBottom)
    {
        CGFloat height = self.bounds.size.height * self.scale;
        CGFloat width = self.bounds.size.width ;
        
        size = CGSizeMake(width, height);

    
    }
    else
    {
        NSLog(@"[%s--第%d行]--[错误:进场方向参数传入错误!]",__func__,__LINE__);
    }
    
    
    /** 计算visibleView的位置 */
    CGPoint point = CGPointZero;
    
    if (self.direction == TFModalViewControllerShowDirectionFromLeft || self.direction == TFModalViewControllerShowDirectionFromTop)
    {
        CGFloat x = 0;
        CGFloat y = 0;
        
        point = CGPointMake(x, y);
 
    }
    else if (self.direction == TFModalViewControllerShowDirectionFromBottom)
    {
        CGFloat x = 0;
        CGFloat y = self.bounds.size.height - size.height;
        
        point = CGPointMake(x, y);

        
    }
    else if (self.direction == TFModalViewControllerShowDirectionFromRight)
    {
        CGFloat x = self.bounds.size.width - size.width;
        CGFloat y = 0;
        
        point = CGPointMake(x, y);
        
        
    }
    else
    {
        NSLog(@"[%s--第%d行]--[错误:进场方向参数传入错误!]",__func__,__LINE__);
    }
    
    /** 计算visibleView的frame */
    CGRect rect = CGRectMake(point.x, point.y, size.width, size.height);
    
    self.visibleView.frame = rect;

}


#pragma mark - 外部调用方法 : 出入场动画

/** 进场显示动画 */
- (void)showAnimationInWithCompletionBlock : (TFModalContentViewAnimationCompletionBlock)completionBlock
{
    self.animationFlag = YES;
    [self setVisibleViewTransformForAnimationIn];
    
    [UIView animateWithDuration:Animation_Duration animations:^{
        
        self.visibleView.hidden = NO;
        self.visibleView.alpha = 1.0;
        self.visibleView.transform = CGAffineTransformIdentity;
        self.userInteractionEnabled = NO;
        
    } completion:^(BOOL finished) {
        
        self.animationFlag = NO;
        self.userInteractionEnabled = YES;
        if (completionBlock)
            completionBlock();
        
    }];
    
    
}

/** 出场隐藏动画 */
- (void)showAnimationOutWithCompletionBlock : (TFModalContentViewAnimationCompletionBlock)completionBlock
{
    self.animationFlag = YES;
    
    self.visibleView.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:Animation_Duration animations:^{

        self.userInteractionEnabled = NO;
        [self setVisibleViewTransformForAnimationOut];
        
    } completion:^(BOOL finished) {
        
        self.visibleView.hidden = YES;
        self.animationFlag = NO;
        self.userInteractionEnabled = YES;

        if (completionBlock)
            completionBlock();
        
       
        
    }];
    

}



#pragma mark - 内部计算方法

/** 设置visibleView的动画效果 : 进场 */
- (void)setVisibleViewTransformForAnimationIn
{
    switch (self.direction) {
        case TFModalViewControllerShowDirectionFromRight:
            
            self.visibleView.transform = CGAffineTransformMakeTranslation(self.visibleView.bounds.size.width, 0);
            
            break;
            
        case TFModalViewControllerShowDirectionFromLeft:
            self.visibleView.transform = CGAffineTransformMakeTranslation(0 - self.visibleView.bounds.size.width, 0);
            
            break;
            
        case TFModalViewControllerShowDirectionFromTop:
            self.visibleView.transform = CGAffineTransformMakeTranslation(0, 0 - self.visibleView.bounds.size.height);
            
            break;
            
        case TFModalViewControllerShowDirectionFromBottom:
            self.visibleView.transform = CGAffineTransformMakeTranslation(0, self.visibleView.bounds.size.height);
            
            break;
            
            
        default:
            
            break;
    }
}

/** 设置visibleView的动画效果 : 出场 */
- (void)setVisibleViewTransformForAnimationOut
{
    
    switch (self.direction) {
        case TFModalViewControllerShowDirectionFromRight:
            
            self.visibleView.transform = CGAffineTransformMakeTranslation(self.visibleView.bounds.size.width , 0);
            break;
            
        case TFModalViewControllerShowDirectionFromLeft:
            
            self.visibleView.transform = CGAffineTransformMakeTranslation(0 - self.visibleView.bounds.size.width, 0);
            break;
            
        case TFModalViewControllerShowDirectionFromTop:
            
            self.visibleView.transform = CGAffineTransformMakeTranslation(0, 0 - self.visibleView.bounds.size.height);
            break;
            
        case TFModalViewControllerShowDirectionFromBottom:
            
            self.visibleView.transform = CGAffineTransformMakeTranslation(0, self.visibleView.bounds.size.height);            
            break;
            
            
        default:
            
            break;
    }
}

@end




