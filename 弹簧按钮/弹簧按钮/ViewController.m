//
//  ViewController.m
//  弹簧按钮
//
//  Created by 腾庆阳 on 2017/7/15.
//  Copyright © 2017年 腾庆阳. All rights reserved.
//

#import "ViewController.h"
#import "TQYPushInButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    TQYPushInButton *btn = [TQYPushInButton initPushBtn];
//    btn.frame = CGRectMake(100, 100, 200, 100);
//    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:30];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    btn.adjustsImageWhenHighlighted = NO;//去除按钮的按下效果（阴影）
//    btn.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:btn];
//    
//    btn.clickBlock = ^{
//       NSLog(@"-------------  2  --------------");
//    };
    
    
    TQYPushInButton *btn1 = [TQYPushInButton initPushBtnWithType:UIButtonTypeCustom frame:CGRectMake(100, 400, 200, 200) title:@"都点我" font:30 titleColor:[UIColor greenColor] backgroundColor:[UIColor yellowColor] backgroundImage:nil andBlock:^{
        
        NSLog(@"-------------  click  点击  --------------");
    }];
    [self.view addSubview:btn1];

}
// 点击回调
- (void)btnClick
{
    NSLog(@"-------------  点击  --------------");
}




@end
