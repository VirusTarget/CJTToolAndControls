//
//  UITextField+BottomLine.m
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/6.
//
//

#import "UITextField+BottomLine.h"

#import "UIView+Extension.h"
#import "UIColor+Extension.h"

@implementation UITextField (BottomLine)

- (void)addBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"999999"];
    line.y = self.height + 5;
    line.height = 2;
    line.width = self.width;
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth ;
    line.tag = [@"NdCPTextFieldBottomLine" hash];
    [self addSubview:line];
    
    self.clipsToBounds = NO;
}

- (void)setLineColor:(UIColor *)color {
    UIView *line = [self viewWithTag:[@"NdCPTextFieldBottomLine" hash]];
    line.backgroundColor = color;
}

- (BOOL)limitWithRange:(NSRange)range
     replacementString:(NSString *)string
             minLength:(NSInteger)minLength
             maxLength:(NSInteger)maxLength {
    
    NSInteger existedLength = self.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;
    
    if (existedLength - selectedLength + replaceLength >= minLength) {
        [self setLineColor:[UIColor colorWithHexString:@"#999999"]];
    }
    
    // 如果是进行删除操作，那么不进行限制
    if (string.length == 0) {
        return YES;
    }
    
    // 如果是手机或者是短信验证码
    if (minLength == maxLength) {
        [self limitNumberString:string range:range length:minLength];
        return NO;
    }
    
    if (existedLength - selectedLength + replaceLength > maxLength) {
        return NO;
    }
    
    return YES;
}

#pragma mark - private method

/**
 限制为数字
 
 @param string 输入的字符串
 @param range 范围
 @param length 限制大小
 */
- (void)limitNumberString:(NSString *)string
                    range:(NSRange)range
                   length:(NSInteger)length {
    NSString *finalString = [self.text stringByReplacingCharactersInRange:range withString:string];
    NSString *numberString = [self pickUpNumberString:finalString];
    self.text = [numberString substringToIndex:MIN(length, numberString.length)];
    if (numberString.length >= length) {
        [self setLineColor:[UIColor colorWithHexString:@"#999999"]];
    }
}
/**
 提取字符串中的数字
 
 @param string 原始字符串
 @return 纯数字字符串
 */
- (NSString *)pickUpNumberString:(NSString *)string {
    // 正则表达式
    NSString *numberRegex = @"[0-9]{1}";
    // 新的可变字符串
    NSMutableString *mutableString = [NSMutableString string];
    for (int i=0; i<string.length; i++) {
        // 每次提取一位
        NSString *subString = [string substringWithRange:NSMakeRange(i, 1)];
        
        // 判断是否符合正则
        NSPredicate *regexNumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
        if([regexNumber evaluateWithObject:subString]) {
            // 符合则加入到新的字符串中
            [mutableString appendString:subString];
        }
    }
    
    // 返回一个新的不可变的字符串
    return [mutableString copy];
}
@end

