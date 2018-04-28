//
//  LKTableCellModel.h
//  MVVMTest
//
//  Created by Георгий Малюков on 26.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LKTableSection;

@interface LKTableCellModel : NSObject

@property (nonatomic, readonly) Class cellClass;
@property (nonatomic, weak) LKTableSection *section;
@property (nonatomic, strong) id data;
@property (nonatomic, assign) BOOL hidden;

@end
