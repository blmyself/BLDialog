//
//  BLDialogTable.h
//  BLDialog
//
//  Created by wmz on 2021/7/18.
//  Copyright © 2021 wmz. All rights reserved.
//

#import "BLDialogNormal.h"
#import "BLDialogTableProtocol.h"
#import "BLDialogTree.h"
#import "BLDialogManage.h"
#import "BLDialogCell.h"
#define pickViewCount 200

NS_ASSUME_NONNULL_BEGIN

@interface BLDialogTable : BLDialogNormal<BLDialogTableProtocol,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
/// 选中的数组
@property (nonatomic, strong) NSMutableArray *selectArr;
/// 选中的path数组
@property (nonatomic, strong) NSMutableArray *pathArr;
/// 占位数组
@property (nonatomic, strong) NSMutableArray *tempArr;
/// 转化为树形数据
@property (nonatomic, strong) BLDialogTree *tree;
/// 嵌套
@property (nonatomic, assign, getter=isNest) BOOL nest;
/// 树形数据深度
@property (nonatomic, assign) NSInteger depth;

- (NSArray*)getTreeSelectDataArr:(BOOL)first;
///数据处理  type 1返回tree对象
- (id)getMyDataArr:(NSInteger )tableViewTag withType:(NSInteger)type;
@end

NS_ASSUME_NONNULL_END
