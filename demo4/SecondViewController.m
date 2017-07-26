//
//  ViewController+Second.m
//  demo4
//
//  Created by test on 2017/7/17.
//  Copyright © 2017年 test. All rights reserved.
//

#import "SecondViewController.h"
#import "masonry.h"
@interface SecondViewController ()
/** UIButton */
@property (nonatomic , strong) UIButton * btn;
@property (nonatomic , strong) UIButton * btn1;
@property (nonatomic , strong) UIButton * btn2;
@property (nonatomic , strong) UIButton * btn3;
@property (nonatomic , strong) UIButton * btn4;
@property (nonatomic , strong) UIButton * btn5;
@property (nonatomic , strong) UIButton * btn6;
@end

@implementation SecondViewController
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
    self.title = @"buttonDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{

    
        //初始化按钮，设置按钮类型
     self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
     self.btn1 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
     self.btn2 = [UIButton buttonWithType:UIButtonTypeInfoLight];
     self.btn3 = [UIButton buttonWithType:UIButtonTypeInfoDark];
     self.btn4 = [UIButton buttonWithType:UIButtonTypeContactAdd];
     self.btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     self.btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.btn6.layer setMasksToBounds:YES];
    [self.btn6.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    [self.btn6.layer setBorderWidth:1.0]; //边框宽度
    self.btn6.backgroundColor = [UIColor clearColor];
        /*
         Type:
         UIButtonTypeCustom = 0, // 自定义类型
         UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // 系统类型
         UIButtonTypeDetailDisclosure,//详细描述样式，圆圈中间加个i
         UIButtonTypeInfoLight, //浅色的详细描述样式
         UIButtonTypeInfoDark,//深色的详细描述样式
         UIButtonTypeContactAdd,//加号样式
         UIButtonTypeRoundedRect = UIButtonTypeSystem,   // 圆角矩形
         */
        
        //设置按钮位置和尺寸
        self.btn.frame = CGRectMake(100, 100, 300, 50);
        
        //设置按钮文字标题
        [self.btn setTitle:@"我是一个按钮" forState:UIControlStateNormal];
        [self.btn1 setTitle:@"我是一个按钮1" forState:UIControlStateNormal];
      [self.btn2 setTitle:@"我是一个按钮2" forState:UIControlStateNormal];
      [self.btn3 setTitle:@"我是一个按钮3" forState:UIControlStateNormal];
      [self.btn4 setTitle:@"我是一个按钮4" forState:UIControlStateNormal];
      [self.btn5 setTitle:@"我是一个按钮5" forState:UIControlStateNormal];
      [self.btn6 setTitle:@"我是一个按钮6" forState:UIControlStateNormal];
        /*
         State:前三个较为常用
         UIControlStateNormal //正常状态下
         UIControlStateHighlighted //高亮状态下，按钮按下还未抬起的时候
         UIControlStateDisabled  //按钮禁用状态下，不能使用
         UIControlStateSelected  //选中状态下
         UIControlStateApplication //当应用程序标志时
         UIControlStateReserved  //为内部框架预留
         */
        
        //设置按钮文字颜色
        [self.btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        //设置背景图片（需要注意按钮类型最好为自定义，系统类型的会使图片变暗）
        //    [self.btn setImage:[UIImage imageNamed:@"tupian"] forState:UIControlStateNormal];
        
        //设置按钮文字大小
        self.btn.titleLabel.font = [UIFont systemFontOfSize:20];
        
        //设按钮背景颜色
        self.btn.backgroundColor = [UIColor cyanColor];
    self.btn1.backgroundColor = [UIColor blackColor];
    self.btn2.backgroundColor = [UIColor redColor];
    self.btn3.backgroundColor = [UIColor yellowColor];
    self.btn4.backgroundColor = [UIColor greenColor];
    self.btn5.backgroundColor = [UIColor orangeColor];
    self.btn6.backgroundColor = [UIColor purpleColor];
        
        //设置按钮文字阴影颜色
        [self.btn setTitleShadowColor:[UIColor yellowColor] forState:UIControlStateNormal];
        
        //默认情况下，在按钮被禁用时，图像会被画的颜色深一些。要禁用此功能，可以将这个属性设置为NO
        self.btn.adjustsImageWhenHighlighted = NO;
        
        //默认情况下，按钮在被禁用时，图像会被画的颜色淡一些。要禁用此功能，可以将这个属性设置为NO
        self.btn.adjustsImageWhenDisabled = NO;
        
        //下面的这个属性设置为yes的状态下，按钮按下会发光，这可以用于信息按钮或者有些重要的按钮
        self.btn.showsTouchWhenHighlighted = YES;
        
        //按钮响应点击事件，最常用的方法：第一个参数是目标对象，一般都是self； 第二个参数是一个SEL类型的方法；第三个参数是按钮点击事件
        [self.btn addTarget:self action:@selector(Method) forControlEvents:UIControlEventTouchUpInside];
    

//        //将控件添加到当前视图上
    
    
    [self.view addSubview:self.btn];
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.view addSubview:self.btn3];
    [self.view addSubview:self.btn4];
    [self.view addSubview:self.btn5];
    [self.view addSubview:self.btn6];
    //autolayout
    [self.btn  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.view.mas_top).with.offset(150);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.btn1.mas_left).with.offset(-10);
        make.height.mas_equalTo(@100);
        make.width.equalTo(self.btn1);
        
    } ];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_top).with.offset(150);
        make.left.equalTo(self.btn.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.equalTo(self.btn );
        make.width.equalTo(self.btn );
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn.mas_bottom).with.offset(40);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.btn3.mas_left).with.offset(-10);
        make.height.equalTo(self.btn );
        make.width.equalTo(self.btn );
    }];
    
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn.mas_bottom).with.offset(40);
        make.left.equalTo(self.btn3.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.equalTo(self.btn );
        make.width.equalTo(self.btn );
    }];
    
    [self.btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn2.mas_bottom).with.offset(40);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.btn5.mas_left).with.offset(-10);
        make.height.equalTo(self.btn );
        make.width.equalTo(self.btn );
    }];
    
    [self.btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn2.mas_bottom).with.offset(40);
        make.left.equalTo(self.btn4.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.equalTo(self.btn );
        make.width.equalTo(self.btn );
    }];
    
    [self.btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.btn4.mas_bottom).with.offset(40);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.height.equalTo(self.btn );
        make.width.equalTo(self.btn );
    }];

}
    



- (void)Method
    {
        NSLog(@" 这是一个button的小demo~~~~");
    }
    
    
    /*如果自定义按钮类，可以重写下面方法，定制自己需要的按钮
     
     - (CGRect)backgroundRectForBounds:(CGRect)bounds; //指定背景边界
     - (CGRect)contentRectForBounds:(CGRect)bounds; //指定内容边界
     - (CGRect)titleRectForContentRect:(CGRect)contentRect; //指定文字标题边界
     - (CGRect)imageRectForContentRect:(CGRect)contentRect; //指定按钮图像边界
     
     */


@end
