//
//  NSString+Check.m
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/26.
//
//

#import "NSString+Check.h"

@implementation NSString (Check)

- (bool)isPhoneValid {
    if ([self isEmpty]) {
        NSLog(@"手机号码不可为空");
        return NO;
    }
    NSString *mobile = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    if (![regextestmobile evaluateWithObject:self]) {
        NSLog(@"手机号码格式有误，请重新输入");
        return NO;
    }
    return YES;
}

- (bool)isMailValid {
    //邮箱
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *regexMail = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [regexMail evaluateWithObject:self];
}

- (bool)isPasswordValid {
    if ([self isEmpty]) {
        NSLog(@"密码不可为空");
        return NO;
    }
    // 数字与字母 6-12 位
    NSString *passwordRegex = @"[A-Za-z0-9]{6,12}";
    NSPredicate *regexPassword = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    if (![regexPassword evaluateWithObject:self]) {
        NSLog(@"密码格式有误，请重新输入");
        return NO;
    }
    return YES;
}

- (bool)isAccountValid {
    if ([self isEmpty]) {
        NSLog(@"账号不可为空");
        return NO;
    }
    if ([self isMailValid]) {
        return YES;
    }
    // 小写字母与数字 4-70 位
    NSString *accountRegex = @"[a-z0-9]{4,70}";
    NSPredicate *regexAccount = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", accountRegex];
    if (![regexAccount evaluateWithObject:self]) {
        NSLog(@"账号格式有误，请重新输入");
        return NO;
    }
    return YES;
}

- (bool)isEmpty {
    return [self length]==0;
}

- (bool)isPicVerCodeValid {
    if ([self isEmpty]) {
        NSLog(@"请输入验证码");
        return NO;
    }
    // 数字 4 位
    NSString *verCoreRegex = @"[0-9]{4}";
    NSPredicate *regexVerCode = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", verCoreRegex];
    if (![regexVerCode evaluateWithObject:self]) {
        NSLog(@"验证码要求是4位数字");
        return NO;
    }
    return YES;
}

- (bool)isSMSVerCodeValid {
    if ([self isEmpty]) {
        NSLog(@"请输入验证码");
        return NO;
    }
    // 数字 7 位
    NSString *verCoreRegex = @"[0-9]{7}";
    NSPredicate *regexVerCode = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", verCoreRegex];
    if (![regexVerCode evaluateWithObject:self]) {
        NSLog(@"验证码要求是7位数字");
        return NO;
    }
    return YES;
}
@end
