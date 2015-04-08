//
//  BTRSuperViewCtr.m
//  FMDBSimple1
//
//  Created by Benster on 14-10-15.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import "BTRSuperViewCtr.h"
#import "BTRDataManager.h"
#include "User.h"

@interface BTRSuperViewCtr ()

@end

@implementation BTRSuperViewCtr

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BTRDataManager *dataManager = [[BTRDataManager alloc] init];
    [dataManager dataQIU:@""];
    User *user = [[User alloc] init];
    user.userId = 1;
    user.userName = @"Name";
    user.dict = @{@"Mobile":@"13512345678", @"Desc":@"没有"};
//    user.userAge = 20;
//    user.address = @"上海";
    
    NSDictionary *userValuesAndKeys = [user dictionaryWithValuesAndKeys];
    NSDictionary *values = [user dictionaryWithValuesForKeys:@[@"userId", @"userName", @"userAge", @"address", @"dict"]];
    
    NSLog(@"userVlyuesAndKeys = %@", userValuesAndKeys);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Active 设置缓冲层提示语
- (void)setActiveTItle:(NSString *)title
{
    if (![huanchongView superview]) {
        //// HUB
        huanchongView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        
        UIView *blacView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, self.view.bounds.size.height/2-50, 100, 100)];
        blacView.backgroundColor = [UIColor grayColor];
        blacView.layer.cornerRadius = 10;
        blacView.alpha = 0.7;
        [huanchongView addSubview:blacView];
        
        
        UIActivityIndicatorView *actiVew = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [actiVew setCenter:CGPointMake(50, 35)];
        [actiVew startAnimating];
        
        [blacView addSubview:actiVew];
        
        lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 100, 30)];
        lable.text = title;//@"正在加载...";
        lable.textAlignment = NSTextAlignmentCenter;
        lable.font = [UIFont systemFontOfSize:14];
        [blacView addSubview:lable];
        [self.view addSubview:huanchongView];
    }
}

#pragma mark - Active 开启缓冲层
- (void)startActive
{
    
    if (![huanchongView superview]) {
        //        [self createActive];
        [self.view addSubview:huanchongView];
    }
}

#pragma mark - Active 关闭缓冲层
- (void)stopActive
{
    [huanchongView removeFromSuperview];
}

#pragma mark - Alert 异常提示框
- (void)showAlert:(NSString *)infoStr
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:infoStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
}

@end
