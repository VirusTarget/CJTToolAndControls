//
//  TestKeyboardViewController.m
//  CJTToolAndControls
//
//  Created by 陈晋添 on 2018/3/23.
//  Copyright © 2018年 cjt. All rights reserved.
//

#import "TestKeyboardViewController.h"

#import "CJTTextField.h"
@interface TestKeyboardViewController ()

@end

@implementation TestKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIStackView *stackView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    stackView.alignment = UIStackViewAlignmentFill;
    
    for (int i=0; i<6; i++) {
        CJTTextField *textField = [[CJTTextField alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*0.6, 44)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.placeholder = @[@"纯数字",@"小数点数字",@"身份证",@"系统键盘",@"省份简称",@"车牌"][i];
        textField.type = i;
        [stackView addArrangedSubview:textField];
    }
    
    stackView.center = self.view.center;
    [self.view addSubview:stackView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
