//
//  ScrollViewController.m
//  demo4
//
//  Created by test on 2017/7/18.
//  Copyright © 2017年 test. All rights reserved.
//

#import "ScrollViewController.h"
#import "masonry.h"
@interface ScrollViewController()<UIScrollViewDelegate>
//声明对象
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ScrollViewController
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
    self.title = @"ScrollViewControllerDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
     //self.scrollView.backgroundColor = [UIColor redColor];
    // 是否支持滑动最顶端
    //    scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    // 设置内容大小
    self.scrollView.contentSize = CGSizeMake(320, 460*10);
    UIImageView * view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    self.scrollView.contentSize = view.bounds.size;
    [self.scrollView addSubview: view];
    //除了contentSize，还有contentOffset，contentInset也可以结合起来使用。需要注意的是，contentSize的范围是以scrollView的位置为基准的。所以，如果内容视图的frame.origin不是(0,0)，则需要仔细计算内容视图能被显示的范围。
    
    // 是否反弹
    //    scrollView.bounces = NO;
    // 是否分页
    //    scrollView.pagingEnabled = YES;
    // 是否滚动
    //    scrollView.scrollEnabled = NO;
    //    scrollView.showsHorizontalScrollIndicator = NO;
    // 设置indicator风格
    //    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    // 设置内容的边缘和Indicators边缘
    //    scrollView.contentInset = UIEdgeInsetsMake(0, 50, 50, 0);
    //    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    // 提示用户,Indicators flash
    [self.scrollView flashScrollIndicators];
    // 是否同时运动,lock
    self.scrollView.directionalLockEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 320, 40)];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"scrolleview demo";
    [self.scrollView addSubview:label];
}

#pragma mark -代理方法
/*
 // 返回一个放大或者缩小的视图
 - (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
 {
 
 }
 // 开始放大或者缩小
 - (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:
 (UIView *)view
 {
 
 }
 
 // 缩放结束时
 - (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
 {
 
 }
 
 // 视图已经放大或缩小
 - (void)scrollViewDidZoom:(UIScrollView *)scrollView
 {
 NSLog(@"scrollViewDidScrollToTop");
 }
 */
/*普通滑动
 scrollViewWillBeginDragging
 2017-07-18 17:09:29.125 demo4[18400:967160] scrollViewDidScroll
 2017-07-18 17:09:29.531 demo4[18400:967160] scrollViewDidEndDragging
 快速滑动
 2017-07-18 17:11:38.371 demo4[18400:967160] scrollViewWillBeginDecelerating
 2017-07-18 17:11:38.449 demo4[18400:967160] scrollViewDidScroll
 2017-07-18 17:11:39.310 demo4[18400:967160] scrollViewDidEndDecelerating


 */

// 是否支持滑动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}

// 滑动到顶部时调用该方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScrollToTop");
}

// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}

// scrollView 开始减速（以下两个方法注意与以上两个方法加以区别）
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

// scrollview 减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");

}
@end
