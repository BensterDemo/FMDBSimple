//
//  BTRSuperViewCtr.h
//  FMDBSimple1
//
//  Created by Benster on 14-10-15.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTRSuperViewCtr : UIViewController
{
    UIView *huanchongView;  //缓冲层
    UILabel *lable;         //缓冲层提示语
}
/**
 *  开启缓冲层
 */
- (void)startActive;

/**
 *  关闭缓冲层
 */
- (void)stopActive;

/**
 *  设置缓冲层提示语
 *
 *  @param title
 */
- (void)setActiveTItle:(NSString *)title;

/**
 *  异常提示框
 */
- (void)showAlert:(NSString *)infoStr;

@end
