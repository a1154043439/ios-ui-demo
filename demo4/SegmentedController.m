//
//  SegmentedController.m
//  demo4
//
//  Created by test on 2017/7/18.
//  Copyright © 2017年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SegmentedController.h"
#import "masonry.h"
@interface SegmentedController()
//声明对象
@property (nonatomic,strong) UISegmentedControl *segmentedcontrol;
@end

@implementation SegmentedController
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
    
    //标题
    NSArray *segmentArry = [NSArray arrayWithObjects:@"中国",@"美国",@"大不列颠英国",@"俄罗斯", nil];
    //初始化
    self.segmentedcontrol = [[UISegmentedControl alloc] initWithItems:segmentArry];
    //iOS 7.0后被弃用
    //self.segmentedcontrol.segmentedControlStyle = UISegmentedControlStylePlain;
    self.segmentedcontrol.frame = CGRectMake(20, 100, self.view.frame.size.width-40, 30);
    //默认值为NO，即点击后保持选中状态，如果设置为YES则，只是短暂的显示选中状态
    self.segmentedcontrol.momentary = YES;
    //指示控件是否根据其内容宽度来调整片段宽度
    self.segmentedcontrol.apportionsSegmentWidthsByContent = YES;
    //设置UISegmentedControl的边框、分割线、文字、点击后的颜色
    self.segmentedcontrol.tintColor = [UIColor blueColor];
    
    
    //通过Attribute字符串属性字典设置Segment标签属性(正常状态下)
    [self.segmentedcontrol setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor purpleColor]} forState:UIControlStateNormal];
    //通过Attribute字符串属性字典设置Segment标签属性(选中状态下)
    [self.segmentedcontrol setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    
    //添加事件
    [self.segmentedcontrol addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmentedcontrol];
}

    //事件点击方法
- (void)segmentAction:(UISegmentedControl *)click
{
        
        //UISegmentedControl的段数
        NSInteger totalindext = self.segmentedcontrol.numberOfSegments;
        //当前选中Segment
        NSInteger selectindext = self.segmentedcontrol.selectedSegmentIndex;
        NSLog(@"共分：%ld段,当前选中：%ld段",totalindext,selectindext);
//        //指定索引点插入新标题
        [self.segmentedcontrol insertSegmentWithTitle:@"德国" atIndex:selectindext animated:YES];
        //指定索引点插入新图片
//        [self.segmentedcontrol insertSegmentWithImage:[UIImage imageNamed:@"2"] atIndex:selectindext animated:YES];
        //移除指定Segment
        //[self.segmentedcontrol removeSegmentAtIndex:selectindext+1 animated:YES];
        //移除全部Segment
        //[self.segmentedcontrol removeAllSegments];
        //设置指定Segment的标题
        // [self.segmentedcontrol setTitle:@"日本" forSegmentAtIndex:0];
        //返回指定Segment的标题
        NSString *segmentTitle = [self.segmentedcontrol titleForSegmentAtIndex:0];
        NSLog(@"索引为：0的标题设置为：%@",segmentTitle);
        //设置指定Segment的image
       // [self.segmentedcontrol setImage:[UIImage imageNamed:@"3"] forSegmentAtIndex:0];
        //返回指定Segment的image
       // UIImage *segmentImage = [self.segmentedcontrol imageForSegmentAtIndex:0];
       // NSLog(@"索引为：0的图片设置为：%@",segmentImage);
        //设置指定Segment的宽度 默认（0，0）自适应
        [self.segmentedcontrol setWidth:100 forSegmentAtIndex:0];
        //返回指定Segment的宽度
        CGFloat segmentW = [self.segmentedcontrol widthForSegmentAtIndex:0];
        NSLog(@"索引为：0的Segment宽度设置为：%.2f",segmentW);
        //设置指定Segment的偏移量
        [self.segmentedcontrol setContentOffset:CGSizeMake(5.0, 2.0) forSegmentAtIndex:0];
        //获取指定Segment的偏移量
        CGSize segmentSize = [self.segmentedcontrol contentOffsetForSegmentAtIndex:selectindext];

        NSLog(@"索引为：%ld的Segment偏移量设置为：%@",(long)selectindext, NSStringFromCGSize(segmentSize));
   
        //设置指定Segment是否有效
        [self.segmentedcontrol setEnabled:YES forSegmentAtIndex:0];
        //返回指定Segment是否有效
        BOOL segmentBool = [self.segmentedcontrol isEnabledForSegmentAtIndex:0];
        NSLog(@"索引为：0的Segment当前是否可以点击：%@",segmentBool ? @"可以":@"不可以");
    
        
}
@end
