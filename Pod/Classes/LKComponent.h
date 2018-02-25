//
//  LKComponent.h
//  LayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "LKUIFactory.h"

#define LKComponentMake \
    if (self.instantiated) { \
        return; \
    } \
    [super make];

/// Represents reusable UI component.
@interface LKComponent : UIView

@property (nonatomic, readonly) BOOL instantiated;

#pragma mark - Root

/// Updates constraints using SnapKit/Masonry library.
- (void)updateConstraints;

#pragma mark - Setup

/**
 Performs setup.
 @discussion Setup means setting background color, corner radius, clipping, shadow parameters, etc.
 */
- (void)setup;

/// Creates subviews.
- (void)make;

/// Localizes the control and its subviews.
- (void)localize;

#pragma mark - Data

/// Updates the control's data using its current state.
- (void)reloadData;

/// Resets the control's state to its defaults.
- (void)reset;

@end

