//
//  BTRCDSiderBarCtr.m
//  FMDBSimple1
//
//  Created by Benster on 14-10-14.
//  Copyright (c) 2014年 Workspaces. All rights reserved.
//

#import "BTRSiderBarCtr.h"

@implementation BTRSiderBarCtr

@synthesize menuColor = _menuColor;
@synthesize isOpen = _isOpen;

#pragma mark - 初始化菜单按钮
- (BTRSiderBarCtr *)initWithImages:(NSArray *)images
{
    //初始化菜单按钮
    _menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _menuBtn.frame = CGRectMake(0, 0, 40, 40);
    [_menuBtn setImage:images[0] forState:UIControlStateNormal];
    [_menuBtn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    
    _backgroundMenuView = [[UIView alloc] init];
    _menuColor          = [UIColor blackColor];
    _menuBtnList        = [[NSMutableArray alloc] initWithCapacity:images.count - 1];
    
    //初始化侧边栏按钮
    for (int index = 0; index < images.count - 1; index ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:images[index + 1] forState:UIControlStateNormal];
        btn.frame     = CGRectMake(10, 40 + (50 * index), 40, 40);
        btn.tag       = index;
        [btn addTarget:self action:@selector(onMenuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_menuBtnList addObject:btn];
    }
    
    return self;
}

#pragma mark - 
- (void)insertMenuButtonOnView:(UIView *)view atPosition:(CGPoint)position
{
    _menuBtn.frame = CGRectMake(position.x, position.y, _menuBtn.frame.size.width, _menuBtn.frame.size.height);
    [view addSubview:_menuBtn];
    
    //添加手势实例
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissMenu)];
    [view addGestureRecognizer:singleTap];
    
    for (UIButton *button in _menuBtnList) {
        [_backgroundMenuView addSubview:button];
    }
    
    _backgroundMenuView.frame = CGRectMake(view.frame.size.width, 0, 60, view.frame.size.height);
    _backgroundMenuView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [view addSubview:_backgroundMenuView];
}

#pragma mark - menubtn action
- (void)dissMissMenuWithSelection:(UIButton *)btn
{
    [UIView animateWithDuration:0.3f delay:0.0f usingSpringWithDamping:2.0f initialSpringVelocity:10.0f options:0 animations:^{
        btn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2f, 1.2f);
    }completion:^(BOOL finished) {
        [self dismissMenu];
    }];
}

#pragma mark - menuListBtn action
- (void)onMenuBtnClick:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(menuButtonClicked:)])
        [self.delegate menuButtonClicked:(int)btn.tag];
    [self dissMissMenuWithSelection:btn];
}

#pragma mark - 是否隐藏侧边栏
- (void)dismissMenu
{
    if (_isOpen){
        _isOpen = !_isOpen;
        [self performDismissAnimation];
    }
}

#pragma mark - 是否弹出侧边栏
- (void)showMenu
{
    if (!_isOpen){
        _isOpen = !_isOpen;
        [self performSelectorInBackground:@selector(performOpenAnimation) withObject:nil];
    }
}

#pragma mark - 隐藏侧边栏
- (void)performDismissAnimation
{
    [UIView animateWithDuration:0.4 animations:^{
        _menuBtn.alpha = 1.0f;
        _menuBtn.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
        _backgroundMenuView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
    }];
}

#pragma mark - 弹出侧边栏
- (void)performOpenAnimation
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.4 animations:^{
            _menuBtn.alpha = 0.0f;
            _menuBtn.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, -60, 0);
            _backgroundMenuView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, -60, 0);
        }];
    });
    for (UIButton *btn in _menuBtnList)
    {
        [NSThread sleepForTimeInterval:0.02f];
        dispatch_async(dispatch_get_main_queue(), ^{
            btn.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 20, 0);
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                 usingSpringWithDamping:.3f
                  initialSpringVelocity:10.f
                                options:0 animations:^{
                                    btn.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 0, 0);
                                }
                             completion:^(BOOL finished) {
                             }];
        });
    }
}

@end
