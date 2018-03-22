//
//  UITextField+Password.m
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/15.
//
//

#import "UITextField+Password.h"

@implementation UITextField (Password)
- (void)addPasswordEye {
    self.secureTextEntry = YES;
    
    UIButton *eyeBtn = [UIButton buttonWithType:0];
    [eyeBtn setImage:[UIImage imageNamed:@"icon_eye"] forState:UIControlStateNormal];
    [eyeBtn setImage:[UIImage imageNamed:@"icon_eye_on"] forState:UIControlStateSelected];
    [eyeBtn addTarget:self action:@selector(passwordStateChange:) forControlEvents:UIControlEventTouchUpInside];
    [eyeBtn sizeToFit];
    eyeBtn.frame = CGRectMake(0, 0, CGRectGetWidth(eyeBtn.frame) + 20, CGRectGetWidth(self.frame));
    
    self.rightView = eyeBtn;
    self.rightViewMode = UITextFieldViewModeAlways;
}

#pragma mark - event response
- (void)passwordStateChange:(UIButton *)sender {
    self.secureTextEntry = sender.selected;
    sender.selected = !sender.selected;
}

- (void)eyeOpen {
    self.secureTextEntry = NO;
    UIButton *eyeBtn = (UIButton *)self.rightView;
    eyeBtn.selected = YES;
}

@end
