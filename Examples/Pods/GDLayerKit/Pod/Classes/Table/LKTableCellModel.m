//
//  LKTableCellModel.m
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "LKTableCellModel.h"
#import "LKTableSection.h"

@implementation LKTableCellModel

#pragma mark - Properties

- (Class)cellClass {
    NSAssert(NO, @"Must be overridden.");
    return Nil;
}

@end
