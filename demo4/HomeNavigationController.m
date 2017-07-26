//
//  ViewController+FirstViewController.h
//  demo4
//
//  Created by test on 2017/7/15.
//  Copyright © 2017年 test. All rights reserved.
//

#import "HomeNavigationController.h"

@interface HomeNavigationController ()
/// 导航栏分隔线
@property (nonatomic , weak , readwrite) UIImageView * navSystemLine;

@end

@implementation HomeNavigationController
#pragma mark - Publi Method
/// 显示导航栏的细线
- (void)showNavgationSystemLine
{
    self.navSystemLine.hidden = NO;
}
/// 隐藏导航栏的细线
- (void)hideNavgationSystemLine
{
    self.navSystemLine.hidden = YES;
}

@end
