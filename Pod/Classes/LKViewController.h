//
//  LKViewController.h
//  LayerKit
//
//  Created by Georgiy Malyukov on 25.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKViewModel.h"

/// Implements app's screen. Reflects View(Controller) entity in the MVVM architecture pattern.
@interface LKViewController : UIViewController

@property (nonatomic, readonly) LKViewModel *viewModel;

#pragma mark - Root

#warning TODO This is correct, but when and where should we create controllers?
- (instancetype)initWithViewModel:(LKViewModel *)model;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

#pragma mark - Setup

/// Creates all the subviews.
- (void)make;

/// Updates constraints using SnapKit/Masonry library.
- (void)updateViewConstraints;

/// Determines view's behavior depending on binded properties.
- (void)bind;

/// Localizes static UI elements.
- (void)localize;

/// Refreshes all subviews using current viewModel's state.
- (void)reloadData;

#pragma mark - Utils

/// Hides keyboard.
- (void)hideKeyboard;

@end
