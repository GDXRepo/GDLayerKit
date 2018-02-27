//
//  LKUIFactory.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKUIFactory.h"

@implementation LKUIFactory

#pragma mark - Setup

+ (__kindof LKUITheme *)appTheme {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self themeClass] alloc] init];
    });
    return instance;
}

+ (Class)themeClass {
    return LKUITheme.class;
}

#pragma mark - UIButton

+ (UIButton *)buttonWithImageNamed:(NSString *)imageName target:(id)target action:(SEL)action superview:(UIView *)view {
    UIButton *v = [UIButton buttonWithType:UIButtonTypeSystem];
    [v setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (target && action) {
        [v addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    LKUIEnd;
}

+ (UIButton *)buttonWithImageNamed:(NSString *)imageName superview:(UIView *)view {
    return [self.class buttonWithImageNamed:imageName target:nil action:nil superview:view];
}

+ (UIButton *)buttonWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color target:(id)target action:(SEL)action superview:(UIView *)view {
    UIButton *v = [UIButton buttonWithType:UIButtonTypeCustom];
    NSDictionary *attri = @{
                            NSFontAttributeName : font,
                            NSForegroundColorAttributeName : color
                            };
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:text attributes:attri];
    [v setAttributedTitle:string forState:UIControlStateNormal];
    if (target && action) {
        [v addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    LKUIEnd;
}

+ (UIButton *)buttonWithText:(NSString *)text font:(UIFont *)font target:(id)target action:(SEL)action superview:(UIView *)view {
    return [self.class buttonWithText:text
                                 font:font
                            textColor:[UIColor blackColor]
                               target:target
                               action:action
                            superview:view];
}

+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action superview:(UIView *)view {
    UIButton *v = [UIButton buttonWithType:UIButtonTypeCustom];
    [v setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if (target && action) {
        [v addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    LKUIEnd;
}

+ (UIButton *)buttonWithSuperview:(UIView *)view {
    return [self.class buttonWithTarget:nil action:nil superview:view];
}

+ (UIButton *)buttonSystemWithTarget:(id)target action:(SEL)action superview:(UIView *)view {
    UIButton *v = [UIButton buttonWithType:UIButtonTypeSystem];
    if (target && action) {
        [v addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    LKUIEnd;
}

+ (UIButton *)buttonSystemWithSuperview:(UIView *)view {
    return [self.class buttonSystemWithTarget:nil action:nil superview:view];
}

#pragma mark - UIImageView

+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName contentMode:(UIViewContentMode)mode superview:(UIView *)view {
    LKUIBegin(UIImageView);
    v.image = [UIImage imageNamed:imageName];
    v.contentMode = mode;
    LKUIEnd;
}

+ (UIImageView *)imageViewWithImageNamed:(NSString *)imageName superview:(UIView *)view {
    return [self.class imageViewWithImageNamed:imageName contentMode:UIViewContentModeScaleAspectFit superview:view];
}

#pragma mark - UILabel

+ (UILabel *)labelWithFont:(UIFont *)font textColor:(UIColor *)color wordWrap:(BOOL)isWordWrap superview:(UIView *)view {
    LKUIBegin(UILabel);
    if (isWordWrap) {
        v.lineBreakMode = NSLineBreakByWordWrapping;
        v.numberOfLines = 0;
    }
    else {
        v.lineBreakMode = NSLineBreakByTruncatingTail;
        v.numberOfLines = 1;
    }
    NSAssert(font, @"Invalid font.");
    v.font = font;
    v.textColor = color;
    LKUIEnd;
}

+ (UILabel *)labelWithWordWrap:(BOOL)isWordWrap superview:(UIView *)view {
    return [self.class labelWithFont:[UIFont systemFontOfSize:17]
                           textColor:[UIColor whiteColor]
                            wordWrap:isWordWrap
                           superview:view];
}

+ (UILabel *)labelWithSuperview:(UIView *)view {
    return [self.class labelWithWordWrap:YES superview:view];
}

#pragma mark - UIView

+ (UIView *)viewWithSuperview:(UIView *)view {
    LKUIBegin(UIView);
    LKUIEnd;
}

+ (UIView *)view {
    return [self.class viewWithSuperview:nil];
}

@end

