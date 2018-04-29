//
//  MVScreenViewModel.m
//  MVVMTest
//
//  Created by Georgiy Malyukov on 27.02.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "MVScreenViewModel.h"
#import "MVSomeService.h"

@interface MVScreenViewModel ()

@property (nonatomic, strong) NSArray<NSString *> *records;

@end


@implementation MVScreenViewModel

- (void)reloadWithCallback:(dispatch_block_t)callback {
    __weak typeof(self) welf = self;
    [[MVSomeService new] requestDataWithCallback:^(MVSomeService *service, id data, NSError *error) {
        welf.records = data;
        if (callback) {
            callback();
        }
    }];
}

@end
