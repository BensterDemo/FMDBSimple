//
//  BTRDataManager.h
//  FMDBSimple1
//
//  Created by Benster on 14-10-15.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface BTRDataManager : NSObject
{
    FMDatabase *_dataBase;
}

- (BOOL)dataQIU:(NSString *)sqlStr;                     //执行非查询语句

- (NSMutableArray *)dataQueryList:(NSString *)sqlStr;   //执行查询语句 返回一个数组

- (NSString *)dataQuerySingle:(NSString *)sqlStr;       //执行查询语句 返回单个数值

@end
