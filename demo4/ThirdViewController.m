//
//  ThirdViewController.m
//  demo4
//
//  Created by test on 2017/7/17.
//  Copyright © 2017年 test. All rights reserved.
//

#import "ThirdViewController.h"
#import "masonry.h"
@interface ThirdViewController ()
/** UILabel*/
@property (nonatomic , strong) UILabel * label1;
@property (nonatomic , strong) UILabel * label2;
@end

@implementation ThirdViewController
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
    self.title = @"labelDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    
//创建uilabel
self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(44, 44, 280, 280)];
//设置背景色
self.label1.backgroundColor = [UIColor grayColor];
//设置tag,可以根据tag查找控件，viewWithTag方法
self.label1.tag = 91;
//设置标签文本
self.label1.text = @"我是一个label,我是一个label,我是一个label,我是一个label,我是一个label";
//设置标签文本字体和字体大小
self.label1.font = [UIFont fontWithName:@"Arial" size:30];
//设置文本对齐方式
self.label1.textAlignment = NSTextAlignmentCenter;
//文本对齐方式有以下三种
//typedef enum {
//    NSTextAlignmentLeft = 0,左对齐
//    NSTextAlignmentCenter,居中对齐
//    NSTextAlignmentRight, 右对齐
//} UITextAlignment;
//文本颜色
self.label1.textColor = [UIColor whiteColor];
//超出label边界文字的截取方式
self.label1.lineBreakMode = NSLineBreakByTruncatingMiddle;
//截取方式有以下6种
//typedef enum {
//    UILineBreakModeWordWrap = 0,    以空格为边界，保留整个单词
//    UILineBreakModeCharacterWrap,   保留整个字符
//    UILineBreakModeClip,            到边界为止
//    UILineBreakModeHeadTruncation,  省略开始，以……代替
//    UILineBreakModeTailTruncation,  省略结尾，以……代替
//    UILineBreakModeMiddleTruncation,省略中间，以……代替，多行时作用于最后一行
//} UILineBreakMode;
//文本文字自适应大小
self.label1.adjustsFontSizeToFitWidth = NO;
//当adjustsFontSizeToFitWidth=YES时候，如果文本font要缩小时
//baselineAdjustment这个值控制文本的基线位置，只有文本行数为1是有效
self.label1.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
//有三种方式
//typedef enum {
//    UIBaselineAdjustmentAlignBaselines = 0, 默认值文本最上端于label中线对齐
//    UIBaselineAdjustmentAlignCenters,//文本中线于label中线对齐
//    UIBaselineAdjustmentNone,//文本最低端与label中线对齐
//} UIBaselineAdjustment;
//文本最多行数，为0时没有最大行数限制
self.label1.numberOfLines = 0;
//文本高亮
self.label1.highlighted = YES;
//文本是否可变
self.label1.enabled = YES;
//去掉label背景色
//label1.backgroundColor = [UIColor clearColor];
//文本阴影颜色
self.label1.shadowColor = [UIColor blackColor];
//阴影大小
self.label1.shadowOffset = CGSizeMake(2.0, 2.0);
//是否能与用户交互
self.label1.userInteractionEnabled = YES;
    [self.label1 sizeToFit];
[self.view addSubview:self.label1];
    
    
//auto layout
[self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
           
            //make.center.mas_equalTo(self.view);
            make.edges.mas_offset(UIEdgeInsetsMake(50, 50, 50, 50));
        }];

}

@end
