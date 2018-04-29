//
//  MVRecordsViewController.h
//  MVVMTest
//
//  Created by Georgiy Malyukov on 27.02.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "LKViewController.h"
#import "MVScreenViewModel.h"

@interface MVRecordsViewController : LKViewController

@property (nonatomic, readonly) MVScreenViewModel *viewModel;

@end
