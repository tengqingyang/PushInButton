//
//  TQYPushInButton.h
//  弹簧按钮
//
//  Created by 腾庆阳 on 2017/7/15.
//  Copyright © 2017年 腾庆阳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PushBtnClick)();

@interface TQYPushInButton : UIButton


@property (nonatomic ,copy) PushBtnClick  clickBlock;

@property (nonatomic, assign) CGFloat buttonScale;//缩小的比率，小于=1.0,

// 此方法只是实现功能
+ (TQYPushInButton *)initPushBtn;


// 此方法把一些参数集成在内部
+ (TQYPushInButton *)initPushBtnWithType:(UIButtonType)type
                                   frame:(CGRect)frame
                                   title:(NSString *)title
                                    font:(int)font
                              titleColor:(UIColor *)color
                         backgroundColor:(UIColor *)backgroundColor
                         backgroundImage:(NSString *)image
                                andBlock:(PushBtnClick)tempBlock;

//此方法初始化的按钮，点击后，在按钮frame内部松手，执行响应，拖出frame区域松手，响应取消
+ (TQYPushInButton *)touchUpOutsideCancelButtonWithType:(UIButtonType)type
                                                   frame:(CGRect)frame
                                                   title:(NSString *)title
                                                    font:(int)font
                                              titleColor:(UIColor *)color
                                         backgroundColor:(UIColor *)backgroundColor
                                         backgroundImage:(NSString *)image
                                                andBlock:(PushBtnClick)tempBlock;

@end
