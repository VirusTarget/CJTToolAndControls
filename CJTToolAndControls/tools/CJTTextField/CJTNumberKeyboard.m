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
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0.5)];
        line.backgroundColor = self.backgroundColor;
        [self addSubview:line];
    }
    return self;
}

#pragma mark- private method
/**
 创建键盘
 */
- (void)createKeyboard {
    self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CellHeight*4);
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

- (void)createLicenceKeyboard {
    self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetWidth([UIScreen mainScreen].bounds)/9.0*4);
    CGFloat width = CGRectGetWidth(self.bounds)/9.0;
    for (int i=0; i<33; i++) {
        UIButton *buttom = [UIButton buttonWithType:0];
        [buttom setBackgroundColor:[UIColor whiteColor]];
        buttom.frame = CGRectMake(width*(i%9), 0.5+width*(i/9), width-0.5, width-0.5);
        [buttom setTitle:[self titleArray:self.type][i] forState:UIControlStateNormal];
        [buttom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttom addTarget:self action:@selector(keyboardClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttom];
    }
    UIButton *buttom = [UIButton buttonWithType:0];
    buttom.frame = CGRectMake(width*6, 0.5+width*3, width*3, width-0.5);
    [buttom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttom addTarget:self action:@selector(keyboardDone) forControlEvents:UIControlEventTouchUpInside];
    [buttom setTitle:@"完成" forState:UIControlStateNormal];
    [buttom setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:buttom];
}

- (void)createCarCardKeyboard {
    self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetWidth([UIScreen mainScreen].bounds)/9.0*6);
    CGFloat height = CGRectGetWidth(self.bounds)/9.0;
    
    for (int i=0; i<5; i++) {
        CGFloat width = CGRectGetWidth(self.bounds)/5.0;
        UIButton *buttom = [UIButton buttonWithType:0];
        [buttom setBackgroundColor:[UIColor whiteColor]];
        buttom.frame = CGRectMake(width*i, 0.5, width-0.5, height-0.5);
        [buttom setTitle:[self titleArray:self.type][i] forState:UIControlStateNormal];
        [buttom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttom addTarget:self action:@selector(keyboardClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttom];
    }
    for (int i=5; i<15; i++) {
        CGFloat width = CGRectGetWidth(self.bounds)/10.0;
        UIButton *buttom = [UIButton buttonWithType:0];
        [buttom setBackgroundColor:[UIColor whiteColor]];
        buttom.frame = CGRectMake(width*(i-5), 0.5+height, width-0.5, height-0.5);
        [buttom setTitle:[self titleArray:self.type][i] forState:UIControlStateNormal];
        [buttom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttom addTarget:self action:@selector(keyboardClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttom];
    }
    for (int i=15; i<15+27; i++) {
        UIButton *buttom = [UIButton buttonWithType:0];
        [buttom setBackgroundColor:[UIColor whiteColor]];
        buttom.frame = CGRectMake(height*((i-15)%9), 0.5+height*((i-15)/9+2), height-0.5, height-0.5);
        [buttom setTitle:[self titleArray:self.type][i] forState:UIControlStateNormal];
        [buttom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttom addTarget:self action:@selector(keyboardClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:buttom];
    }
    UIButton *buttom = [UIButton buttonWithType:0];
    buttom.frame = CGRectMake(0, 0.5+height*5, CGRectGetWidth([UIScreen mainScreen].bounds)*0.8-0.5, height-0.5);
    [buttom setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttom addTarget:self action:@selector(keyboardDone) forControlEvents:UIControlEventTouchUpInside];
    [buttom setBackgroundColor:[UIColor whiteColor]];
    [buttom setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:buttom];
    UIButton *deleteBtn = [UIButton buttonWithType:0];
    deleteBtn.frame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)*0.8, 0.5+height*5, CGRectGetWidth([UIScreen mainScreen].bounds)*0.2, height-0.5);
    [deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(keyboardDelete) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn setBackgroundColor:[UIColor whiteColor]];
    [deleteBtn setTitle:@"X" forState:UIControlStateNormal];
    [self addSubview:deleteBtn];
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
    else if (type == CJTLicenceKeyboard) {
        return @[@"京",@"沪",@"津",@"渝",@"冀",@"晋",@"蒙",@"辽",@"吉",@"黑",
                 @"苏",@"浙",@"皖",@"闽",@"赣",@"鲁",@"豫",@"鄂",@"湘",@"粤",
                 @"桂",@"琼",@"川",@"贵",@"云",@"藏",@"陕",@"甘",@"青",@"宁",
                 @"新",@"澳",@"港"];
    }
    else if (type == CJTCarCardKeyboard) {
        return @[@"港",@"澳",@"学",@"警",@"领",
                 @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",
                 @"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",
                 @"P",@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",
                 @"L",@"Z",@"X",@"C",@"V",@"B",@"N",@"M",@"",];
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

- (void)keyboardDone {
    if ([self.delegate respondsToSelector:@selector(textFieldShouldDone:)]) {
        [self.delegate textFieldShouldDone:self];
    }
}
#pragma mark- getter/setter
- (void)setType:(CJTKeyboardType)type {
    _type = type;
    if (type == CJTLicenceKeyboard) {
        [self createLicenceKeyboard];
    }
    else if (type == CJTCarCardKeyboard) {
        [self createCarCardKeyboard];
    }
    else
        [self createKeyboard];
}

@end
