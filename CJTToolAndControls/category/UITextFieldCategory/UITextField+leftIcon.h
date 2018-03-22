//
//  UITextField+leftIcon.h
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/25.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (leftIcon)

/**
 增加输入框左边图标

 @param imageName 图片名称
 */
- (void)addLeftIconbyImageName:(NSString *)imageName;

/**
 增加输入框左边图标

 @param image 图片
 */
- (void)addLeftIcon:(UIImage *)image;
@end
