//
//  LKComponent.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKComponent.h"

@implementation LKComponent

#pragma mark - Root

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
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
    // override & reset your component state to its defaults, then call super
    // ...
    [self reloadData];
}

- (void)reloadData {
    // empty
}

@end
