//
//  toast.h
//  Toast
//
//  Created by jkc on 16/5/23.
//  Copyright © 2016年 cjt. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 类似安卓的 toast
 */
@interface toast : UIView

@property (nonatomic,strong) UILabel *label;/**< 文本控件*/

//MARK:- method
/**
 显示 toast
 */
void toastString(NSString *string);

/**
 显示 toast 到 window 上
 */
+ (void)toastString:(NSString *)string;

/**
 初始化控件（如果想要单独定义特殊的文本时候使用）
 
 */
-(instancetype)initWithString:(NSString*)str;
@end

