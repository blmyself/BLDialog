
//
//  BLDialogTableProtocol.h
//  BLDialog
//
//  Created by wmz on 2021/7/18.
//  Copyright © 2021 wmz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BLDialogTableView;
NS_ASSUME_NONNULL_BEGIN

@protocol BLDialogTableProtocol <NSObject>
/// tableView
@property (nonatomic, strong) BLDialogTableView *tableView;
/// pickView
@property (nonatomic, strong) UIPickerView *pickView;

@end

NS_ASSUME_NONNULL_END
