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
        [self setup];
        [self make];
        [self localize];
        _instantiated = YES;
    }
    [self setNeedsLayout];
}

#pragma mark - LKComponent

- (void)setup {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.clipsToBounds = NO;
    self.backgroundColor = [UIColor clearColor];
}

- (void)make {
    // empty
}

- (void)updateConstraints {
    [super updateConstraints];
}

- (void)localize {
    // empty
}

- (void)reset {
    // empty
}

- (void)reloadData {
    // empty
}

@end
