//
//  LKTableCellModel.h
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKTableCellModel.h"

@class LKTableView;

/// Represents table section.
@interface LKTableSection : NSObject

/// Each containing model means a single row inside a table.
@property (nonatomic, readonly) NSArray<LKTableCellModel *> *models;

/// Generates view for header for the section. Empty by default.
@property (nonatomic, readonly) UIView *viewForHeader;

/// Generates view for footer for the section. Empty by default.
@property (nonatomic, readonly) UIView *viewForFooter;

/// Reference to parent table.
@property (nonatomic, weak) LKTableView *tableView;

/// Allows to hide the specific section instead of removing it from a table.
@property (nonatomic, assign) BOOL hidden;

#pragma mark - Models Management

- (void)addModel:(LKTableCellModel *)model;
- (void)addModelsFromArray:(NSArray<LKTableCellModel *> *)array;
- (void)insertModel:(LKTableCellModel *)model atIndex:(NSUInteger)index;
- (void)insertModels:(NSArray<LKTableCellModel *> *)models atIndexes:(NSIndexSet *)indexes;
- (void)removeModel:(LKTableCellModel *)model;
- (void)removeAllModels;
- (void)removeModelIdenticalTo:(LKTableCellModel *)model inRange:(NSRange)range;
- (void)removeModelIdenticalTo:(LKTableCellModel *)model;
- (void)removeModelsInArray:(NSArray<LKTableCellModel *> *)otherArray;
- (void)removeModelsInRange:(NSRange)range;
- (void)removeModel:(LKTableCellModel *)model inRange:(NSRange)range;
- (void)removeLastModel;
- (void)removeModelAtIndex:(NSUInteger)index;
- (void)removeModelsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceModelAtIndex:(NSUInteger)index withModel:(LKTableCellModel *)model;
- (void)replaceModelsWithModelsFromArray:(NSArray<LKTableCellModel *> *)otherArray;
- (void)replaceModelsAtIndexes:(NSIndexSet *)indexes withModels:(NSArray<LKTableCellModel *> *)models;
- (void)replaceModelsInRange:(NSRange)range withModelsFromArray:(NSArray<LKTableCellModel *> *)otherArray range:(NSRange)otherRange;
- (void)replaceModelsInRange:(NSRange)range withModelsFromArray:(NSArray<LKTableCellModel *> *)otherArray;
- (void)exchangeModelAtIndex:(NSUInteger)idx1 withModelAtIndex:(NSUInteger)idx2;
- (void)sortModelsUsingFunction:(NSComparisonResult (*)(LKTableCellModel *, LKTableCellModel *, void *))compare context:(void *)context;
- (void)sortModelsUsingSelector:(SEL)comparator;

@end
