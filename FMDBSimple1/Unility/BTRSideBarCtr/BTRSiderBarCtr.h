//
//  BTRCDSiderBarCtr.h
//  FMDBSimple1
//
//  Created by Benster on 14-10-14.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BTRSideBarCtrDelegate <NSObject>

- (void)menuButtonClicked:(int)index;       //侧边栏菜单按钮点击事件

@end

@interface BTRSiderBarCtr : NSObject
{
    UIView *_backgroundMenuView;            //背景
    UIButton *_menuBtn;                     //菜单按钮
    NSMutableArray *_menuBtnList;           //侧边栏按钮
}

@property (nonatomic, retain) UIColor               *menuColor;     //背景颜色
@property (nonatomic        ) BOOL                  isOpen;         //是否打开

@property (nonatomic, retain) id <BTRSideBarCtrDelegate> delegate;  //需要实现的协议

- (BTRSiderBarCtr *)initWithImages:(NSArray *)images;               //根据图片数组初始化侧边栏按钮
- (void)insertMenuButtonOnView:(UIView*)view atPosition:(CGPoint)position;

@end
