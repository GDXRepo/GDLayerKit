//
//  LKComponent.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKComponent.h"

@implementation LKComponent

@synthesize instantiated = _instantiated;

#pragma mark - Root

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (!self.instantiated) {
        _instantiated = YES;
        [self setup];
        [self make];
    }
    [self setNeedsLayout];
}

#pragma mark - LKUIReusable

- (void)updateConstraints {
    [super updateConstraints];
}

- (void)reset {
    // empty
}

- (void)setup {
    self.clipsToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
}

- (void)make {
    // empty
}

- (void)reloadData {
    // empty
}

@end
