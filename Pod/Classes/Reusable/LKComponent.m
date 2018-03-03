//
//  LKComponent.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKComponent.h"

@implementation LKComponent

@synthesize ready = _ready;

#pragma mark - Root

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (!self.ready) {
        [self setup];
        [self make];
        [self localize];
        _ready = YES;
    }
    [self setNeedsUpdateConstraints];
}

#pragma mark - LKComponent

- (void)setup {
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
    NSAssert(self.ready, @"Component must be placed on a view before reloading data.");
}

@end
