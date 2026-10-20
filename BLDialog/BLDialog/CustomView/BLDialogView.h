//
//  BLDialogView.h
//  BLDialog
//
//  Created by wmz on 2021/7/17.
//  Copyright © 2021 wmz. All rights reserved.
//

#import "BLCustomPrototol.h"
#import "BLDialogParam.h"
NS_ASSUME_NONNULL_BEGIN

@interface BLDialogView : UIView<BLCustomPrototol>

- (instancetype)initWithParam:(BLDialogParam*)param;

+ (instancetype)initWithParam:(BLDialogParam*)param;

/// 配置
@property (nonatomic,strong) BLDialogParam *param;

@end

NS_ASSUME_NONNULL_END
