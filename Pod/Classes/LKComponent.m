//
//  LKComponent.m
//  LayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKComponent.h"

@interface LKComponent ()

@property (nonatomic, assign) BOOL instantiated;

#pragma mark - Utils

- (void)instantiate;

@end


@implementation LKView

#pragma mark - Root

- (void)updateConstraints {
    // may be overridden to perform layout
    [super updateConstraints];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (!self.instantiated) {
        [self instantiate];
    }
    [self setNeedsLayout];
}

#pragma mark - Data

- (void)setup {
    self.clipsToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
}

- (void)make {
    // empty
}

- (void)localize {
    // empty
}

#pragma mark - Data

- (void)reloadData {
    // empty
}

- (void)reset {
    // empty
}

#pragma mark - Utils

- (void)instantiate {
    if (self.instantiated) {
        return;
    }
    self.instantiated = YES;
    [self setup];
    [self make];
    [self localize];
}

@end
