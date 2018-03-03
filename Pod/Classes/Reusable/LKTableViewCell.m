//
//  LKTableViewCell.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKTableViewCell.h"

@implementation LKTableViewCell

@synthesize ready = _ready;

#pragma mark - Root

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        [self setup];
        [self make];
        [self localize];
        _ready = YES;
    }
    return self;
}

- (void)didMoveToSuperview {
    [self setNeedsUpdateConstraints];
    [super didMoveToSuperview];
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
