//
//  BLDialogManage.m
//  BLDialog
//
//  Created by wmz on 2021/4/9.
//  Copyright © 2021 wmz. All rights reserved.
//

#import "BLDialogManage.h"
#import "BLDialogParam.h"
#import <objc/runtime.h>

static BLDialogManage* dialogManage = nil;

@interface BLDialogManage()
/// 全局
@property (nonatomic, strong, readwrite) BLDialogParentParam *globalParam;
/// 按宿主分组保留当前弹窗；弱宿主键可在宿主销毁时释放对应缓存。
@property (nonatomic, strong) NSMapTable<UIView *, NSMutableArray *> *dialogsByHost;

@end

@implementation BLDialogManage

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        dialogManage = [[super allocWithZone:NULL] init];
        dialogManage.dialogInfo = [NSMutableDictionary new];
        dialogManage.dialogsByHost = [NSMapTable weakToStrongObjectsMapTable];
        dialogManage.globalParam = BLDialogParentParam.new;
        [BLDialogManage setDefaultPropertiess:dialogManage.globalParam];
    }) ;
    return dialogManage ;
}

/// 全局配置
+ (void)settingGlobalConfig:(DialogCustomParam)block{
    if(block) block((id)BLDialogManage.shareInstance.globalParam);
}

- (void)setUpManageDefaultParam:(BLDialogParentParam*)param{
    if(self.globalParam){
        u_int count = 0;
        objc_property_t *properties = class_copyPropertyList([BLDialogParentParam class], &count);
        for (int i = 0; i < count; i++) {
            const char *propertyName = property_getName(properties[i]);
            NSString *proper = [NSString stringWithUTF8String:propertyName];
            if (![proper isEqualToString:@"wOpenDark"]) {
                id object = [self.globalParam valueForKey:proper];
                if(object){
                    [param setValue:object forKey:proper];
                }
            }
        }
        free(properties);
    }
}

+ (void)setDefaultPropertiess:(BLDialogParentParam*)param{
    BOOL left = ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft ||
                 [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight);
    param.wType = DialogTypeNornal;
    param.wWidth = DialogSize.width;
    param.wHeight = DialogSize.height;
    param.wAnimationDurtion = 0.3f;
    param.wDisappelSecond = DialogDisappealTime;
    param.wMainBtnHeight = DialogRealW(60);
    param.wCellHeight =  DialogRealW(80);
    param.wOKTitle = @"确定";
    param.wCancelTitle = @"取消";
    param.wMainRadius = 8.0f;
    param.wMainOffsetY = DialogRealW(20);
    param.wMainOffsetX = DialogRealW(15);
    param.wLineAlpha = 0.9f;
    param.wTitleFont = 14.0f;
    param.wMessageFont = 16.0f;
    param.wOKFont = 16.0f;
    param.wCancelFont = 16.0f;
    param.wShadowAlpha = 0.3f;
    param.wKeyBoardMarginY = DialogRealW(40);
    param.wPayNum = 5;
    param.wDefaultSelectPayStr = @"农业银行";
    param.wShadowCanTap = YES;
    param.wShadowShow = YES;
    param.wWirteTextMaxNum  = -1;
    param.wWirteTextMaxLine = 7;
    param.wPercentAngle =  0.5f;
    param.wPercentOrginX = 1.0f;
    param.wColumnCount = 4;
    param.wRowCount = 1;
    param.wDirection = directionDowm;
    param.wImageSize = CGSizeMake(DialogRealW(110), DialogRealW(110));
    param.wTextAlignment = NSTextAlignmentCenter;
    param.wLocationType = DialogLocationProAndCityAndDis;
    param.wChainType = ChainPickView;
    param.wDateTimeType = @"yyyy-MM-dd HH:mm:ss";
    param.wPlaceholder = @"请输入";
    param.wLoadingSize = CGSizeMake(DialogRealW(90),  DialogRealW(90));
    param.wSeparator = @",";
    param.wLeftScrollClose = YES;
    param.wOpenScrollClose = YES;
    param.wOpenDragging = YES;
    param.wScaleParentVC = YES;
    param.wCalanderCanScroll = YES;
    param.wOpenChineseDate = YES;
    param.wHideCalanderBtn = YES;
    param.wDefaultDate = [NSDate date];
    param.wCanSelectPay = YES;
    param.wPopViewBorderColor = param.wMainBackColor;
    param.wTapRect = CGRectZero;
    param.wPopViewRectCorner = DialogRectCornerNone;
    param.wTag = 12345;
    param.wUserInteractionEnabled = YES;
    param.wListScrollCount = left ? 5 : 8;
    param.wSeparatorStyle = UITableViewCellSeparatorStyleNone;
    param.wAngleSize = CGSizeMake(DialogRealW(24), DialogRealW(16));
    param.wOpenMultiZone = YES;
    param.wXMLPathName = [[NSBundle bundleWithPath:[[NSBundle bundleForClass:[BLDialogParam class]] pathForResource:@"BLDialog" ofType:@"bundle"]] pathForResource:@"province_data" ofType:@"xml"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[BLDialogParam class]] pathForResource:@"BLDialogResources" ofType:@"bundle"]];
    if (!resourceBundle) resourceBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[BLDialogParam class]] pathForResource:@"BLDialog" ofType:@"bundle"]];
    NSString *checkPath = [resourceBundle pathForResource:@"dialog_check" ofType:@"png"];
    param.wCheckImage = [[UIImage imageWithContentsOfFile:checkPath] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    param.wLoadingWidth = 2.5f;
    param.wAutoClose = YES;
    param.wLevel = DialogLevelHigh;
    param.wLimitAlpha = 1;
    param.wPoint = CGPointMake(-999, -999);
    param.wPopStyleType = DialogPopTypeTable;
    param.wCalanderWeekTitleArr = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    param.wMinMaxResultArr = @[DialogCalanderLimitCloseClick];
    param.wCellBackgroundColor = DialogColor(0xffffff);
    param.wCellIconSize = CGSizeMake(DialogRealW(60), DialogRealW(60));
    param.wCellAlignType = DialogCellAlignLeft;
    param.wDeviceDidChange = NO;
    [self setDefaultColorPropertiess:param];
}

