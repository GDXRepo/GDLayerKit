//
//  LKViewController.m
//  LayerKit
//
//  Created by Georgiy Malyukov on 25.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import "LKViewController.h"

@implementation LKViewController

#pragma mark - Root

- (instancetype)initWithViewModel:(LKViewModel *)model {
    self = [super init];
    if (self) {
        _viewModel = model;
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // initialize
    [self make];
    [self bind];
    [self localize];
    [self reloadData];
}

#pragma mark - Setup

- (void)make {
    // empty
}

- (void)bind {
    // empty
}

- (void)localize {
    // empty
}

- (void)reloadData {
    // empty
}

#pragma mark - Utils

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

@end
