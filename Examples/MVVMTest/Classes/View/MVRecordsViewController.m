//
//  MVRecordsViewController.m
//  MVVMTest
//
//  Created by Georgiy Malyukov on 27.02.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "MVRecordsViewController.h"
#import "LKTableView.h"
#import "MVTableCell.h"
#import "MBProgressHUD.h"

@interface MVRecordsViewController () <LKTableViewSource>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) LKTableView *tableView;
@property (nonatomic, strong) UIButton *updateButton;

#pragma mark - Actions

- (void)updateButtonClick:(id)sender;

@end


@implementation MVRecordsViewController

@dynamic viewModel;

#pragma mark - Root

- (Class)viewModelClass {
    return MVScreenViewModel.self;
}

- (void)make {
    [super make];
    self.titleLabel = [LKUIFactory labelWithSuperview:self.view];
    self.tableView = [LKTableView new];
    self.tableView.source = self;
    [self.view addSubview:self.tableView];
    self.updateButton = [LKUIFactory buttonSystemWithTarget:self action:@selector(updateButtonClick:) superview:self.view];
}

- (void)updateViewConstraints {
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).with.offset(16);
        make.centerX.equalTo(self.view);
    }];
    [self.updateButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@44);
        make.width.equalTo(@100);
    }];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(16);
        make.left.and.right.equalTo(@0);
        make.bottom.equalTo(self.updateButton.mas_top).with.offset(-16);
    }];
    [super updateViewConstraints];
}

- (void)bindAll {
    [super bindAll];
    // add one subscriber
    [self.viewModel bindProperty:@"records" toCallback:^(id oldValue, id newValue) {
        [self.tableView reloadData];
    }];
    // add another one
    [self.viewModel bindProperty:@"records" toCallback:^(id oldValue, id newValue) {
        NSLog(@"table updated.");
    }];
}

- (void)localize {
    [super localize];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.text = @"My Records";
    [self.updateButton setTitle:@"Update" forState:UIControlStateNormal];
}

#pragma mark - Actions

- (void)updateButtonClick:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.viewModel reloadWithCallback:^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

#pragma mark - LKTableViewSource

- (NSDictionary<NSString *, Class> *)makeModelToCellMap {
    return @{
             @"LKTableCellModel" : MVTableCell.class
             };
}

- (NSArray<LKTableSection *> *)makeSections {
    srand([NSDate date].timeIntervalSince1970);
    LKTableSection *section = [LKTableSection new];
    for (NSString *record in self.viewModel.records) {
        LKTableCellModel *model = [LKTableCellModel new];
        model.data = record;
        uint32_t rand = arc4random_uniform(2);
        NSLog(@"hide %ld row = %d", (long)[self.viewModel.records indexOfObject:record], rand);
        model.hidden = (rand == 1);
        [section addModel:model];
    }
    return @[section];
}

@end
