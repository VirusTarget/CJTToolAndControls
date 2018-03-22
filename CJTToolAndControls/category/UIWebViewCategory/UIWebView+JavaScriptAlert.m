//
//  UIWebView+JavaScriptAlert.m
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/21.
//
//

#import "UIWebView+JavaScriptAlert.h"

@implementation UIWebView (JavaScriptAlert)
- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame {
    [[UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert]
     addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
    [self endEditing:YES];
}

- (BOOL)webView:(UIWebView *)sender runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(id)frame{
    return NO;
}
@end
