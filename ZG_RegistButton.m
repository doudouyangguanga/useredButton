//
//  ZG_RegistButton.m
//  RegistButton
//
//  Created by zzg on 2018/5/10.
//  Copyright © 2018年 zzg. All rights reserved.
//

#import "ZG_RegistButton.h"

@implementation ZG_RegistButton
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UIButtonType)buttonType {
    return UIButtonTypeCustom;
}

- (void)setRegistButtonWithTitle:(NSString *)title
                  withTitleColor:(UIColor *)titleColor
              withBackgroudColor:(UIColor *)backcolor {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setBackgroundColor:backcolor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

//字体大小
- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font = _titleFont;
}

//设置按钮的宽度
- (void)setButtonWidth:(CGFloat)buttonWidth {
    _buttonWidth = buttonWidth;
    CGRect frame = self.frame;
    frame.size.width = _buttonWidth;
    self.frame = frame;
}

//设置按钮的高度
- (void)setButtonHeight:(CGFloat)buttonHeight {
    _buttonHeight = buttonHeight;
    CGRect frame = self.frame;
    frame.size.height = _buttonHeight;
    self.frame = frame;
}

- (void)setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    [self setShadowWithColor];
}

//set shadow color
- (void)setShadowWithColor {
    if (self.shadowColor == nil) {
        self.layer.shadowColor = [UIColor blackColor].CGColor;
    }else {
        self.layer.shadowColor = self.shadowColor.CGColor;
    }
    self.layer.shadowOffset = CGSizeMake(0.5,0.5);
    self.layer.shadowOpacity = 0.5;
}

//设置是否显示圆角
- (void)setCorStyle:(RegistButtonLayerCorRadiusStyle)corStyle {
    _corStyle = corStyle;
    switch (_corStyle) {
        case RegistButtonLayerCorRadiusNormal:
            
            break;
        case RegistButtonLayerCorRadiusRoundLittle: {
            if (self.buttonHeight == 0) {
                CGFloat height = self.frame.size.height;
                self.buttonHeight = height;
            }
            self.layer.cornerRadius = self.buttonHeight/6;
            if (@available(iOS 11.0,*)) {
                self.layer.maskedCorners = kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner | kCALayerMinXMinYCorner;
            }else {
                self.layer.masksToBounds = YES;
            }
        }
            
            break;
        case RegistButtonLayerCorRadiusRoundhalf: {
            if (self.buttonHeight == 0) {
                CGFloat height = self.frame.size.height;
                self.buttonHeight = height;
            }
            self.layer.cornerRadius = self.buttonHeight/2;
            if (@available(iOS 11.0,*)) {
                self.layer.maskedCorners = kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner | kCALayerMinXMinYCorner;
            }else {
                self.layer.masksToBounds = YES;
            }
        }
            
            break;
        default:
            break;
    }
}

//click action
- (void)registButtonAction:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(registButtonAction:)]) {
        [self.delegate registButtonAction:sender];
    }
}
@end
