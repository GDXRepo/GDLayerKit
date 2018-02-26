//
//  LKComponent.h
//  LayerKit
//
//  Created by Georgiy Malyukov on 22.02.2018.
//  Copyright © 2018 Georgiy Malyukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "LKUIFactory.h"
#import "LKHelper.h"

/// Represents reusable UI component.
@interface LKComponent : UIView <LKUIReusable>

@end

