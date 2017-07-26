//
//  ViewController.m
//  demo4
//
//  Created by test on 2017/7/15.
//  Copyright © 2017年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self _setup];
    
    // 设置导航栏
    [self _setupNavigationItem];
    
   
}
#pragma mark - 初始化
- (void)_setup
{
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 设置导航栏
- (void)_setupNavigationItem
{
    self.title = @"demo";
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
