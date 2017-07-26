//
//  PageViewController.m
//  demo4
//
//  Created by test on 2017/7/18.
//  Copyright © 2017年 test. All rights reserved.
//

#import "PageViewController.h"
#import "masonry.h"
@interface PageViewController()<UIScrollViewDelegate>
@property (nonatomic, strong)UIPageControl *pageControl;
@end

@implementation PageViewController
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
    self.title = @"SegmentedControllerDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    //创建ScrollView
    UIScrollView *sv = [[UIScrollView alloc] init];
    sv.frame = self.view.bounds;
    //设置边缘不弹跳
    sv.bounces = NO;
    //整页滚动
    sv.pagingEnabled = YES;
    sv.showsHorizontalScrollIndicator = NO;
    
    int IMAGECOUNT=3;
    //加入多个子视图(ImageView)
    for(NSInteger i=0; i<IMAGECOUNT; i++){
        NSString *imgName = [NSString stringWithFormat:@"%ld", i+2];
        UIImage *image = [UIImage imageNamed:imgName];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        CGRect frame = CGRectZero;
        //计算x的起始坐标
        frame.origin.x = i * sv.frame.size.width;
        frame.size = sv.frame.size;
        imageView.frame = frame;
        [sv addSubview:imageView];
        
        if(i==IMAGECOUNT-1){
            //开启图片的用户点击功能
            imageView.userInteractionEnabled = YES;
            //加个按钮
            UIButton *button = [[UIButton alloc]init];
            //计算按钮坐标位置
            button.frame = CGRectMake((imageView.frame.size.width-150)/2, imageView.frame.size.height*0.8, 150, 40);
            button.backgroundColor = [UIColor orangeColor];
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
            [imageView addSubview:button];
            [button addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];    }
    }
    
    sv.contentSize = CGSizeMake(IMAGECOUNT * sv.frame.size.width, sv.frame.size.height);
    
    [self.view addSubview:sv];
    
    //加入页面指示控件PageControl
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    //设置frame
    pageControl.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 20);
    //分页面的数量
    pageControl.numberOfPages = IMAGECOUNT;
    //设置小圆点渲染颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //设置当前选中小圆点的渲染颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //关闭用户点击交互
    pageControl.userInteractionEnabled = NO;
    
    [self.view addSubview:pageControl];
    
    sv.delegate = self;
    
    
}
- (void)enter
{
    NSLog(@"进入应用");
}

//UIScrollViewDelegate方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    if(offset.x<=0){
        offset.x = 0;
        scrollView.contentOffset = offset; 
    } 
    NSUInteger index = round(offset.x / scrollView.frame.size.width); 
    self.pageControl.currentPage = index;
}
@end

