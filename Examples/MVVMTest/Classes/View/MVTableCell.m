//
//  MVTableCell.m
//  MVVMTest
//
//  Created by Георгий Малюков on 29.04.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "MVTableCell.h"

@interface MVTableCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation MVTableCell

#pragma mark - Root

- (void)make {
    [super make];
    self.titleLabel = [LKUIFactory labelWithWordWrap:YES superview:self.contentView];
    self.titleLabel.layer.borderColor = UIColor.redColor.CGColor;
    self.titleLabel.layer.borderWidth = 1;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)updateConstraints {
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(@38);
        make.right.and.bottom.equalTo(@-8);
    }];
    [super updateConstraints];
}

- (void)reloadData {
    self.titleLabel.text = self.data;
    [super reloadData];
}

@end
