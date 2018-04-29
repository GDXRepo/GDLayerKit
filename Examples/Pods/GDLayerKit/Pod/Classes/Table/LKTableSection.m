//
//  LKTableModel.m
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "LKTableSection.h"
#import "LKTableView.h"

@interface LKTableSection () {
    NSMutableArray<LKTableCellModel *> *_models;
}

@end


@implementation LKTableSection

@synthesize models = _models;

#pragma mark - Root

- (instancetype)init {
    self = [super init];
    if (self) {
        _models = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Models Management

- (void)addModel:(LKTableCellModel *)model {
    model.section = self;
    [_models addObject:model];
}

- (void)addModelsFromArray:(NSArray<LKTableCellModel *> *)array {
    for (LKTableCellModel *model in array) {
        model.section = self;
    }
    [_models addObjectsFromArray:array];
}

- (void)insertModel:(LKTableCellModel *)model atIndex:(NSUInteger)index {
    model.section = self;
    [_models insertObject:model atIndex:index];
}

- (void)insertModels:(NSArray<LKTableCellModel *> *)models atIndexes:(NSIndexSet *)indexes {
    for (LKTableCellModel *model in models) {
        model.section = self;
    }
    [_models insertObjects:models atIndexes:indexes];
}

- (void)removeModel:(LKTableCellModel *)model {
    [_models removeObject:model];
}

- (void)removeAllModels {
    [_models removeAllObjects];
}

- (void)removeModelIdenticalTo:(LKTableCellModel *)model inRange:(NSRange)range {
    [_models removeObjectIdenticalTo:model inRange:range];
}

- (void)removeModelIdenticalTo:(LKTableCellModel *)model {
    [_models removeObjectIdenticalTo:model];
}

- (void)removeModelsInArray:(NSArray<LKTableCellModel *> *)otherArray {
    [_models removeObjectsInArray:otherArray];
}

- (void)removeModelsInRange:(NSRange)range {
    [_models removeObjectsInRange:range];
}

- (void)removeModel:(LKTableCellModel *)model inRange:(NSRange)range {
    [_models removeObject:model inRange:range];
}

- (void)removeLastModel {
    [_models removeLastObject];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [_models removeObjectAtIndex:index];
}

- (void)removeModelsAtIndexes:(NSIndexSet *)indexes {
    [_models removeObjectsAtIndexes:indexes];
}

- (void)replaceModelAtIndex:(NSUInteger)index withModel:(LKTableCellModel *)model {
    model.section = self;
    [_models replaceObjectAtIndex:index withObject:model];
}

- (void)replaceModelsWithModelsFromArray:(NSArray<LKTableCellModel *> *)otherArray {
    [self removeAllModels];
    [self addModelsFromArray:otherArray];
}

- (void)replaceModelsAtIndexes:(NSIndexSet *)indexes withModels:(nonnull NSArray<LKTableCellModel *> *)models {
    for (LKTableCellModel *model in models) {
        model.section = self;
    }
    [_models replaceObjectsAtIndexes:indexes withObjects:models];
}

- (void)replaceModelsInRange:(NSRange)range withModelsFromArray:(nonnull NSArray<LKTableCellModel *> *)otherArray range:(NSRange)otherRange {
    for (LKTableCellModel *model in otherArray) {
        model.section = self;
    }
    [_models replaceObjectsInRange:range withObjectsFromArray:otherArray range:otherRange];
}

- (void)replaceModelsInRange:(NSRange)range withModelsFromArray:(nonnull NSArray<LKTableCellModel *> *)otherArray {
    [_models replaceObjectsInRange:range withObjectsFromArray:otherArray];
}

- (void)exchangeModelAtIndex:(NSUInteger)idx1 withModelAtIndex:(NSUInteger)idx2 {
    [_models exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

- (void)sortModelsUsingFunction:(NSComparisonResult (*)(LKTableCellModel * _Nonnull __strong, LKTableCellModel * _Nonnull __strong, void * _Nonnull))compare context:(void *)context {
    [_models sortUsingFunction:compare context:context];
}

- (void)sortModelsUsingSelector:(SEL)comparator {
    [_models sortUsingSelector:comparator];
}

#pragma mark - Properties

- (UIView *)viewForHeader {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (UIView *)viewForFooter {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
