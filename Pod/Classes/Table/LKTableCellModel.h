//
//  LKTableCellModel.h
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LKTableSection;

/// Represents table cell's model. Links cell UI with its reference data and its owning section.
@interface LKTableCellModel : NSObject

/// Gets UI table cell class associated with this cell's model. Must be set by a child class.
@property (nonatomic, readonly) Class cellClass;

/// Reference to owning section.
@property (nonatomic, weak) LKTableSection *section;

/// Data to display inside a linked cell.
@property (nonatomic, strong) id data;

/// Allows to hide the specific model instead of removing it from a section.
@property (nonatomic, assign) BOOL hidden;

@end
