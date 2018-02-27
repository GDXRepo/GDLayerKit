//
//  LKHelper.h
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#ifndef LKHelper_h
#define LKHelper_h

#define LKMake \
    if (self.instantiated) { \
        return; \
    } \
    [super make];

#define LKUIBegin(Classname) Classname *v = [[Classname alloc] initWithFrame:CGRectZero]
#define LKUIEnd [view addSubview:v]; return v;

@protocol LKUIConfigurable <NSObject>

/**
 Performs setup.
 @discussion Setup means setting background color, corner radius, clipping, shadow parameters, etc.
 */
- (void)setup;

/// Creates subviews.
- (void)make;

/// Localizes subviews.
- (void)localize;

/// Updates the component's data using its current state.
- (void)reloadData;

@end


@protocol LKView <LKUIConfigurable>

/// Updates constraints using SnapKit/Masonry library.
- (void)updateViewConstraints;

/// Performs binding.
- (void)bindAll;

@end


@protocol LKComponent <LKUIConfigurable>

@property (nonatomic, readonly) BOOL instantiated;

/// Updates constraints using SnapKit/Masonry library.
- (void)updateConstraints;

/// Resets the component's state to its defaults.
- (void)reset;

@end

#endif /* LKHelper_h */
