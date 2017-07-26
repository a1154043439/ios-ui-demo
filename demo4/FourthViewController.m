//
//  #import "ViewController.h"  @interface ThirdViewController:ViewController FourthViewController.m
//  demo4
//
//  Created by test on 2017/7/17.
//  Copyright © 2017年 test. All rights reserved.
//

#import "FourthViewController.h"
#import "masonry.h"
@interface FourthViewController ()<UITextFieldDelegate>
/** UILabel*/
@property (nonatomic , strong) UITextField * textField;
@property (nonatomic , strong) UIButton * btn;
@end

@implementation FourthViewController
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
    self.title = @"textFieldDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 300, 200, 50)];
    [self.view addSubview:self.textField];
    //设置显示文本
    self.textField .text = @"点击试试";
    //边框样式
    self.textField.borderStyle=UITextBorderStyleRoundedRect;
    //删除按钮
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    //设置文本颜色
    self.textField .textColor = [UIColor redColor];
    //设置文本对齐方式
    self.textField .textAlignment = NSTextAlignmentRight;
    //设置字体
    self.textField .font = [UIFont fontWithName:@"wawati sc" size:20];
    
    self.textField.delegate =self;
    
    
}

#pragma mark - 代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - 注册键盘出现通知
#pragma mark - 注册键盘隐藏通知
-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}
#pragma mark - 解除键盘出现通知
#pragma mark - 解除键盘隐藏通知
-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]  removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

-(void)keyboardDidShow:(NSNotification *)notif{
    NSLog(@"键盘打开");
}
-(void)keyboardDidHide:(NSNotification *)notif{
    NSLog(@"键盘关闭");
}
@end
