//
//  LKTableCell.h
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "LKUIFactory.h"
#import "LKHelper.h"

/// Represents table cell.
@interface LKTableCell : UITableViewCell <LKCompoundObject>

/// Data to display inside the cell.
@property (nonatomic, strong) id data;

/**
 Creates subviews.
 @discussion Please do not forget to use "self.contentView" instead of "self"!
 */
- (void)make;

/**
 Updates constraints using SnapKit/Masonry library.
 @discussion Please do not forget to use "self.contentView" instead of "self" where necessary!
 */
- (void)updateConstraints;

@end
