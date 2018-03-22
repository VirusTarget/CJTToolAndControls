//
//  UITextField+leftIcon.m
//  NdComPlatform
//
//  Created by 陈晋添 on 2017/9/25.
//
//

#import "UITextField+leftIcon.h"

#define INPUT_ICON_SIZE 17.3
@implementation UITextField (leftIcon)

- (void)addLeftIconbyImageName:(NSString *)imageName {
    [self addLeftIcon:[UIImage imageNamed:imageName]];
}

- (void)addLeftIcon:(UIImage *)image {
    UIImageView *leftIconImg = [[UIImageView alloc]init];
    leftIconImg.frame = CGRectMake(0, 0, INPUT_ICON_SIZE, INPUT_ICON_SIZE);
    leftIconImg.center = CGPointMake(leftIconImg.center.x, self.center.y);
    leftIconImg.contentMode =  UIViewContentModeScaleAspectFit;
    leftIconImg.image = image;
    [self.superview addSubview:leftIconImg];
    
    self.frame = CGRectMake(CGRectGetWidth(leftIconImg.frame)+10, CGRectGetMinY(self.frame), CGRectGetWidth(self.frame)-CGRectGetWidth(leftIconImg.frame) - 10, CGRectGetHeight(leftIconImg.frame));
}

@end
