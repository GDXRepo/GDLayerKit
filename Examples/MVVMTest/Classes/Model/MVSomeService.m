//
//  MVSomeService.m
//  MVVMTest
//
//  Created by Georgiy Malyukov on 27.02.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "MVSomeService.h"

@implementation MVSomeService

- (void)requestDataWithCallback:(MVServiceCallback)callback {
    // request imitation
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callback(self, @[@"some 1", @"some 2", @"some 3", @"some 4", @"some 5"], nil);
    });
}

@end
