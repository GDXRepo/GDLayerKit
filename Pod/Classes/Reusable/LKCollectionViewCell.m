//
//  LKCollectionViewCell.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKCollectionViewCell.h"

@implementation LKCollectionViewCell

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
    [self setNeedsUpdateConstraints];
}

#pragma mark - LKComponent

- (void)setup {
    // empty
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
    NSAssert(self.instantiated, @"Component must be placed on a view before reloading data.");
}

@end
