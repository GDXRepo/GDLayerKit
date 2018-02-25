//
//  LKUITheme.m
//  LayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKUITheme.h"

@implementation LKUITheme

#pragma mark - Font

- (UIFont *)fontWithSize:(CGFloat)size weight:(UIFontWeight)weight {
    NSString *suffix = @"";
#define LKFONTSUFFIX(weightValue, suffixValue) \
    if (weight == weightValue) { \
        suffix = suffixValue; \
    }
    LKFONTSUFFIX(UIFontWeightBlack, @"Black");
    LKFONTSUFFIX(UIFontWeightBold, @"Bold");
    LKFONTSUFFIX(UIFontWeightHeavy, @"Heavy");
    LKFONTSUFFIX(UIFontWeightLight, @"Light");
    LKFONTSUFFIX(UIFontWeightMedium, @"Medium");
    LKFONTSUFFIX(UIFontWeightRegular, @"Regular");
    LKFONTSUFFIX(UIFontWeightSemibold, @"Semibold");
    LKFONTSUFFIX(UIFontWeightThin, @"Thin");
    LKFONTSUFFIX(UIFontWeightUltraLight, @"UltraLight");
#undef LKFONTSUFFIX
    NSString *name = (suffix.length > 0
                      ? [NSString stringWithFormat:@"%@-%@", self.fontNameDefault, suffix]
                      : self.fontNameDefault);
    UIFont *font = [UIFont fontWithName:name size:size];
    NSAssert(font, @"Unable to create font \"%@\" with weight %.0f", self.fontNameDefault, weight);
    return font;
}

- (UIFont *)fontWithWeight:(UIFontWeight)weight {
    return [self fontWithSize:self.fontSizeDefault weight:weight];
}

- (UIFont *)fontWithSize:(CGFloat)size {
    return [self fontWithWeight:UIFontWeightRegular];
}

- (UIFont *)fontDefault {
    return [self fontWithSize:self.fontSizeDefault weight:self.fontWeightDefault];
}

#pragma mark - Properties

- (UIColor *)colorBackground {
    return [UIColor whiteColor];
}

- (UIColor *)colorText {
    return [UIColor blackColor];
}

- (NSString *)fontNameDefault {
    return @"HelveticaNeue";
}

- (CGFloat)fontSizeDefault {
    return 12;
}

- (UIFontWeight)fontWeightDefault {
    return UIFontWeightRegular;
}

@end
