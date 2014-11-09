//
//  TFModalViewController.m
//  20141109-01TFModalViewController框架
//
//  Created by btz-mac on 14-11-9.
//  Copyright (c) 2014年 朱佰通. All rights reserved.
//

#import "TFModalViewController.h"

#define ModalView_Background_Alpha 0.7
#define ModalView_ShowScale_Default 0.75


@interface TFModalViewController ()

@property (nonatomic , weak) UIViewController * test;

@end

@implementation TFModalViewController


#pragma 初始化 - 单例 模式

static TFModalViewController * _instance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });

    return _instance;
}

+ (instancetype)sharedModalViewController
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}


- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}


#pragma mark - 初始化 方法

- (instancetype)init
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
        
        if (_instance)
        {
            NSLog(@"[%s--第%d行]--[view :%@]",__func__,__LINE__,_instance.view);
            _instance.view.backgroundColor = [UIColor darkGrayColor];
            _instance.view.alpha = ModalView_Background_Alpha;
            
        }
    });

    return _instance;
}


#pragma mark - 界面加载方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = BTRandomColor;
 
    
}


#pragma mark - 外部调用方法


/**
 *  弹出一个控制器在当前的控制器之上. [scale : 弹出的比例]-[direction : 弹出的方向]
 *
 *  @param controller 要显示的控制器
 *  @param scale      显示比例 , 取值范围 (0.0~1.0] ,超出范围的值会以默认值0.75的比例显示.
 *  @param direction  弹出方向 , 见枚举值TFModalViewControllerShowDirection
 *  @param superViewController  需要弹出界面的父级控制器
 */
- (void)showModalViewWithController : (UIViewController *)controller AndShowScale : (CGFloat)scale AndShowDirection : (TFModalViewControllerShowDirection)direction FromSuperViewController : (UIViewController *)superViewController
{

    /** 参数边界值判断 */
    if (scale <=0 || scale > 1 )
        scale = ModalView_ShowScale_Default;
    
    /** 判断传入的控制器 */
    if (controller == nil || !([controller isKindOfClass:[UIViewController class]]))
    {
        NSLog(@"[%s--第%d行]--[错误:传入的控制器不能为空或不是控制器类型!]",__func__,__LINE__);
        return;
    }
    
    
    if (self.childViewControllers.count < 1)
    {
        /** 将本控制器遮板显示到调用的第一级控制器上 */
        self.view.frame = superViewController.view.bounds;
        [superViewController addChildViewController:self];
        [superViewController.view addSubview:self.view];
        
        /** 将要显示的控制器添加到本控制器上 */
        
        CGFloat width = self.view.bounds.size.width * scale;
        CGFloat height = self.view.bounds.size.height;
        CGFloat x = self.view.bounds.size.width - width;
        CGFloat y = 0;
        
        controller.view.frame = CGRectMake(x, y, width, height);
        
        [self addChildViewController:controller];
        [self.view addSubview:controller.view];
        
    }
    


}





- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"[%s--第%d行]--[弹出的控制器view不显示了]",__func__,__LINE__);

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[%s--第%d行]--[点击了弹出控制器]",__func__,__LINE__);

    
    self.view.alpha = 0.0;
    
    [UIView animateWithDuration:1 animations:^{
        
        self.view.alpha = ModalView_Background_Alpha;
    } completion:^(BOOL finished) {
        
        //self.view.hidden = YES;
        if ([self.TFdelegate respondsToSelector:@selector(TFModalViewControllerDidDisappear:)])
        {
            [self.TFdelegate TFModalViewControllerDidDisappear:self];
        }
        
    }];
    

    
    
}



@end
