//
//  UIAlertView+Block.m
//  Test
//
//  Created by zhanggui on 16/4/20.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

@implementation UIAlertView (Block)
+ (void)ub_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray *)otherTitles clickButtonWithIndexHandle:(alertCallBackBlock)block {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles: nil];
    alert.callBackBlock = block;
    for (NSString *buttonTitle in otherTitles) {
        [alert addButtonWithTitle:buttonTitle];
    }
    
    [alert show];
}
#pragma mark - RunTime add property
- (void)setCallBackBlock:(alertCallBackBlock)callBackBlock {
    objc_setAssociatedObject(self, @selector(callBackBlock), callBackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (alertCallBackBlock)callBackBlock {
    return objc_getAssociatedObject(self, _cmd);
}
#pragma mark - UIAlertViewDelegate
+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.callBackBlock) {
        alertView.callBackBlock(buttonIndex);
    }
}
@end
