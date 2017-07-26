//
//  TableViewController.m
//  demo4
//
//  Created by test on 2017/7/18.
//  Copyright © 2017年 test. All rights reserved.
//
#import "TableViewController.h"
#import "masonry.h"
@interface TableViewController()<UIScrollViewDelegate>
//声明对象
/** 上一次的偏移值 */
@property (nonatomic , assign) CGFloat lastContentOffsetY;
@end

@implementation TableViewController
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
    self.title = @"父tableview";
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}


#pragma mark - 设置子控件
- (void)_setupSubViews
{
    // 初始化tableView
    [self _setupTableView];
 
    
}

// 初始化TableView
- (void)_setupTableView
{
    // 设置内边距
    CGFloat bottom = 0;
    CGFloat top = 20;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}

/*生成表格的每个cell*/
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"topicCellId";
    //是否有可重用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        NSLog(@"create+cell+%ld",indexPath.row);
        
    }else{
        NSLog(@"reuse+cell");
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ **  %zd" , self.title , indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}





- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView != self.tableView) {
        return;
    }
     NSLog(@"scrollViewDidEndDecelerating");
}



- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView != self.tableView) {
        return;
    }
       NSLog(@"scrollViewDidEndDragging");
}

@end
