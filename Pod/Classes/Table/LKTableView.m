//
//  LKTableView.m
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "LKTableView.h"
#import "LKTableCell.h"

@interface LKTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary<NSString *, Class> *modelToCellMap;
@property (nonatomic, strong) NSArray<LKTableSection *> *sections;
@property (nonatomic, strong) NSArray<LKTableSection *> *visibleSections;

#pragma mark - Utils

- (NSUInteger)rowsInSection:(LKTableSection *)section;
- (LKTableCellModel *)modelForIndexPath:(NSIndexPath *)path;

@end


@implementation LKTableView

#pragma mark - Root

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.dataSource = self;
    self.delegate = self;
    self.estimatedRowHeight = 44;
    self.estimatedSectionHeaderHeight = 20;
    self.estimatedSectionFooterHeight = 20;
    self.rowHeight = UITableViewAutomaticDimension;
    self.sectionHeaderHeight = UITableViewAutomaticDimension;
    self.sectionFooterHeight = UITableViewAutomaticDimension;
//    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)make {
    // empty
}

- (void)localize {
    // empty
}

- (void)reset {
    self.modelToCellMap = [self.source makeModelToCellMap];
    // register cell classes
    for (NSString *modelClass in self.modelToCellMap.allKeys) {
        Class cellClass = self.modelToCellMap[modelClass];
        [self registerClass:cellClass forCellReuseIdentifier:modelClass];
    }
}

- (void)reloadData {
    // get all sections
    self.sections = [self.source makeSections];
    [self.sections enumerateObjectsUsingBlock:^(LKTableSection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.tableView = self;
    }];
    // get visible only
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"hidden == NO"];
    self.visibleSections = [self.sections filteredArrayUsingPredicate:predicate];
    // then reload
    [super reloadData];
}

#pragma mark - Refresh

- (void)setupPullToRefreshWithTarget:(id)target selector:(SEL)selector tintColor:(UIColor *)color {
    NSAssert(!self.refreshControl, @"Refresh control is already set.");
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    refreshControl.backgroundColor = [UIColor clearColor];
    refreshControl.tintColor = color;
    [refreshControl addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)setupPullToRefreshWithTarget:(id)target selector:(SEL)selector {
    [self setupPullToRefreshWithTarget:target selector:selector tintColor:UIColor.darkGrayColor];
}

- (void)beginRefreshing {
    [self.refreshControl beginRefreshing];
}

- (void)endRefreshing {
    [self.refreshControl endRefreshing];
}

#pragma mark - Utils

- (NSUInteger)rowsInSection:(LKTableSection *)section {
    NSUInteger rows = 0;
    for (LKTableCellModel *model in section.models) {
        if (!model.hidden) {
            ++rows;
        }
    }
    return rows;
}

- (LKTableCellModel *)modelForIndexPath:(NSIndexPath *)path {
    // find real model index (search including hidden rows)
    NSArray<LKTableCellModel *> *models = self.visibleSections[path.section].models;
    NSUInteger current = 0;
    for (NSInteger i = 0; i < models.count; i++) {
        if (!models[i].hidden) {
            if (current == path.row) {
                return models[i];
            }
            ++current;
        }
    }
    NSAssert(NO, @"Invalid index path.");
    return nil;
}

#pragma mark - Properties

- (void)setSource:(id<LKTableViewSource>)source {
    _source = source;
    [self reset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.visibleSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self rowsInSection:self.visibleSections[section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LKTableCellModel *model = [self modelForIndexPath:indexPath];
    LKTableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(model.class)];
    NSAssert(cell != nil,
             @"Unable to init cell (class = %@) for model class %@. Possibly it has not been registered.",
             NSStringFromClass(model.cellClass),
             model.class);
    cell.data = model.data;
    [cell reloadData];
    return cell;
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.visibleSections[section].viewForHeader;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.visibleSections[section].viewForFooter;
}

@end
