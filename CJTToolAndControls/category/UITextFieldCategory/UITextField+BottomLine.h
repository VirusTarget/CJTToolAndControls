//
//  UITextField+BottomLine.h
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/6.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (BottomLine)

/**
 新增底部线条
 */
- (void)addBottomLine;

/**
 设置线条颜色

 @param color 颜色
 */
- (void)setLineColor:(UIColor *)color;

/**
 文本限制处理

 @param range 修改范围
 @param string 代替的字符串
 @param minLength 最小长度
 @param maxLength 最大长度
 @return 是否限制
 */
- (BOOL)limitWithRange:(NSRange)range
     replacementString:(NSString *)string
             minLength:(NSInteger)minLength
             maxLength:(NSInteger)maxLength;
@end
