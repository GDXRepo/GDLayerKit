//
//  LKViewController.m
//  GDLayerKit
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
    [self localize];
    [self bindAll];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view setNeedsUpdateConstraints];
}

#pragma mark - LKView

- (void)setup {
    // empty
}

- (void)make {
    // empty
}

- (void)updateConstraints {
    [self updateViewConstraints]; // just the synonym
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
}

- (void)bindAll {
    // empty
}

- (void)localize {
    // empty
}

- (void)reset {
    // override & reset your component state to its defaults, then call super
    // ...
    [self reloadData];
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
