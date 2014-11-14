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


@interface BTTestAController ()

@property (nonatomic , weak) UIButton * testButtonAdd;

@property (nonatomic , weak) UIButton * testButtonRemove;

@property (nonatomic , weak) UIViewController * testViewController;

@end

@implementation BTTestAController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = BTRandomColor;
    
    UIButton * buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonAdd setTitle:@"添加控制器" forState:UIControlStateNormal];
    buttonAdd.backgroundColor = BTRandomColor;
    
    UIButton * buttonRemove = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRemove setTitle:@"隐藏控制器" forState:UIControlStateNormal];
    buttonRemove.backgroundColor = BTRandomColor;
    
    self.testButtonAdd = buttonAdd;
    self.testButtonRemove = buttonRemove;
    
    [self.testButtonAdd addTarget:self action:@selector(clickAddButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.testButtonRemove addTarget:self action:@selector(clickRemoveButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonAdd];
    [self.view addSubview:buttonRemove];
    
    
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (self.testButtonAdd && self.testButtonRemove)
    
    {
        self.testButtonAdd.bounds = CGRectMake(0, 0, 150, 30);
        self.testButtonRemove.bounds = CGRectMake(0, 0, 150, 30);
        
//        self.testButtonAdd.titleLabel.frame = self.testButtonAdd.bounds;
//        self.testButtonRemove.titleLabel.frame = self.testButtonRemove.bounds;
        
        self.testButtonAdd.center = CGPointMake(self.view.bounds.size.width * 0.5 , self.view.bounds.size.height * 0.5 - 20);
        self.testButtonRemove.center = CGPointMake(self.view.bounds.size.width * 0.5 , self.view.bounds.size.height * 0.5 + 20);
    }

}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"底部标题";
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"头部标题";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * CellID = @"cell";
    
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    
    cell.textLabel.text = @"这是测试文字.";
    
    return cell;
}

- (void)clickAddButton : (UIButton *)button
{
    //NSLog(@"点击了增加按钮");
    BTTestAController * testVC = [[BTTestAController alloc] init];
    
    int num = arc4random_uniform(4);
    
    
    [self showTFModalViewControllerWithController:testVC AndShowScale:0.9 AndShowDirection:(TFModalViewControllerShowDirection)num WithShowCompletionBlock:^{
        //NSLog(@"界面显示完成!");
        self.testViewController = testVC;
        
        //NSLog(@"--%@",NSStringFromCGRect(self.testViewController.view.frame));
        
    }];
    
}


- (void)clickRemoveButton : (UIButton *)button
{
    //NSLog(@"点击了隐藏按钮");

    
    [self hiddenTFModalViewControllerWithHiddenCompletionBlock:^{
        //NSLog(@"界面隐藏完成!");

    }];
    
}



- (void)dealloc
{
//    NSLog(@"[%s--第%d行]--[测试界面A被销毁了.]--%@",__func__,__LINE__,self);

}


@end
