//
//  BTRViewController.h
//  FMDBSimple1
//
//  Created by Benster on 14-10-14.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTRSuperViewCtr.h"
#import "BTRSiderBarCtr.h"

@interface BTRViewController : BTRSuperViewCtr<BTRSideBarCtrDelegate, UITableViewDelegate, UITableViewDataSource>
{
    BTRSiderBarCtr *sideBar;
}

@property (nonatomic, assign) IBOutlet UITableView    *_tabV;//数据显示列表
@property (nonatomic, assign) IBOutlet UIButton       *_queryBtn;//查询按钮

@property (nonatomic, assign) NSMutableArray *_list;//数据

- (IBAction)queryData:(UIButton *)sender;

@end
