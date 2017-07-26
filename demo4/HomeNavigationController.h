//
//  ViewController+FirstViewController.h
//  demo4
//
//  Created by test on 2017/7/15.
//  Copyright © 2017年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeNavigationController : UINavigationController
/// 导航栏分隔线
@property (nonatomic , weak , readonly) UIImageView * navSystemLine;

/// 显示导航栏的细线
- (void)showNavgationSystemLine;
/// 隐藏导航栏的细线
- (void)hideNavgationSystemLine;


@end
