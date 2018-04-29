//
//  LKMarkupView.h
//  AFNetworking
//
//  Created by Георгий Малюков on 26.03.2018.
//

#import <UIKit/UIKit.h>

/// Represents an utility view helping to visualize markup of your screen without specifying concrete subviews classes.
@interface LKMarkupView : UIView

/// Sets up the title's color. Black by default.
@property (nonatomic, strong) UIColor *textColor;

/// If YES then the view's actual origin will be displayed in title.
@property (nonatomic, assign) BOOL shouldDisplayPosition;

/// If YES then the view's actual size will be displayed in title.
@property (nonatomic, assign) BOOL shouldDisplaySize;

@end
