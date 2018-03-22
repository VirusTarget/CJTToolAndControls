//
//  NSString+Check.h
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/26.
//
//

#import <Foundation/Foundation.h>

/**
 格式检查
 */
@interface NSString (Check)

/**
 手机号验证
 */
- (bool)isPhoneValid;

/**
 邮箱验证
 */
- (bool)isMailValid;

/**
 密码验证
 */
- (bool)isPasswordValid;

/**
 帐号验证
 */
- (bool)isAccountValid;

/**
 空验证
 */
- (bool)isEmpty;

/**
 图片验证码验证
 */
- (bool)isPicVerCodeValid;

/**
 短信验证码验证
 */
- (bool)isSMSVerCodeValid;
@end
