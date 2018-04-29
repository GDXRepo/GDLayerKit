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

/// Represents LKTableView data source.
@protocol LKTableViewSource <NSObject>

/**
 Creates map containing model-to-cell classes relationships.
 @return Model-to-cell classes relationships map.
 */
- (NSDictionary<NSString *, Class> *)makeModelToCellMap;

/**
 Creates sections according to current business logic's state.
 @return List of actual table sections.
 */
- (NSArray<LKTableSection *> *)makeSections;

@end

/// Represents table view with alternative data management principles.
@interface LKTableView : UITableView <LKUserInterfaceObject>

/// Table data source.
@property (nonatomic, strong) id<LKTableViewSource> source;

#pragma mark - Refresh

/**
 Creates Pull-to-Refresh component for the table.
 @param target Target.
 @param selector Selector.
 @param color Tint color for pull-to-refresh component itself.
 */
- (void)setupPullToRefreshWithTarget:(id)target selector:(SEL)selector tintColor:(UIColor *)color;

/**
 Creates Pull-to-Refresh component for the table with dark gray tint color.
 @param target Target.
 @param selector Selector.
 */
- (void)setupPullToRefreshWithTarget:(id)target selector:(SEL)selector;

/// Starts pull-to-refresh animation if the referenced component is set up.
- (void)beginRefreshing;

/// Ends pull-to-refresh animation if the referenced component is set up.
- (void)endRefreshing;

@end
