//
//  LKTableViewCell.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKTableViewCell.h"

@implementation LKTableViewCell

@synthesize instantiated = _instantiated;

#pragma mark - Root

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (!self.instantiated) {
        _instantiated = YES;
        [self setup];
        [self make];
        [self localize];
    }
    [self setNeedsLayout];
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
    // empty
}

@end
