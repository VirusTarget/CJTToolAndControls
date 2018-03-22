//
//  UITextField+Password.h
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/15.
//
//

#import <UIKit/UIKit.h>

/**
 密码框相关设置（非登录页面）
 */
@interface UITextField (Password)<UITextFieldDelegate>

/**
 增加眼睛
 */
- (void)addPasswordEye;

/**
 非密文形式
 */
- (void)eyeOpen;
@end
