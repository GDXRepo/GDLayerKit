//
//  LKMarkupView.m
//  AFNetworking
//
//  Created by Георгий Малюков on 26.03.2018.
//

#import "LKMarkupView.h"
#import "Masonry.h"

@interface LKMarkupView ()

@property (nonatomic, strong) UILabel *sizeLabel;

#pragma mark - Setup

- (void)reloadData;

@end


@implementation LKMarkupView

#pragma mark - Root

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _textColor = UIColor.blackColor;
        _shouldDisplayPosition = YES;
        _shouldDisplaySize = YES;
        [self setup];
        [self make];
        [self reloadData];
        // dimension changes observing
        [self addObserver:self forKeyPath:@"frame" options:0 context:NULL];
        [self.layer addObserver:self forKeyPath:@"bounds" options:0 context:NULL];
        [self.layer addObserver:self forKeyPath:@"transform" options:0 context:NULL];
        [self.layer addObserver:self forKeyPath:@"position" options:0 context:NULL];
        [self.layer addObserver:self forKeyPath:@"zPosition" options:0 context:NULL];
        [self.layer addObserver:self forKeyPath:@"anchorPoint" options:0 context:NULL];
        [self.layer addObserver:self forKeyPath:@"anchorPointZ" options:0 context:NULL];
        [self.layer addObserver:self forKeyPath:@"frame" options:0 context:NULL];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    [self setNeedsUpdateConstraints];
}

- (void)setup {
    self.clipsToBounds = NO;
    self.backgroundColor = UIColor.darkGrayColor;
    self.sizeLabel.textColor = UIColor.whiteColor;
    self.layer.borderColor = UIColor.redColor.CGColor;
    self.layer.borderWidth = 1;
}

- (void)make {
    self.sizeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.sizeLabel.font = [UIFont systemFontOfSize:15];
    self.sizeLabel.minimumScaleFactor = 0.1;
    self.sizeLabel.adjustsFontSizeToFitWidth = YES;
    self.sizeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.sizeLabel];
}

- (void)reloadData {
    NSMutableString *string = [NSMutableString new];
    if (self.shouldDisplayPosition) {
        [string appendFormat:@"(%.0f, %.0f)", self.frame.origin.x, self.frame.origin.y];
    }
    if (self.shouldDisplaySize) {
        if (string.length > 0) {
            [string appendString:@"\n"];
        }
        [string appendFormat:@"%.0fx%.0f", self.frame.size.width, self.frame.size.height];
    }
    self.sizeLabel.numberOfLines = (self.shouldDisplayPosition && self.shouldDisplaySize) ? 2 : 1;
    self.sizeLabel.text = string;
    self.sizeLabel.textColor = self.textColor;
}

#pragma mark - NSObject

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    [self reloadData];
}

#pragma mark - Layout

- (void)updateConstraints {
    [self.sizeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.equalTo(@4);
        make.right.and.bottom.equalTo(@-4);
    }];
    [super updateConstraints];
}

#pragma mark - Properties

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self reloadData];
}

- (void)setShouldDisplayPosition:(BOOL)shouldDisplayPosition {
    _shouldDisplayPosition = shouldDisplayPosition;
    [self reloadData];
}

- (void)setShouldDisplaySize:(BOOL)shouldDisplaySize {
    _shouldDisplaySize = shouldDisplaySize;
    [self reloadData];
}

@end
