//
//  LKUIFactory.h
//  LayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LKUITheme.h"
#import "LKHelper.h"

@interface LKUIFactory : NSObject

#pragma mark - Setup

+ (__kindof LKUITheme *)appTheme;
+ (Class)themeClass;

#pragma mark - UIButton

+ (UIButton *)buttonWithImageNamed:(NSString *)imageName target:(id)target action:(SEL)action superview:(UIView *)view;
+ (UIButton *)buttonWithImageNamed:(NSString *)imageName superview:(UIView *)view;
+ (UIButton *)buttonWithText:(NSString *)text
                        font:(UIFont *)font
                   textColor:(UIColor *)color
                      target:(id)target
                      action:(SEL)action
                   superview:(UIView *)view;
+ (UIButton *)buttonWithText:(NSString *)text
                        font:(UIFont *)font
                      target:(id)target
                      action:(SEL)action
                   superview:(UIView *)view;
+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action superview:(UIView *)view;
+ (UIButton *)buttonWithSuperview:(UIView *)view;
+ (UIButton *)buttonSystemWithTarget:(id)target action:(SEL)action superview:(UIView *)view;
+ (UIButton *)buttonSystemWithSuperview:(UIView *)view;

#pragma mark - UIImageView

+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName contentMode:(UIViewContentMode)mode superview:(UIView *)view;
+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName superview:(UIView *)view;

#pragma mark - UILabel

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)color
                  wordWrap:(BOOL)isWordWrap
                 superview:(UIView *)view;
+ (UILabel *)labelWithWordWrap:(BOOL)isWordWrap superview:(UIView *)view;
+ (UILabel *)labelWithSuperview:(UIView *)view;

#pragma mark - UIView

+ (UIView *)viewWithSuperview:(UIView *)view;
+ (UIView *)view;

@end
