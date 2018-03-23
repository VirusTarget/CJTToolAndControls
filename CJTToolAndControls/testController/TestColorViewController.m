//
//  TestColorViewController.m
//  CJTToolAndControls
//
//  Created by 陈晋添 on 2018/3/23.
//  Copyright © 2018年 cjt. All rights reserved.
//

#import "TestColorViewController.h"

#import "UIColor+Extension.h"

@interface TestColorViewController ()

@end

@implementation TestColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*0.6, 44)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"输入颜色0x000000";
    [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    textField.center = self.view.center;
    [self.view addSubview:textField];
}

- (void)textChange:(UITextField *)textField {
    self.view.backgroundColor = [UIColor colorWithHexString:textField.text];
}

@end
