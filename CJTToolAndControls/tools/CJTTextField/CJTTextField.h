//
//  CJTNumberTextField.h
//  keyboardTest
//
//  Created by chenjintian on 17/4/6.
//  Copyright © 2017年 CJT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJTNumberKeyboard.h"

@interface CJTTextField : UITextField<CJTNumberKeyBoardDelegate>

@property (nonatomic, assign) CJTKeyboardType  type;

@end
