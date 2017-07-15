//
//  TQYPushInButton.m
//  弹簧按钮
//
//  Created by 腾庆阳 on 2017/7/15.
//  Copyright © 2017年 腾庆阳. All rights reserved.
//

#import "TQYPushInButton.h"

#define animateDelay 0.15   //默认动画执行时间
#define defaultScale 0.9    //默认缩小的比率

@implementation TQYPushInButton



+ (TQYPushInButton *)initPushBtn
{
    TQYPushInButton * pushBtn = [TQYPushInButton new];
    [pushBtn addTarget:pushBtn action:@selector(pressedEvent:) forControlEvents:UIControlEventTouchDown];
    [pushBtn addTarget:pushBtn action:@selector(unpressedEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    return pushBtn;

}

+ (TQYPushInButton *)initPushBtnWithType:(UIButtonType)type
                                   frame:(CGRect)frame
                                   title:(NSString *)title
                                    font:(int)font
                              titleColor:(UIColor *)color
                         backgroundColor:(UIColor *)backgroundColor
                         backgroundImage:(NSString *)image
                                andBlock:(PushBtnClick)tempBlock

{
    TQYPushInButton * pushBtn = [TQYPushInButton buttonWithType:type];
    pushBtn.frame = frame;
    [pushBtn setTitle:title forState:UIControlStateNormal];
    [pushBtn setTitleColor:color forState:UIControlStateNormal];
    [pushBtn setBackgroundColor:backgroundColor];
    pushBtn.titleLabel.font = [UIFont systemFontOfSize:font];
    [pushBtn addTarget:pushBtn action:@selector(pressedEvent:) forControlEvents:UIControlEventTouchDown];
    [pushBtn addTarget:pushBtn action:@selector(unpressedEvent:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    [pushBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    pushBtn.clickBlock = tempBlock;
    
    return pushBtn;
}

+ (TQYPushInButton *)touchUpOutsideCancelButtonWithType:(UIButtonType)type
                                                   frame:(CGRect)frame
                                                   title:(NSString *)title
                                                    font:(int)font
                                              titleColor:(UIColor *)color
                                         backgroundColor:(UIColor *)backgroundColor
                                         backgroundImage:(NSString *)image
                                                andBlock:(PushBtnClick)tempBlock
{
    TQYPushInButton * pushBtn = [TQYPushInButton buttonWithType:type];
    pushBtn.frame = frame;
    [pushBtn setTitle:title forState:UIControlStateNormal];
    [pushBtn setTitleColor:color forState:UIControlStateNormal];
    [pushBtn setBackgroundColor:backgroundColor];
    pushBtn.titleLabel.font = [UIFont systemFontOfSize:font];
    [pushBtn addTarget:pushBtn action:@selector(pressedEvent:) forControlEvents:UIControlEventTouchDown];
    [pushBtn addTarget:pushBtn action:@selector(cancelEvent:) forControlEvents:UIControlEventTouchUpOutside];
    [pushBtn addTarget:pushBtn action:@selector(unpressedEvent:) forControlEvents:UIControlEventTouchUpInside];
    [pushBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    //给按钮的block赋值
    pushBtn.clickBlock = tempBlock;
    
    return pushBtn;
}


//按钮的压下事件 按钮缩小
- (void)pressedEvent:(TQYPushInButton *)btn
{
    
    //缩放比例必须大于0，且小于等于1
    CGFloat scale = (_buttonScale && _buttonScale <=1.0) ? _buttonScale : defaultScale;
    
    [UIView animateWithDuration:animateDelay animations:^{
        btn.transform = CGAffineTransformMakeScale(scale, scale);
    }];
    
}
//点击手势拖出按钮frame区域松开，响应取消
- (void)cancelEvent:(TQYPushInButton *)btn
{
    [UIView animateWithDuration:animateDelay animations:^{
        btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        
    }];
}
//按钮的松开事件 按钮复原 执行响应
- (void)unpressedEvent:(TQYPushInButton *)btn
{
    [UIView animateWithDuration:animateDelay animations:^{
        btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        //执行动作响应
        if (self.clickBlock) {
            self.clickBlock();
        }
    }];
}

@end
