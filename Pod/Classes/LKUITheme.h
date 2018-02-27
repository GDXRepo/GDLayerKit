//
//  LKUITheme.h
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef UIColorFromHex
#define UIColorFromHex(hexValue) \
    [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
                    green:((float)((hexValue & 0x00FF00) >>  8))/255.0 \
                     blue:((float)((hexValue & 0x0000FF) >>  0))/255.0 \
                    alpha:1.0]
#endif

#ifndef UIColorFromRGB
#define UIColorFromRGB(R, G, B) \
    [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#endif

@interface LKUITheme : NSObject

@property (nonatomic, readonly) UIColor *colorBackground;
@property (nonatomic, readonly) UIColor *colorText;
@property (nonatomic, readonly) NSString *fontNameDefault;
@property (nonatomic, readonly) CGFloat fontSizeDefault;
@property (nonatomic, readonly) UIFontWeight fontWeightDefault;

#pragma mark - Font

- (UIFont *)fontWithSize:(CGFloat)size weight:(UIFontWeight)weight;
- (UIFont *)fontWithWeight:(UIFontWeight)weight;
- (UIFont *)fontWithSize:(CGFloat)size;
- (UIFont *)fontDefault;

@end
