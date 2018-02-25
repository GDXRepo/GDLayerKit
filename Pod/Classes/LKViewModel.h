//
//  LKViewModel.h
//  LayerKit
//
//  Created by Georgiy Malyukov on 24.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LKBindingCallback)(id oldValue, id newValue);

@interface LKViewModel : NSObject

#pragma mark - Common

- (void)bindPropertyName:(NSString *)property callback:(LKBindingCallback)callback;

@end
