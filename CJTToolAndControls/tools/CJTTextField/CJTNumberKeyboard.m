//
//  CJTNumberKeyBoard.m
//  keyboardTest
//
//  Created by chenjintian on 17/4/6.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import "CJTNumberKeyboard.h"

@implementation CJTNumberKeyboard
CGFloat const CellHeight = 54;
- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithRed:206/255.0 green:207/255.0 blue:208/255.0 alpha:1];
        self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CellHeight*4);
    }
    return self;
}

#pragma mark- private method
/**
 创建键盘
 */
- (void)createKeyboard {
    // 隔 0.5 是为了产生分割线
    CGFloat width = CGRectGetWidth(self.bounds)/3.0;
    for (int i=0; i<11; i++) {
        UIButton *buttom = [UIButton buttonWithType:0];
        [buttom setBackgroundColor:[UIColor whiteColor]];
        buttom.frame = CGRectMake(width*(i%3), CellHeight*(i/3)+0.5, width-0.5, CellHeight-0.5);
        [buttom setTitle:[self titleArray:self.type][i] forState:UIControlStateNormal];
        [buttom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttom addTarget:self action:@selector(keyboardClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttom];
    }
    
    UIButton *buttom = [UIButton buttonWithType:0];
    buttom.frame = CGRectMake(width*2, CellHeight*3+0.5, width-0.5, CellHeight-0.5);
    [buttom setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttom addTarget:self action:@selector(keyboardDelete) forControlEvents:UIControlEventTouchUpInside];
    [buttom setTitle:@"X" forState:UIControlStateNormal];
    [buttom setBackgroundColor:[UIColor colorWithRed:206/255.0 green:207/255.0 blue:208/255.0 alpha:1]];
    [self addSubview:buttom];
    
}

- (NSArray *)titleArray:(CJTKeyboardType)type{
    if (type == CJTNumberKeyboardDefault) {
        return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0"];
    }
    else if (type == CJTNumberKeyboardDouble) {
        return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0"];
    }
    else if (type == CJTNumberKeyboardID) {
        return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"X",@"0"];
    }
//    NSAssert(0, @"错误，自定义键盘类型必须符合要求");
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0"];
}

#pragma mark- event response
- (void)keyboardClick:(UIButton *)sender {
    if (sender.currentTitle.length == 0) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(numberKeyboard:replacementString:)]) {
        [self.delegate numberKeyboard:self replacementString:sender.currentTitle];
    }
}

- (void)keyboardDelete {
    if ([self.delegate respondsToSelector:@selector(textFieldShouldDelete:)]) {
        [self.delegate textFieldShouldDelete:self];
    }
}

#pragma mark- getter/setter
- (void)setType:(CJTKeyboardType)type {
    _type = type;
    [self createKeyboard];
}

@end
