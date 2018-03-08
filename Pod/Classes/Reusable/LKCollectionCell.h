//
//  LKCollectionCell.h
//  GDLayerKit
//
//  Created by Georgiy Malyukov on 26.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "LKUIFactory.h"
#import "LKHelper.h"

@interface LKCollectionCell : UICollectionViewCell <LKComponent>

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
