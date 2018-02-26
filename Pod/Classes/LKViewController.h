//
//  LKViewController.h
//  LayerKit
//
//  Created by Georgiy Malyukov on 25.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "LKViewModel.h"
#import "LKUIFactory.h"
#import "LKHelper.h"

/// Implements app's screen. Reflects View(Controller) entity in the MVVM architecture pattern.
@interface LKViewController : UIViewController <LKUIConfigurable>

@property (nonatomic, readonly) LKViewModel *viewModel;
@property (nonatomic, readonly) Class viewModelClass;

#pragma mark - Setup

/// Updates constraints using SnapKit/Masonry library.
- (void)updateViewConstraints;

/// Determines view's behavior depending on binded properties.
- (void)bindAll;

/// Localizes view and its subviews.
- (void)localize;

#pragma mark - Utils

/// Hides keyboard.
- (void)hideKeyboard;

@end
