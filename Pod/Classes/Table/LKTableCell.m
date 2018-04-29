//
//  LKTableCell.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKTableCell.h"

@interface LKTableCell () {
    NSMutableArray<id<LKUserInterfaceObject>> *_childObjects;
}

@end

@implementation LKTableCell

@synthesize childObjects = _childObjects;

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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    _childObjects = [NSMutableArray new];
}

- (void)make {
    // empty
}

- (void)updateConstraints {
    for (id object in self.childObjects) {
        if ([object isKindOfClass:UIView.self]) {
            UIView *view = (UIView *)object;
            if (view.superview) {
                [view updateConstraints];
            }
        }
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
}

- (void)reloadData {
    for (id<LKUserInterfaceObject> object in self.childObjects) {
        [object reloadData];
    }
    [self setNeedsUpdateConstraints];
}

@end
