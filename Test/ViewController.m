//
//  ViewController.m
//  Test
//
//  Created by zhanggui on 16/4/15.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+Block.h"
NSString *const ViewControllerConstantName = @"CONSTNAME";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showAlertAction:(id)sender {
    [UIAlertView ub_alertWithTitle:@"温馨提示" message:@"欢迎使用ubAlert" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] clickButtonWithIndexHandle:^(NSUInteger buttonIndex) {
        NSLog(@"%lu",(unsigned long)buttonIndex);
    }];
}
@end
