//
//  XYStatusHUD.m
//  XYStatusHUD
//
//  Created by xuyao on 2016/10/12.
//  Copyright © 2016年 xuyao. All rights reserved.
//

#import "XYStatusHUD.h"

#define XYTextFont [UIFont systemFontOfSize:16]

/** 消息停留时间 */
static CGFloat const XYMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const XYAnimationDuration = 0.25;

@implementation XYStatusHUD

/** 全局窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/**
 *  创建窗口
 */
+ (void)showWindow
{
    CGFloat windowH = 30;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    // 显示窗口
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:XYAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/** 显示普通信息 */
+ (void)showMessage:(NSString *)message
{
    
    [self showMessage:message image:nil];

}

/** 显示普通信息
 *  @param message   文字
 *  @param image     图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:message forState:UIControlStateNormal];
    button.titleLabel.font = XYTextFont;
    if (image) {// 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XYMessageDuration target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}

/** 显示成功信息 */
+ (void)showSuccess:(NSString *)success
{
    [self showMessage:success image:[UIImage imageNamed:@"XYStatusHUD.bundle/Success"]];
}

/** 显示失败信息 */
+ (void)showError:(NSString *)error
{
    [self showMessage:error image:[UIImage imageNamed:@"XYStatusHUD.bundle/error"]];

}

/** 显示正在加载信息 */
+ (void)showLoading:(NSString *)loading
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.frame = window_.bounds;
    label.font = XYTextFont;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = loading;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat loadingW = [loading sizeWithAttributes:@{NSFontAttributeName: XYTextFont}].width;
    CGFloat centerX = (window_.frame.size.width - loadingW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}

/** 隐藏 */
+ (void)dismiss
{

    [UIView animateWithDuration:XYAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        // 销毁窗口
        window_ = nil;
        timer_ = nil;
    }];
}

@end
