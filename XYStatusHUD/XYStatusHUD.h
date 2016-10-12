//
//  XYStatusHUD.h
//  XYStatusHUD
//
//  Created by xuyao on 2016/10/12.
//  Copyright © 2016年 xuyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYStatusHUD : NSObject
/** 显示普通信息 */
+ (void)showMessage:(NSString *)message;
/** 显示普通信息 
 *  @param message   文字
 *  @param image     图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image;
/** 显示成功信息 */
+ (void)showSuccess:(NSString *)success;
/** 显示失败信息 */
+ (void)showError:(NSString *)error;
/** 显示正在加载信息 */
+ (void)showLoading:(NSString *)loading;
/** 隐藏 */
+ (void)dismiss;

@end
