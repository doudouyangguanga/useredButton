//
//  ZG_TimingButton.m
//  RegistButton
//
//  Created by zzg on 2018/5/11.
//  Copyright © 2018年 zzg. All rights reserved.
//  记时按钮

#import "ZG_TimingButton.h"

@implementation ZG_TimingButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UIButtonType)buttonType {
    return UIButtonTypeCustom;
}

- (void)setTimingButtonWithNormalTitle:(NSString *)title
                  withTitleColor:(UIColor *)titleColor
              withBackgroudColor:(UIColor *)backcolor {
    [self setNormalStr:title];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setBackgroundColor:backcolor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addTarget:self action:@selector(timingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setCorRadiusStyle];
}
//set
- (void)setCorRadiusStyle {
    CGFloat height = self.frame.size.height;
    self.layer.cornerRadius = height/7;
    if (@available(iOS 11.0,*)) {
        self.layer.maskedCorners = kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner | kCALayerMinXMinYCorner;
    }else {
        self.layer.masksToBounds = YES;
    }
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
}

- (void)setNormalStr:(NSString *)normalStr {
    _normalStr = normalStr;
}

- (void)setTimingStr:(NSString *)timingStr {
    _timingStr = timingStr;
}

- (void)timingButtonAction:(UIButton *)sender {
    [self startTime];
    if (self.deleagate && [self.deleagate respondsToSelector:@selector(timingButtonClickAction:)]) {
        [self.deleagate timingButtonClickAction:sender];
    }
}
#pragma mark - action
//倒计时
-(void)startTime{
    __block int timeout=59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置（倒计时结束后调用）
                self.titleLabel.text = self.normalStr;
                //设置不可点击
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;    //这里注释掉了，这个是用来测试多于60秒时计算分钟的。
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                self.titleLabel.text = [NSString stringWithFormat:@"%@ %@",self.timingStr,strTime];
                //设置可点击
                self.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
}
@end
