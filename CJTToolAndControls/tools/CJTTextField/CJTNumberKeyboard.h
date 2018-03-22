//
//  CJTNumberKeyBoard.h
//  keyboardTest
//
//  Created by chenjintian on 17/4/6.
//  Copyright © 2017年 CJT. All rights reserved.
//

@import UIKit;
@class CJTNumberKeyboard;

typedef NS_ENUM(NSUInteger, CJTKeyboardType) {
    /// 默认
    CJTNumberKeyboardDefault,
    /// 小数点
    CJTNumberKeyboardDouble,
    /// 身份证
    CJTNumberKeyboardID,
    /// 系统键盘
    SYSTEMKeyboard,
};

@protocol CJTNumberKeyBoardDelegate <NSObject>

/** 点击删除按钮 */
- (void)textFieldShouldDelete:(CJTNumberKeyboard *)numberKeyboard;
/** 点击键盘输入相应数字及特殊字符 */
- (void)numberKeyboard:(CJTNumberKeyboard *)numberKeyboard replacementString:(NSString *)string;

@end

@interface CJTNumberKeyboard : UIView

@property (nonatomic, weak) id <CJTNumberKeyBoardDelegate>  delegate;

@property (nonatomic, assign) CJTKeyboardType  type;
@end
