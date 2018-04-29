//
//  MVScreenViewModel.h
//  MVVMTest
//
//  Created by Georgiy Malyukov on 27.02.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "LKViewModel.h"

@interface MVScreenViewModel : LKViewModel

@property (nonatomic, readonly) NSArray<NSString *> *records;

#pragma mark - Data

- (void)reloadWithCallback:(dispatch_block_t)callback;

@end
