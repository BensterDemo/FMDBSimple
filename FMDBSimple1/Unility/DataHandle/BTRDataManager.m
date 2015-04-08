//
//  BTRDataManager.m
//  FMDBSimple1
//
//  Created by Benster on 14-10-15.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import "BTRDataManager.h"

@implementation BTRDataManager

- (id)init
{
    if (self = [super init]) {
        _dataBase = [FMDatabase databaseWithPath:[self documentPath:@"FMDBDemo.sqlite"]];
        [_dataBase open];
        [_dataBase executeUpdate:@"CREATE TABLE IF NOT EXISTS \'Test1\' (\'Id\' INTEGER PRIMARY KEY, \'Name\' TEXT, \'dict\' TEXT)"];
        [_dataBase close];
    }
    
    return self;
}

- (NSString *)documentPath:(NSString *)subPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if (!subPath || [subPath isEqualToString:@""]) {
        return [paths objectAtIndex:0];
    } else {
        return [[paths objectAtIndex:0] stringByAppendingPathComponent:subPath];
    }
}

#pragma mark - 执行非查询语句
- (BOOL)dataQIU:(NSString *)sqlStr
{
    if (![_dataBase open]) {
        return false;
    }
    
    [_dataBase executeUpdate:@"INSERT INTO \'Test1\' (Id, Name, dict) VALUES (:Id, :Name, :dict)" withParameterDictionary:@{@"Id":@6, @"Name":@"bb",@"dict":@{@"Mobile":@"13512345678", @"Desc":@"没有"}}];
    
//    [_dataBase executeUpdate:<#(NSString *)#> withVAList:<#(__va_list_tag *)#>]
    [_dataBase close];
    
    return true;
}

#pragma mark - 执行查询语句 返回一个数组
- (NSMutableArray *)dataQueryList:(NSString *)sqlStr
{
    
    return nil;
}

#pragma mark - 执行查询语句 返回单条数据
- (NSString *)dataQuerySingle:(NSString *)sqlStr
{
    
    return nil;
}

@end
