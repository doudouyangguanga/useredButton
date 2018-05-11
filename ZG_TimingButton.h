//
//  ZG_TimingButton.h
//  RegistButton
//
//  Created by zzg on 2018/5/11.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimingButtonClickActionDeleagate<NSObject>
- (void)timingButtonClickAction:(UIButton *)sender;
@end
@interface ZG_TimingButton : UIButton
@property (nonatomic, weak) id <TimingButtonClickActionDeleagate>deleagate;
@property (nonatomic, copy) NSString    *normalStr;     //默认状体下的字符串
@property (nonatomic, copy) NSString    *timingStr;     //计时状态下的字符串
//button titlelabel font
@property (nonatomic, strong) UIFont *titleFont;

- (void)setTimingButtonWithNormalTitle:(NSString *)title
                  withTitleColor:(UIColor *)titleColor
              withBackgroudColor:(UIColor *)backcolor;
@end
