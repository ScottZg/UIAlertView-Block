# UIAlertView-Block
带有block回调的UIAlertView

####简单介绍
***
在iOS开发的过程中，我们经常会用到UIAlertView。在iOS9之前，我们一般都是用UIAlertView。但是有个问题就是我们每次都需要实现其代理方法，然后在代理方法里面去执行相应的代码段。另外，我们如果在一个控制器中用到了多个UIAlertView,我们还需要设不同的tag来标记，这样看起来很啰嗦，现在就来看看UIAlertView+Block吧。     
####类实现分析
***
主要用了Runtime去动态地给UIAlertView添加了一个callBackBlock

	- (void)setCallBackBlock:(alertCallBackBlock)callBackBlock {
    	objc_setAssociatedObject(self, @selector(callBackBlock), callBackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
	}
	- (alertCallBackBlock)callBackBlock {
    	return objc_getAssociatedObject(self, _cmd);
	}

然后我们实现了自己的方法：

    + (void)ub_alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitles:(NSArray *)otherTitles clickButtonWithIndexHandle:(alertCallBackBlock)block {
	    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles: nil];
	    alert.callBackBlock = block;
	    for (NSString *buttonTitle in otherTitles) {
	        [alert addButtonWithTitle:buttonTitle];
	    }
	    
	    [alert show];
	}

####使用方法
***
直接在需要的地方导入头文件，然后调用方法即可，例如：

	- (IBAction)showAlertAction:(id)sender {
	    [UIAlertView ub_alertWithTitle:@"温馨提示" message:@"欢迎使用ubAlert" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] clickButtonWithIndexHandle:^(NSUInteger buttonIndex) {
	        NSLog(@"%lu",(unsigned long)buttonIndex);
	    }];
	}
####注
***
如有问题随时联系：<scottzg@126.com>
####更新记录
***
暂无
