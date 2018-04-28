//
//  LKTableView.h
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKHelper.h"
#import "LKTableSection.h"
#import "LKTableCell.h"

@protocol LKTableViewSource <NSObject>

- (NSDictionary<NSString *, Class> *)makeModelToCellMap;
- (NSArray<LKTableSection *> *)makeSections;

@end


@interface LKTableView : UITableView <LKUserInterfaceObject>

@property (nonatomic, strong) id<LKTableViewSource> source;

#pragma mark - Refresh

- (void)setupPullToRefreshWithTarget:(id)target selector:(SEL)selector tintColor:(UIColor *)color;
- (void)setupPullToRefreshWithTarget:(id)target selector:(SEL)selector;
- (void)beginRefreshing;
- (void)endRefreshing;

//#pragma mark - Sections
//
//- (void)addSection:(LKTableSection *)section;
//- (void)addSectionsFromArray:(NSArray<LKTableSection *> *)array;
//- (void)insertSection:(LKTableSection *)section atIndex:(NSUInteger)index;
//- (void)insertSections:(NSArray<LKTableSection *> *)sections atIndexes:(NSIndexSet *)indexes;
//- (void)removeSection:(LKTableSection *)section;
//- (void)removeAllSections;
//- (void)removeSectionIdenticalTo:(LKTableSection *)section inRange:(NSRange)range;
//- (void)removeSectionIdenticalTo:(LKTableSection *)section;
//- (void)removeSectionsInArray:(NSArray<LKTableSection *> *)otherArray;
//- (void)removeSectionsInRange:(NSRange)range;
//- (void)removeSection:(LKTableSection *)section inRange:(NSRange)range;
//- (void)removeLastSection;
//- (void)removeSectionAtIndex:(NSUInteger)index;
//- (void)removeSectionsAtIndexes:(NSIndexSet *)indexes;
//- (void)replaceSectionAtIndex:(NSUInteger)index withSection:(LKTableSection *)section;
//- (void)replaceSectionsWithSectionsFromArray:(NSArray<LKTableSection *> *)otherArray;
//- (void)replaceSectionsAtIndexes:(NSIndexSet *)indexes withSections:(NSArray<LKTableSection *> *)sections;
//- (void)replaceSectionsInRange:(NSRange)range withSectionsFromArray:(NSArray<LKTableSection *> *)otherArray range:(NSRange)otherRange;
//- (void)replaceSectionsInRange:(NSRange)range withSectionsFromArray:(NSArray<LKTableSection *> *)otherArray;
//- (void)exchangeSectionAtIndex:(NSUInteger)idx1 withSectionAtIndex:(NSUInteger)idx2;
//- (void)sortSectionsUsingFunction:(NSComparisonResult (*)(LKTableSection *, LKTableSection *, void *))compare context:(void *)context;
//- (void)sortSectionsUsingSelector:(SEL)comparator;

@end
