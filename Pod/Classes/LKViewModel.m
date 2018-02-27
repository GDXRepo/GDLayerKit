//
//  LKViewModel.m
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 24.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKViewModel.h"

@interface LKViewModel ()

@property (nonatomic, strong) dispatch_queue_t qEnumerating;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSMutableSet<LKBindingCallback> *> *bindings;

@end


@implementation LKViewModel

#pragma mark - Root

- (instancetype)init {
    self = [super init];
    if (self) {
        _qEnumerating = dispatch_queue_create("LKViewModel.observeValueForKeyPath", DISPATCH_QUEUE_SERIAL);
        _bindings = (id)[NSMutableDictionary new];
    }
    return self;
}

#pragma mark - Setup

- (void)bindPropertyName:(NSString *)property callback:(LKBindingCallback)callback {
    NSAssert(property && [property isKindOfClass:[NSString class]] && property.length > 0, @"Invalid property name.");
    NSAssert([self respondsToSelector:NSSelectorFromString(property)],
             @"%@ does not have property named '%@'.",
             NSStringFromClass(self.class), property);
    NSAssert(callback, @"Invalid callback");
    // add key if it's not presented yet
    if (![self.bindings objectForKey:property]) {
        [self.bindings setObject:[NSMutableSet new] forKey:property];
        // begin observing
        [self addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:nil];
    }
    // add callback
    [self.bindings[property] addObject:callback];
}

#pragma mark - NSObject

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSAssert([self.bindings.allKeys containsObject:keyPath], @"Invalid keyPath observing method call.");
    dispatch_async(self.qEnumerating, ^{
        NSArray<LKBindingCallback> *callbacks = self.bindings[keyPath].allObjects;
        for (LKBindingCallback callback in callbacks) {
            id oldValue = change[NSKeyValueChangeOldKey];
            id newValue = change[NSKeyValueChangeNewKey];
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(oldValue, newValue);
            });
        }
    });
}

@end
