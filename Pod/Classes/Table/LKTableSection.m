//
//  LKTableSection.m
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "LKTableSection.h"
#import "LKTableView.h"

@implementation LKTableSection

#pragma mark - Root

- (instancetype)init {
    self = [super init];
    if (self) {
        _models = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Properties

- (UIView *)viewForHeader {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (UIView *)viewForFooter {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
