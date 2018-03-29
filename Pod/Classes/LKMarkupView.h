//
//  LKMarkupView.h
//  AFNetworking
//
//  Created by Георгий Малюков on 26.03.2018.
//

#import <UIKit/UIKit.h>

@interface LKMarkupView : UIView

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) BOOL shouldDisplayPosition;
@property (nonatomic, assign) BOOL shouldDisplaySize;

#pragma mark - Layout

- (void)updateConstraints;

@end
