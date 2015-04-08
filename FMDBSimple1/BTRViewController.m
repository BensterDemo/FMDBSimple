//
//  BTRViewController.m
//  FMDBSimple1
//
//  Created by Benster on 14-10-14.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import "BTRViewController.h"

@interface BTRViewController ()

@end

@implementation BTRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self._tabV.dataSource = self;
    self._tabV.delegate = self;
    
    NSArray *imageList = @[[UIImage imageNamed:@"menuIcon.png"], [UIImage imageNamed:@"menuChat.png"], [UIImage imageNamed:@"menuUsers.png"], [UIImage imageNamed:@"menuMap.png"], [UIImage imageNamed:@"menuClose.png"]];
    sideBar = [[BTRSiderBarCtr alloc] initWithImages:imageList];
    sideBar.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [sideBar insertMenuButtonOnView:[UIApplication sharedApplication].delegate.window atPosition:CGPointMake(self.view.frame.size.width - 50, self.view.bounds.size.height - 50)];
}

#pragma mark - 按钮点击事件
- (IBAction)queryData:(UIButton *)sender
{
    if (self._queryBtn.tag) {
        self._queryBtn.tag = 0;
        [self._queryBtn setTitle:@"查询" forState:UIControlStateNormal];
    }
    else
    {
        self._queryBtn.tag = 1;
        [self._queryBtn setTitle:@"更新" forState:UIControlStateNormal];
    }
}

#pragma mark - 设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

#pragma mark - 设置列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

#pragma mark - tableView加载数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 50, 50)];
        label.text = [NSString stringWithFormat:@"row%li", (long)indexPath.row + 1];
        cell.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:label];
    }
    
    return cell;
}

#pragma mark - 侧边栏菜单按钮点击事件
- (void)menuButtonClicked:(int)index
{
    switch (index) {
        case 0:
            NSLog(@"this is one!");
            [self showAlert:@"this is One!"];
            break;
        case 1:
            NSLog(@"this is two!");
            [self showAlert:@"this is Two!"];
            break;
        case 2:
            NSLog(@"this is three!");
            [self showAlert:@"this is Three!"];
            break;
        case 3:
            NSLog(@"this is foure!");
            [self showAlert:@"this is Four!"];
            break;
            
        default:
            NSLog(@"this is not found!");
            [self showAlert:@"this is NotFond!"];
            break;
    }
}
@end
