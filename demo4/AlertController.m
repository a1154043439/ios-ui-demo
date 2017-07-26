//
//  AlertController.m
//  demo4
//
//  Created by test on 2017/7/18.
//  Copyright © 2017年 test. All rights reserved.
//

#import "AlertController.h"
#import "masonry.h"
@interface AlertController()<UITextViewDelegate>
@property(retain,nonatomic) UIAlertController * alertController;
@property(retain,nonatomic) UIAlertController * alertController1;
@property(retain,nonatomic) UIAlertController * alertController2;

@property (nonatomic , strong) UIButton * btn;
@property (nonatomic , strong) UIButton * btn1;
@property (nonatomic , strong) UIButton * btn2;
@end

@implementation AlertController
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
    self.title = @"AlertControllerDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    //第一种弹窗,普通样式
   self.alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"这个是UIAlertController的默认样式" preferredStyle:UIAlertControllerStyleAlert];
    //添加按钮事件
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    
    [self.alertController addAction:cancelAction];
    
    [self.alertController addAction:okAction];
   
    //第二种弹窗，表格样式
   self.alertController1 = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle: UIAlertControllerStyleActionSheet];

    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:nil];
    
    [self.alertController1 addAction:cancelAction];
    [self.alertController1 addAction:deleteAction];
    [self.alertController1 addAction:archiveAction];
    
 
//    
//    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重置" style:UIAlertActionStyleDestructive handler:nil];
//    
//    [self.alertController1 addAction:resetAction];
    
    
    // 第三种弹窗，文本框样式
    
    self.alertController2 = [UIAlertController alertControllerWithTitle:@"文本对话框" message:@"登录和密码对话框示例" preferredStyle:UIAlertControllerStyleAlert];
    //因此我们需要向“登录”文本框中添加一个Observer。Observer模式定义对象间的一对多的依赖关系,当一个对象的状态发生改变时, 所有依赖于它的对象都得到通知并被自动更新。
      __weak typeof(self) weakSelf=self;
    [self.alertController2 addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"登录";
        [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];

    }];
    
    [self.alertController2 addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
         [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [self.alertController2 addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"确认密码";
        textField.secureTextEntry = YES;
         [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    UIAlertAction *okAction1 = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *login = self.alertController2.textFields.firstObject;
        UITextField *password = self.alertController2.textFields.lastObject;
        NSLog(@" login:%@",login.text);
        NSLog(@" password:%@",password.text);
        //解除绑定
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    }];
//    UIAlertAction *cancelAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//       
//        NSLog(@"cancel");
//        //解除绑定
//        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
//    }];
    okAction1.enabled = NO;
    [self.alertController2 addAction:cancelAction];
    [self.alertController2 addAction:okAction1];
    
   
   

    

     self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
     self.btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
     self.btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.btn setTitle:@"我是第一种弹窗" forState:UIControlStateNormal];
    [self.btn1 setTitle:@"我是第二种弹窗" forState:UIControlStateNormal];
    [self.btn2 setTitle:@"我是第三种弹窗" forState:UIControlStateNormal];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.btn addTarget:self action:@selector(Method) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn1 addTarget:self action:@selector(Method1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn2 addTarget:self action:@selector(Method2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btn  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.view.mas_top).with.offset(150);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.btn1.mas_left).with.offset(-10);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self.btn1);
        
    } ];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_top).with.offset(150);
        make.left.equalTo(self.btn.mas_right).with.offset(10);
        make.right.equalTo(self.btn2.mas_left).with.offset(-10);
        make.height.equalTo(self.btn );
        make.width.equalTo(self.btn );
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_top).with.offset(150);
        make.left.equalTo(self.btn1.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.equalTo(self.btn1 );
        make.width.equalTo(self.btn1 );
    }];

}
//控制输入框的字符大于2时，ok按钮可用,否则ok按钮不可用
- (void)alertTextFieldDidChange:(NSNotification *)notification{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController) {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = (login.text.length > 2);
    }
}

- (void)Method
{
   [self presentViewController:self.alertController animated:YES completion:nil];
}

- (void)Method1
{
    [self presentViewController:self.alertController1 animated:YES completion:nil];
}

- (void)Method2
{
    [self presentViewController:self.alertController2 animated:YES completion:nil];
}

@end
