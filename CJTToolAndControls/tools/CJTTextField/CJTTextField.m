//
//  CJTNumberTextField.m
//  keyboardTest
//
//  Created by chenjintian on 17/4/6.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import "CJTTextField.h"
#import "CJTNumberKeyboard.h"

@interface CJTTextField()
@property (nonatomic, strong) CJTNumberKeyboard  *numberKeyboard;
@end
@implementation CJTTextField
/// 选择范围
- (NSRange)selectedRange {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

/**
 设置选择范围
 */
- (void)setSelectedRange:(NSRange)range {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

#pragma mark- <CJTNumberKeyBoardDelegate>
- (void)numberKeyboard:(CJTNumberKeyboard *)numberKeyboard replacementString:(NSString *)string {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:string];
    }
    
    if (self.type == CJTNumberKeyboardDouble && [self.text containsString:@"."] && [string containsString:@"."]) {
        canEditor = NO;
    }
    if (canEditor) {
        [self replaceRange:self.selectedTextRange withText:string];
    }
}

- (void)textFieldShouldDelete:(CJTNumberKeyboard *)numberKeyboard {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:@""];
    }
    if (canEditor) {
        [self deleteBackward];
    }
}

#pragma mark- getter/setter
- (CJTNumberKeyboard *)numberKeyboard {
    if (!_numberKeyboard) {
        _numberKeyboard = [[CJTNumberKeyboard alloc] init];
        _numberKeyboard.delegate = self;
        
        self.inputView = _numberKeyboard;
    }
    return _numberKeyboard;
}

- (void)setType:(CJTKeyboardType)type {
    _type = type;
    if (type != SYSTEMKeyboard) {
        self.numberKeyboard.type = type;
    }
}
@end
