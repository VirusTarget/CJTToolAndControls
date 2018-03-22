//
//  toast.m
//  Toast
//
//  Created by jkc on 16/5/23.
//  Copyright © 2016年 cjt. All rights reserved.
//

#import "toast.h"

@implementation toast

void toastString(NSString *string) {
    toast *t = [[toast alloc] initWithString:string];
    [[UIApplication sharedApplication].windows[0] addSubview:t];
}

+ (void)toastString:(NSString *)string {
    toastString(string);
}

-(instancetype)initWithString:(NSString*)str {
    if (self = [super init]) {
        [self LabelString:str];
    }
    return self;
}

-(void)LabelString:(NSString *)str {
    /*获取屏幕尺寸*/
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    /*获取文字所占的尺寸*/
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:20]};
    CGRect Rect = [str boundingRectWithSize:CGSizeMake(width*0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
    /*设置label*/
    self.label.frame = CGRectMake(0, 0, Rect.size.width + 20, Rect.size.height + 10);
    self.label.center = CGPointMake(width/2.0, height/2.0);
    self.label.text = str;
    self.label.alpha = 0;
    
    [self addSubview:self.label];
    
    /*0.3秒淡入*/
    [UIView animateWithDuration:0.3 animations:^{
        self.label.alpha = 1;
    }];
    
    /*0.3秒淡出*/
    [UIView animateWithDuration:0.3
                          delay:2.1
                        options:UIViewAnimationOptionCurveEaseIn animations:^{
                            self.label.alpha = 0;
                        }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

//MARK:- getter/setter
-(UILabel *)label {
    if(!_label) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor blackColor];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        _label.clipsToBounds = YES;
        _label.font = [UIFont systemFontOfSize:20];
        _label.layer.cornerRadius = 5;
    }
    return _label;
}
@end


