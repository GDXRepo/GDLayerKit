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

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // initialize
    [self setup];
    [self make];
    [self bindAll];
    [self localize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view setNeedsUpdateConstraints];
}

#pragma mark - Setup

- (void)updateViewConstraints {
    [super updateViewConstraints];
}

- (void)bindAll {
    // empty
}

- (void)localize {
    // empty
}

#pragma mark - LKUIConfigurable

- (void)setup {
    // empty
}

- (void)make {
    // empty
}

- (void)reloadData {
    // empty
}

#pragma mark - Utils

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

#pragma mark - Properties

- (LKViewModel *)viewModel {
    static id model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[self.viewModelClass alloc] init];
    });
    return model;
}

- (Class)viewModelClass {
    return LKViewModel.self;
}

@end
