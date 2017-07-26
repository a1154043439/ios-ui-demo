//
//  SwitchViewController.m
//  demo4
//
//  Created by test on 2017/7/18.
//  Copyright © 2017年 test. All rights reserved.
//
#import "SwitchViewController.h"
#import "masonry.h"
@interface SwitchViewController()<UITextViewDelegate>
@property(retain,nonatomic) UISwitch * mySwitch;
@property(retain,nonatomic) UISwitch * mySwitch1;
@end

@implementation SwitchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置导航栏
    [self _setupNavigationItem];
    
    
    // 设置子控件
    [self _setupSubViews];
}


#pragma mark - 设置导航栏
- (void)_setupNavigationItem
{
    self.title = @"SliderDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    
    //创建一个开关对象
    //继承于UIView的
    _mySwitch = [[UISwitch alloc]init];
    _mySwitch1 = [[UISwitch alloc]init];
    
    //苹果官方的控件的位置设置
    //位置X,Y的值可以改变（100，100）
    //宽度和高度值无法改变(80,40)写了也没有用的，不会起到作用的。默认的。
    _mySwitch.frame=CGRectMake(100, 200, 180, 40);
    
    //开关状态设置属性
    //YES:开启状态
    //NO:关闭状态
    _mySwitch.on=YES;
    
    //也可以使用set函数
    //[_mySwitch setOn:YES];
    
    //设置开关状态
    //p1:状态设置
    //p2:是否开启动画效果
    //[_mySwitch setOn:YES animated:YES];
    
    [self.view addSubview:_mySwitch];
    [self.view addSubview:_mySwitch1];
    
    //设置开启状态的风格颜色
    [_mySwitch setOnTintColor:[UIColor orangeColor]];
    
    //设置开关圆按钮的风格颜色
    [_mySwitch setThumbTintColor:[UIColor blueColor]];
    
    //设置整体风格颜色,按钮的白色是整个父布局的背景颜色
    [_mySwitch setTintColor:[UIColor blackColor]];
    [self.mySwitch  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.view.mas_centerY);
        make.left.equalTo(self.view.mas_left).with.offset(30);
      
        
    } ];
    
    [self.mySwitch1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.left.equalTo(self.mySwitch.mas_right).with.offset(30);
    }];
    
    //向开关控件添加事件函数
    //p1:函数实现对象
    //p2:函数对象
    //p3:事件响应时的事件类型UIControlEventValueChanged状态发生变化时触发函数
    [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
    
    
}

//参数传入开关对象本身
- (void) swChange:(UISwitch*) sw{
    
    if(sw.on==YES){
        NSLog(@"开关被打开");
        self.mySwitch1.on = YES;
    }else{
        NSLog(@"开关被关闭");
         self.mySwitch1.on = NO;
    }
}


@end
