//
//  LKHelper.h
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#ifndef LKHelper_h
#define LKHelper_h

#define LKUIBegin(Classname) Classname *v = [[Classname alloc] initWithFrame:CGRectZero]
#define LKUIEnd [view addSubview:v]; return v;

#define LKNotImplemented() NSAssert(NO, @"Not implemented.")
#define LKMustOverride() NSAssert(NO, @"Must be overridden.")

@protocol LKUserInterfaceObject <NSObject>

/**
 Performs setup.
 @discussion Setup means setting background color, corner radius, clipping, shadow parameters, etc.
 */
- (void)setup;

/// Creates subviews.
- (void)make;

/// Localizes subviews.
- (void)localize;

/// Resets the component's state to its defaults.
- (void)reset;

/// Updates the component's data using its current state.
- (void)reloadData;

@end


@protocol LKCompoundObject <LKUserInterfaceObject>

@property (nonatomic, readonly) NSSet<id<LKUserInterfaceObject>> *childObjects;

/// Adds the specified user interface object as a child object.
- (void)addChildObject:(id<LKUserInterfaceObject>)object;

/// Removes the specified child user interface object.
- (void)removeChildObject:(id<LKUserInterfaceObject>)object;

@end


@protocol LKBindingObject <LKCompoundObject>

/// Performs binding.
- (void)bindAll;

@end

#endif /* LKHelper_h */
