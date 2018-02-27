//
//  LKViewModel.h
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 24.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LKBindingCallback)(id oldValue, id newValue);

@interface LKViewModel : NSObject

#pragma mark - Setup

- (void)bindProperty:(NSString *)property toCallback:(LKBindingCallback)callback;
- (void)bindProperties:(NSArray<NSString *> *)propertyList toCallback:(LKBindingCallback)callback;

@end
