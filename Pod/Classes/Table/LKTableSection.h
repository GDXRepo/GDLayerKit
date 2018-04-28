//
//  LKTableSection.h
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKTableCellModel.h"

@class LKTableView;

@interface LKTableSection : NSObject

@property (nonatomic, readonly) NSMutableArray<LKTableCellModel *> *models;
@property (nonatomic, readonly) UIView *viewForHeader;
@property (nonatomic, readonly) UIView *viewForFooter;
@property (nonatomic, weak) LKTableView *tableView;
@property (nonatomic, assign) BOOL hidden;

@end
