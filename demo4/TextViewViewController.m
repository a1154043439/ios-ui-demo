//
//  TextViewViewController.m
//  
//
//  Created by test on 2017/7/18.
//
//

#import "TextViewViewController.h"
#import "masonry.h"
@interface TextViewViewController ()<UITextViewDelegate>
@property (nonatomic , strong) UITextView * textView;
@property (nonatomic , strong) UILabel * count;
@end

@implementation TextViewViewController
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
    self.title = @"TextViewDemo";
}

#pragma mark - 设置子控件
- (void)_setupSubViews
{
    // 初始化输入框并设置位置和大小
   self.textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 180)];
    // 设置预设文本
    self.textView.text = @"这是一个textview的小demo！";
    // 设置文本字体
    self.textView.font = [UIFont fontWithName:@"Arial" size:16.5f];
    // 设置文本颜色
    self.textView.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    // 设置文本框背景颜色
    self.textView.backgroundColor = [UIColor whiteColor];
    // 设置文本对齐方式
    self.textView.textAlignment = NSTextAlignmentLeft;
    // 设置自动纠错方式
    self.textView.autocorrectionType = UITextAutocorrectionTypeYes;
    
    //外框
    self.textView.layer.borderColor = [UIColor redColor].CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.cornerRadius =5;
    
    
    // 设置自动大写方式
    self.textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    // 自动大写方式有以下几种：
    //    enum {
    //        UITextAutocapitalizationTypeNone,           不自动大写
    //        UITextAutocapitalizationTypeWords,          单词首字母大写
    //        UITextAutocapitalizationTypeSentences,      句子的首字母大写
    //        UITextAutocapitalizationTypeAllCharacters,  所有字母都大写
    //    } UITextAutocapitalizationType;
    
    // 设置键盘的样式
    self.textView.keyboardType = UIKeyboardTypeDefault;
    
    // 键盘样式有以下几种：
    //    enum {
    //        UIKeyboardTypeDefault,                默认键盘，支持所有字符
    //        UIKeyboardTypeASCIICapable,           支持ASCII的默认键盘
    //        UIKeyboardTypeNumbersAndPunctuation,  标准电话键盘，支持＋＊＃字符
    //        UIKeyboardTypeURL,                    只支持URL字符的URL键盘，支持.com按钮
    //        UIKeyboardTypeNumberPad,              数字键盘
    //        UIKeyboardTypePhonePad,               电话键盘
    //        UIKeyboardTypeNamePhonePad,           支持输入人名的电话键盘
    //        UIKeyboardTypeEmailAddress,           电子邮件键盘
    //        UIKeyboardTypeDecimalPad,             有数字和小数点的数字键盘
    //        UIKeyboardTypeTwitter,                优化的键盘，方便输入@、#字符
    //        UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable,
    //    } UIKeyboardType;
    
    // 设置return键样式
    self.textView.returnKeyType = UIReturnKeyDefault;
    
    // return键有以下几种样式：
    //    enum {
    //        UIReturnKeyDefault,        默认，灰色按钮，标有Return
    //        UIReturnKeyGo,             标有Go的蓝色按钮
    //        UIReturnKeyGoogle,         标有Google的蓝色按钮，用于搜索
    //        UIReturnKeyJoin,           标有Join的蓝色按钮
    //        UIReturnKeyNext,           标有Next的蓝色按钮
    //        UIReturnKeyRoute,          标有Route的蓝色按钮
    //        UIReturnKeySearch,         标有Search的蓝色按钮
    //        UIReturnKeySend,           标有Send的蓝色按钮
    //        UIReturnKeyYahoo,          标有Yahoo的蓝色按钮
    //        UIReturnKeyYahoo,          标有Yahoo的蓝色按钮
    //        UIReturnKeyEmergencyCall,  紧急呼叫按钮
    //    } UIReturnKeyType;
    
    // 设置是否可以拖动
    self.textView.scrollEnabled = YES;
    // 设置代理
    self.textView.delegate = self;
    //自适应高度
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    // 自定义文本框字数统计
    self.count = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100, CGRectGetMaxY(self.textView.frame) +5, 60, 20)];
    self.count.text = @"0/100";
    self.count.textAlignment = NSTextAlignmentRight;
    self.count.font = [UIFont fontWithName:@"Arial" size:15.0f];
    self.count.backgroundColor = [UIColor clearColor];
    self.count.textColor = [UIColor redColor];
    self.count.enabled = NO;
    
    [self.view addSubview:self.count];
    [self.view addSubview:self.textView];
    

}
#pragma mark - 代理相关设置
/**
 将要开始编辑
 @param textView textView
 @return BOOL
 */
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
    
}
/**
 开始编辑
 @param textView textView
 */
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"这是一个textview的小demo！"]) {
        
        textView.text = @"";
        
    }
}

/**
 将要结束编辑
 
 @param textView textView
 
 @return BOOL
 */
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    
    return YES;
    
}

/**
 结束编辑
 
 @param textView textView
 */
-(void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length <1) {
        textView.text = @"这是一个textview的小demo！";
    }
    
    
}


/**
 内容将要发生改变编辑 限制输入文本长度 监听TextView 点击了ReturnKey 按钮
 The text view calls this method whenever the user types a new character or deletes an existing character.
 YES if the old text should be replaced by the new text; NO if the replacement operation should be aborted
 @param textView textView
 @param range    范围
 @param text     text
 
 @return BOOL
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location < 100)
    {
        return  YES;
        
    } 
    if (textView.text.length == 100) {
        
        return NO;
    }
    
    return YES;
    
}


/**
 内容发生改变编辑 自定义文本框placeholder
 有时候我们要控件自适应输入的文本的内容的高度，只要在textViewDidChange的代理方法中加入调整控件大小的代理即可
 @param textView textView
 */
- (void)textViewDidChange:(UITextView *)textView
{
    self.count.text = [NSString stringWithFormat:@"%lu/100", textView.text.length  ];
}

@end
