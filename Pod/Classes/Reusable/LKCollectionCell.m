//
//  LKCollectionCell.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKCollectionCell.h"

@implementation LKCollectionCell

#pragma mark - Root

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        [self setup];
        [self make];
        [self localize];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
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
    // empty
}

@end
