//
//  UIWebView+JavaScriptAlert.h
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/21.
//
//

#import <UIKit/UIKit.h>

/**
 修改UIWeb弹出的提示框
 */
@interface UIWebView (JavaScriptAlert)
- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame;
- (BOOL)webView:(UIWebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame;
@end
