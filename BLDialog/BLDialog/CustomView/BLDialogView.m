//
//  BLDialogView.m
//  BLDialog
//
//  Created by wmz on 2021/7/17.
//  Copyright © 2021 wmz. All rights reserved.
//

#import "BLDialogView.h"
@implementation BLDialogView

- (instancetype)initWithParam:(BLDialogParam*)param{
    if (self = [super init]) {
        self.param = param;
        self.backgroundColor = param.wMainBackColor;
    }
    return self;
}

+ (instancetype)initWithParam:(BLDialogParam*)param{
    return [[self alloc] initWithParam:param];
}

- (BOOL)mz_centerView{
    return YES;
}

- (CGRect)mz_setupRect{
    return CGRectZero;
}

@end