+ (void)setDefaultColorPropertiess:(BLDialogParentParam*)param{
    param.wShadowColor = DialogColor(0x333333);
    param.wOKColor = DialogColor(0xFF9900);
    param.wThemeColor = param.wOKColor;
    param.wProgressTintColor = DialogColor(0xFF9900);
    param.wTrackTintColor = DialogColor(0xF3F4F6);
    param.wLoadingColor = DialogColor(0x108ee9);
    param.wTableViewColor = @[
        DialogDarkOpenColor(DialogColor(0xffffff), BLDialogManage.shareInstance.darkColorInfo[DialogDarkMainColor], param.wOpenDark),
        DialogDarkOpenColor(DialogColor(0xF6F7FA), BLDialogManage.shareInstance.darkColorInfo[DialogDarkMainColor], param.wOpenDark),
        DialogDarkOpenColor(DialogColor(0xEBECF0), BLDialogManage.shareInstance.darkColorInfo[DialogDarkMainColor], param.wOpenDark),
        DialogDarkOpenColor(DialogColor(0xffffff), BLDialogManage.shareInstance.darkColorInfo[DialogDarkMainColor], param.wOpenDark)];
    param.wCancelColor = DialogDarkOpenColor(DialogColor(0x666666), DialogColor(0xffffff), param.wOpenDark);
    param.wMainBackColor = DialogDarkOpenColor(DialogColor(0xffffff), BLDialogManage.shareInstance.darkColorInfo[DialogDarkMainColor], param.wOpenDark);
    param.wLineColor =  DialogDarkOpenColor([[UIColor lightGrayColor] colorWithAlphaComponent:0.4], [[UIColor whiteColor] colorWithAlphaComponent:0.4],param.wOpenDark);
    param.wTitleColor =  DialogDarkOpenColor(DialogColor(0x333333), DialogColor(0xffffff), param.wOpenDark);
    param.wMessageColor = DialogDarkOpenColor(DialogColor(0x333333), DialogColor(0xffffff), param.wOpenDark);
    param.wInputTextColor = DialogDarkOpenColor(DialogColor(0x333333), DialogColor(0xffffff), param.wOpenDark);
    param.wInputBackGroundColor =  DialogDarkOpenColor(DialogColor(0xffffff), BLDialogManage.shareInstance.darkColorInfo[DialogDarkMainColor], param.wOpenDark);
}

