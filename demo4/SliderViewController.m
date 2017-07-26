//
//  SliderViewController.m
//  demo4
//
//  Created by test on 2017/7/18.
//  Copyright © 2017年 test. All rights reserved.
//

#import "SliderViewController.h"
#import "masonry.h"
@interface SliderViewController()<UITextViewDelegate>
//定义一个进度条属性
@property(retain,nonatomic) UIProgressView * progressView;

//定义滑动条属性
@property(retain,nonatomic) UISlider * slider;
@end

@implementation SliderViewController
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
    // Do any additional setup after loading the view, typically from a nib.
    
    //进度条的创建
    _progressView =[[UIProgressView alloc]init];
    
    //进度条的位置大小设置
    //进度条的高度是不可以变化的，这里的40是不起任何作用的系统默认
    _progressView.frame=CGRectMake(10, 100, 300, 340);
    
    //设置进度条的风格颜色值，默认是蓝色的
    _progressView.progressTintColor=[UIColor redColor];
    
    //表示进度条未完成的，剩余的轨迹颜色,默认是灰色
    _progressView.trackTintColor =[UIColor blueColor];
    
    //设置进度条的进度值
    //范围从0~1，最小值为0，最大值为1.
    //0.8-->进度的80%
    _progressView.progress=0.3;
    
    //设置进度条的风格特征
    //    _progressView.progressViewStyle=UIProgressViewStyleBar;
    _progressView.progressViewStyle=UIProgressViewStyleDefault;
    
    [self.view addSubview:_progressView];
    
    
    //创建滑动条对象
    _slider = [[UISlider alloc]init];
    
    //位置设置，高度不可变更，40写的不起作用，系统默认
    _slider.frame =CGRectMake(10, 200, 300, 40);
    
    //设置滑动条最大值
    _slider.maximumValue=100;
    
    //设置滑动条的最小值，可以为负值
    _slider.minimumValue=0;
    
    //设置滑动条的滑块位置float值
    _slider.value=30;
    
    //左侧滑条背景颜色
    _slider.minimumTrackTintColor=[UIColor redColor];
    
    //右侧滑条背景颜色
    _slider.maximumTrackTintColor=[UIColor blueColor];
    
    //设置滑块的颜色
    _slider.thumbTintColor=[UIColor blackColor];
    
    //对滑动条添加事件函数
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_slider];
}
- (void) pressSlider{
    NSLog(@"value=%f",_slider.value);
    _progressView.progress=(_slider.value-_slider.minimumValue)/(_slider.maximumValue-
                                                                 _slider.minimumValue);
}
@end
