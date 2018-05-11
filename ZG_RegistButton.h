//
//  ZG_RegistButton.h
//  RegistButton
//
//  Created by zzg on 2018/5/10.
//  Copyright © 2018年 zzg. All rights reserved.
//  注册按钮

#import <UIKit/UIKit.h>

@protocol RegistButtonActionDelegate<NSObject>
- (void)registButtonAction:(UIButton *)sender;
@end

typedef NS_ENUM(NSInteger, RegistButtonLayerCorRadiusStyle) {
    RegistButtonLayerCorRadiusNormal,             //无圆角
    RegistButtonLayerCorRadiusRoundLittle,        //有小圆角
    RegistButtonLayerCorRadiusRoundhalf,          //有半圆角
};

@interface ZG_RegistButton : UIButton
//corRadius or not
@property (nonatomic, assign) RegistButtonLayerCorRadiusStyle corStyle;
//button titlelabel font
@property (nonatomic, strong) UIFont *titleFont;
//the width of button
@property (nonatomic, assign) CGFloat buttonWidth;
//the height of button
@property (nonatomic, assign) CGFloat buttonHeight;
//shaow color
@property (nonatomic, strong) UIColor *shadowColor;

@property (nonatomic, weak) id <RegistButtonActionDelegate>delegate;

- (void)setRegistButtonWithTitle:(NSString *)title
                  withTitleColor:(UIColor *)titleColor
              withBackgroudColor:(UIColor *)backcolor;
@end