- (void)addDialog:(id)dialog cover:(BOOL)cover superView:(UIView*)superView{
    if (![dialog isKindOfClass:NSClassFromString(@"BLDialog")] || !superView) return;

    NSNumber *key = @([[dialog valueForKey:@"wTag"] integerValue]);
    NSMutableArray *hostDialogs = [self.dialogsByHost objectForKey:superView];
    if (!hostDialogs) {
        hostDialogs = [NSMutableArray new];
        [self.dialogsByHost setObject:hostDialogs forKey:superView];
    }
    if (![hostDialogs containsObject:dialog]) [hostDialogs addObject:dialog];

    // Keep the legacy tag index as a single-dialog-per-tag view. The host map is
    // authoritative because a tag is only unique within its host.
    UIView *indexedDialog = self.dialogInfo[key];
    if (!indexedDialog || cover || indexedDialog == dialog) self.dialogInfo[key] = dialog;

    NSMutableArray *orderedDialogs = [NSMutableArray new];
    for (UIView *subview in superView.subviews) {
        if (subview != dialog && [subview isKindOfClass:NSClassFromString(@"BLDialog")]) [orderedDialogs addObject:subview];
    }
    NSInteger level = [[dialog valueForKey:@"wLevel"] integerValue];
    [orderedDialogs addObject:dialog];
    [orderedDialogs sortUsingComparator:^NSComparisonResult(UIView *left, UIView *right) {
        NSInteger leftLevel = [[left valueForKey:@"wLevel"] integerValue];
        NSInteger rightLevel = [[right valueForKey:@"wLevel"] integerValue];
        if (leftLevel < rightLevel) return NSOrderedAscending;
        if (leftLevel > rightLevel) return NSOrderedDescending;
        return NSOrderedSame;
    }];

    UIView *above = nil;
    for (UIView *candidate in orderedDialogs) {
        if (candidate != dialog && [[candidate valueForKey:@"wLevel"] integerValue] > level) {
            above = candidate;
            break;
        }
    }
    if (above) [superView insertSubview:dialog belowSubview:above];
    else [superView addSubview:dialog];
}

- (void)deleteDialog:(id)dialog{
    if (![dialog isKindOfClass:NSClassFromString(@"BLDialog")]) return;
    NSMutableArray *emptyHosts = [NSMutableArray new];
    for (UIView *host in self.dialogsByHost.keyEnumerator.allObjects) {
        NSMutableArray *hostDialogs = [self.dialogsByHost objectForKey:host];
        [hostDialogs removeObjectIdenticalTo:dialog];
        if (hostDialogs.count == 0) [emptyHosts addObject:host];
    }
    for (UIView *host in emptyHosts) [self.dialogsByHost removeObjectForKey:host];

    for (NSNumber *key in self.dialogInfo.allKeys.copy) {
        if (self.dialogInfo[key] != dialog) continue;
        [self.dialogInfo removeObjectForKey:key];
        for (UIView *candidateHost in self.dialogsByHost) {
            for (UIView *candidate in [self.dialogsByHost objectForKey:candidateHost]) {
                if ([[candidate valueForKey:@"wTag"] integerValue] == key.integerValue) {
                    self.dialogInfo[key] = candidate;
                    break;
                }
            }
        }
    }
}

- (BLDialog*)currentDialog:(UIView*)normalView{
    UIView *currentView = normalView;
    Class dialogClass = NSClassFromString(@"BLDialog");
    while (currentView) {
        if ([currentView isKindOfClass:dialogClass]) return (BLDialog *)currentView;
        if ([currentView.superview isKindOfClass:dialogClass]) return (BLDialog *)currentView.superview;
        currentView = currentView.superview;
    }
    return nil;
}

- (NSMutableDictionary<NSString *,UIColor *> *)darkColorInfo{
    if (!_darkColorInfo) {
        _darkColorInfo = [NSMutableDictionary dictionaryWithDictionary:@{
            DialogDarkMainColor:DialogColor(0x191919),
            DialogDarkC2:DialogColor(0x373637),
            DialogDarkC3:DialogColor(0x2c2c2c),
        }];
    }
    return _darkColorInfo;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return BLDialogManage.shareInstance;
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return  BLDialogManage.shareInstance;
}

@end
