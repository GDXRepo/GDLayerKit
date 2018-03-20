//
//  LKCollectionCell.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKCollectionCell.h"

@interface LKCollectionCell () {
    NSMutableSet<id<LKUserInterfaceObject>> *_childObjects;
}

@end


@implementation LKCollectionCell

@synthesize childObjects = _childObjects;

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

#pragma mark - LKCompoundObject

- (void)addChildObject:(id<LKUserInterfaceObject>)object {
    [_childObjects addObject:object];
}

- (void)removeChildObject:(id<LKUserInterfaceObject>)object {
    [_childObjects removeObject:object];
}

- (void)setup {
    _childObjects = [NSMutableSet new];
}

- (void)make {
    // empty
}

- (void)updateConstraints {
    for (id<LKUserInterfaceObject> object in self.childObjects) {
        [object updateConstraints];
    }
    [super updateConstraints];
}

- (void)localize {
    for (id<LKUserInterfaceObject> object in self.childObjects) {
        [object localize];
    }
}

- (void)reset {
    for (id<LKUserInterfaceObject> object in self.childObjects) {
        [object reset];
    }
    [self reloadData];
}

- (void)reloadData {
    for (id<LKUserInterfaceObject> object in self.childObjects) {
        [object reloadData];
    }
    [self setNeedsUpdateConstraints];
}

@end
