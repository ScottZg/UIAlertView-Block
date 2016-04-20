//
//  UIAlertView+Block.h
//  Test
//
//  Created by zhanggui on 16/4/20.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^alertCallBackBlock)(NSUInteger buttonIndex);

@interface UIAlertView (Block)<UIAlertViewDelegate>

/**
 *  对UIAlertView进行扩展，然后形成有回调的alert
 *
 *  @param title       要显示的title
 *  @param message     要提示的内容
 *  @param cancelTitle 取消按钮的标题
 *  @param otherTitles 其他按钮标题数组
 *  @param block       block回调
 */
+ (void)ub_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray *)otherTitles clickButtonWithIndexHandle:(alertCallBackBlock)block;
@end
