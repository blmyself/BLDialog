//
//  BLDialogManage.h
//  BLDialog
//
//  Created by wmz on 2021/4/9.
//  Copyright © 2021 wmz. All rights reserved.
//
#import <UIKit/UIKit.h>
@class BLDialogParam,BLDialogParentParam,BLDialog;

typedef void (^DialogCustomParam)(BLDialogParam* _Nullable param);
/// 弹窗展示状态
typedef enum : NSUInteger{
    /// 将要展示
    DialogWillShow = 0,
    /// 正在展示
    DialogShowIng = 1,
    /// 将要结束
    DialogWillHide = 2,
    /// 已经结束
    DialogHided = 3,
 }DialogShowType;

NS_ASSUME_NONNULL_BEGIN

@interface BLDialogManage : NSObject
/// 按 tag 查询的兼容索引；相同 tag 的不同宿主弹窗由管理器内部按宿主分别跟踪。
@property (nonatomic, strong) NSMutableDictionary <NSNumber*,UIView*>*dialogInfo;
/// 暗黑模式配色
@property (nonatomic, strong) NSMutableDictionary <NSString* , UIColor*> *darkColorInfo;
/// 全局
@property (nonatomic, strong, readonly) BLDialogParentParam *globalParam;
/// 当前展示的弹窗的状态
//@property (nonatomic, assign) DialogShowType status;

/// 设置全局配置
+ (void)settingGlobalConfig:(DialogCustomParam)block;

- (void)setUpManageDefaultParam:(BLDialogParentParam*)param;

+ (void)setDefaultColorPropertiess:(BLDialogParentParam*)param;
/// 查找 view 所属弹窗；view 不在弹窗内部时返回 nil。必须在主线程调用。
- (nullable BLDialog*)currentDialog:(nullable UIView*)normalView;
/// 添加弹窗
/// @param dialog 弹窗视图
/// @param cover 是否覆盖内存缓存
/// @param superView 父类
- (void)addDialog:(id)dialog
            cover:(BOOL)cover
        superView:(UIView*)superView;
/// 删除弹窗
/// @param dialog 弹窗视图
- (void)deleteDialog:(id)dialog;

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
