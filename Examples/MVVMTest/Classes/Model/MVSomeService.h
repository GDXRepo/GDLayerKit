//
//  MVSomeService.h
//  MVVMTest
//
//  Created by Georgiy Malyukov on 27.02.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MVSomeService;

typedef void (^MVServiceCallback)(MVSomeService *service, id data, NSError *error);

@interface MVSomeService : NSObject

- (void)requestDataWithCallback:(MVServiceCallback)callback;

@end
