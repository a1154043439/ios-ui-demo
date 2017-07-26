//
//  ImageView.m
//  demo4
//
//  Created by test on 2017/7/17.
//  Copyright © 2017年 test. All rights reserved.
//
#import "ImageViewViewController.h"
#import "masonry.h"
@interface ImageViewViewController ()
@property (nonatomic , strong) UIImageView * imageView;
@property (nonatomic , strong) UIImageView * imageView1;
@property(nonatomic)int i;
@end

@implementation ImageViewViewController
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
    self.title = @"ImageViewDemo";
    self.i = 0;
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    
    //    (1)创建
   self.imageView1 = [[UIImageView alloc ] init];
    
    
    UIImage *image = [UIImage imageNamed:@"2"];
    self.imageView1.image = image;
    
    //    (2)设置圆角
    self.imageView1.layer.masksToBounds = YES;
    self.imageView1.layer.cornerRadius = 10;
    
    
    //    (3)设置边框颜色和大小
    self.imageView1.layer.borderColor = [UIColor orangeColor].CGColor;
    self.imageView1.layer.borderWidth = 2;
    
    
    //    (4)contentMode属性：当图片小于imageView的大小处理图片显示
    
    
    //    这个属性是用来设置图片的显示方式，如居中、居右，是否缩放等，有以下几个常量可供设定：
    //
    //    UIViewContentModeScaleToFill ：填充整个UIViewContentModeScaleAspectFit UIViewContentModeScaleAspectFill UIViewContentModeRedraw UIViewContentModeCenter UIViewContentModeTop UIViewContentModeBottom UIViewContentModeLeft UIViewContentModeRight UIViewContentModeTopLeft UIViewContentModeTopRight UIViewContentModeBottomLeft UIViewContentModeBottomRight
    self.imageView1.contentMode = UIViewContentModeScaleAspectFit;
    
self.imageView = [[UIImageView alloc ] init];
    //(5)播放一系列图片
    UIImage *image1 = [UIImage imageNamed:@"3"];
    UIImage *image2 = [UIImage imageNamed:@"4"];
    UIImage *image3 = [UIImage imageNamed:@"5"];
    NSArray *imagesArray = @[image1,image2,image3];
    self.imageView.animationImages = imagesArray;
    // 设定所有的图片在多少秒内播放完毕
self.imageView.animationDuration = [imagesArray count];
    // 不重复播放多少遍，0表示无数遍
   self. imageView.animationRepeatCount = 0;
    // 开始播放
    [self.imageView startAnimating];
    
    
    
    //(6)为图片添加单击事件：一定要先将userInteractionEnabled置为YES，这样才能响应单击事件
    
    self.imageView1.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView)];
    [self.imageView1 addGestureRecognizer:singleTap];
    
    
    
    //(7)其他设置
    
    //    imageView.hidden = YES或者NO;    // 隐藏或者显示图片
    self.imageView1.alpha =0.5;    // 设置透明度
    // 设置高亮时显示的图片
    //imageView.highlightedImage = (UIImage *)hightlightedImage;
    
    //imageView.image = (UIImage *)image; // 设置正常显示的图片
    
    
    
    //设置位置 1)修改center ImageView的中间点2)修改frame
    self.imageView.frame = CGRectMake(60, 66, 300, 400);
    //    imageView.center = CGPointMake(0, 0);
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.imageView1];
   
    [self.imageView1  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_left).with.offset(-10);
        make.width.equalTo(self.imageView);
        
    } ];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView1.mas_bottom).with.offset(30);
        make.left.equalTo(self.view.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.height.equalTo(self.imageView1 );
        make.width.equalTo(self.imageView1 );
    }];

}
- (void)tapImageView
{
    NSLog(@" 这是一个tapImageView的小demo~~~~");
    CGAffineTransform transform= CGAffineTransformMakeRotation(3.14*0.38*((++self.i)%6));
    self.imageView1.transform = transform;//旋转
}
@end
