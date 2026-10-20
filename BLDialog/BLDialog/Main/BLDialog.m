//
//  BLDialog.m
//  BLDialog
//
//  Created by wmz on 2019/6/5.
//  Copyright © 2019年 wmz. All rights reserved.
//
#import "BLDialog.h"
#import "../BLDialogUntils/BLDialogAnimation.h"
@interface BLDialog ()
@property (nonatomic, assign) BOOL didScheduleUI;
@property (nonatomic, assign) BOOL didCompleteClose;
@property (nonatomic, strong) NSMutableArray *closeCompletions;
@property (nonatomic, weak) UIView *hostView;
@end

@implementation BLDialog
BLDialogSetFuncImplementation(BLDialog, BOOL,                         wOpenKeyBoard)
BLDialogSetFuncImplementation(BLDialog, BOOL,                    wMultipleSelection)
BLDialogSetFuncImplementation(BLDialog, BOOL,                    wSelectShowChecked)
BLDialogSetFuncImplementation(BLDialog, BOOL,                      wOpenScrollClose)
BLDialogSetFuncImplementation(BLDialog, BOOL,                      wLeftScrollClose)
BLDialogSetFuncImplementation(BLDialog, BOOL,                         wOpenDragging)
BLDialogSetFuncImplementation(BLDialog, BOOL,                        wScaleParentVC)
BLDialogSetFuncImplementation(BLDialog, BOOL,                    wDirectionVertical)
BLDialogSetFuncImplementation(BLDialog, BOOL,                    wCalanderCanScroll)
BLDialogSetFuncImplementation(BLDialog, BOOL,                      wHideCalanderBtn)
BLDialogSetFuncImplementation(BLDialog, BOOL,                      wOpenChineseDate)
BLDialogSetFuncImplementation(BLDialog, BOOL,                       wNavigationItem)
BLDialogSetFuncImplementation(BLDialog, BOOL,                         wShadowCanTap)
BLDialogSetFuncImplementation(BLDialog, BOOL,                           wShadowShow)
BLDialogSetFuncImplementation(BLDialog, BOOL,                           wEffectShow)
BLDialogSetFuncImplementation(BLDialog, BOOL,                        wAddBottomView)
BLDialogSetFuncImplementation(BLDialog, BOOL,                            wAutoClose)
BLDialogSetFuncImplementation(BLDialog, BOOL,                           wPickRepeat)
BLDialogSetFuncImplementation(BLDialog, BOOL,                         wMainToBottom)
BLDialogSetFuncImplementation(BLDialog, BOOL,                         wCanSelectPay)
BLDialogSetFuncImplementation(BLDialog, BOOL,                      wDeviceDidChange)
BLDialogSetFuncImplementation(BLDialog, BOOL,                 wTapViewTableViewFoot)
BLDialogSetFuncImplementation(BLDialog, BOOL,                        wOpenMultiZone)
BLDialogSetFuncImplementation(BLDialog, BOOL,                         wHideExistTop)
BLDialogSetFuncImplementation(BLDialog, BOOL,                            wShowClose)
BLDialogSetFuncImplementation(BLDialog, BOOL,                       wFillBottomLine)
BLDialogSetFuncImplementation(BLDialog, BOOL,                       wMainShadowShow)
BLDialogSetFuncImplementation(BLDialog, BOOL,               wUserInteractionEnabled)
BLDialogSetFuncImplementation(BLDialog, BOOL,                              wBounces)
BLDialogSetFuncImplementation(BLDialog, DiaPopInView,                  wTapViewType)
BLDialogSetFuncImplementation(BLDialog, DialogPopType,                wPopStyleType)
BLDialogSetFuncImplementation(BLDialog, DialogLevel,                         wLevel)
BLDialogSetFuncImplementation(BLDialog, DialogToastPosition,         wToastPosition)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                       wThemeColor)
BLDialogSetFuncImplementation(BLDialog, CGPoint,                             wPoint)
BLDialogSetFuncImplementation(BLDialog, NSInteger,                 wListScrollCount)
BLDialogSetFuncImplementation(BLDialog, NSInteger,            wTableViewSectionHead)
BLDialogSetFuncImplementation(BLDialog, NSArray*,                   wDateShowCircle)
BLDialogSetFuncImplementation(BLDialog, NSArray<DialogCalanderLimitTypeKey>*,wMinMaxResultArr)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                        wAngleRadio)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                   wInputAreaHeight)
BLDialogSetFuncImplementation(BLDialog, UIView* ,                          wTapView)
BLDialogSetFuncImplementation(BLDialog, NSTimeInterval,           wAnimationDurtion)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                       wTitleColor)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                     wMessageColor)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                             wWidth)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                            wHeight)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                       wMainOffsetY)
BLDialogSetFuncImplementation(BLDialog, CGRect,                            wTapRect)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                     wMainBtnHeight)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                       wMainOffsetX)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                    wDisappelSecond)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                        wLineColor)
BLDialogSetFuncImplementation(BLDialog, id,                                wOKTitle)
BLDialogSetFuncImplementation(BLDialog, id,                            wCancelTitle)
BLDialogSetFuncImplementation(BLDialog, NSDictionary*,                     wRegular)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                  wBottomLineColor)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                          wOKColor)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                      wCancelColor)
BLDialogSetFuncImplementation(BLDialog, id,                                  wTitle)
BLDialogSetFuncImplementation(BLDialog, id,                                wMessage)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                   wKeyBoardMarginY)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                      wShadowColor)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                            wOKFont)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                        wCancelFont)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                         wLineAlpha)
BLDialogSetFuncImplementation(BLDialog, id,                                   wData)
BLDialogSetFuncImplementation(BLDialog, NSArray*,                          wSonData)
BLDialogSetFuncImplementation(BLDialog, NSArray*,                 wListDefaultValue)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                         wTitleFont)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                       wMessageFont)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                       wShadowAlpha)
BLDialogSetFuncImplementation(BLDialog, NSInteger,                             wTag)
BLDialogSetFuncImplementation(BLDialog, NSInteger,                          wPayNum)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                      wAutoMaxWidth)
BLDialogSetFuncImplementation(BLDialog, NSString*,             wDefaultSelectPayStr)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                    wMainBackColor)
BLDialogSetFuncImplementation(BLDialog, UIColor* ,            wInputBackGroundColor)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                        wMainRadius)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                        wLimitAlpha)
BLDialogSetFuncImplementation(BLDialog, NSInteger,                 wWirteTextMaxNum)
BLDialogSetFuncImplementation(BLDialog, NSString*,                     wPlaceholder)
BLDialogSetFuncImplementation(BLDialog, NSInteger,                wWirteTextMaxLine)
BLDialogSetFuncImplementation(BLDialog, UIKeyboardType,          wWirteKeyBoardType)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                      wPercentAngle)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                     wPercentOrginX)
BLDialogSetFuncImplementation(BLDialog, CGSize,                          wImageSize)
BLDialogSetFuncImplementation(BLDialog, NSInteger,                     wColumnCount)
BLDialogSetFuncImplementation(BLDialog, NSString*,                wWriteDefaultText)
BLDialogSetFuncImplementation(BLDialog, NSInteger,                        wRowCount)
BLDialogSetFuncImplementation(BLDialog, NSString*,                       wImageName)
BLDialogSetFuncImplementation(BLDialog, NSString*,                 wPopNestStopView)
BLDialogSetFuncImplementation(BLDialog, NSString*,           wReginerCollectionCell)
BLDialogSetFuncImplementation(BLDialog, DialogLocationType,           wLocationType)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                wProgressTintColor)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                   wTrackTintColor)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                   wInputTextColor)
BLDialogSetFuncImplementation(BLDialog, NSArray* ,                  wTableViewColor)
BLDialogSetFuncImplementation(BLDialog, NSString*,                    wDateTimeType)
BLDialogSetFuncImplementation(BLDialog, NSTextAlignment,             wTextAlignment)
BLDialogSetFuncImplementation(BLDialog, CGSize,                        wLoadingSize)
BLDialogSetFuncImplementation(BLDialog, UIColor*,                     wLoadingColor)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                        wCellHeight)
BLDialogSetFuncImplementation(BLDialog, NSString*,                       wSeparator)
BLDialogSetFuncImplementation(BLDialog, NSString*,                     wXMLPathName)
BLDialogSetFuncImplementation(BLDialog, CGSize,                   wCalanderCellSize)
BLDialogSetFuncImplementation(BLDialog, NSDate*,                       wDefaultDate)
BLDialogSetFuncImplementation(BLDialog, NSDate*,                           wMaxDate)
BLDialogSetFuncImplementation(BLDialog, NSDate*,                           wMinDate)
BLDialogSetFuncImplementation(BLDialog, CGSize,                          wAngleSize)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                      wLoadingWidth)
BLDialogSetFuncImplementation(BLDialog, CGFloat,                wPopViewBorderWidth)
BLDialogSetFuncImplementation(BLDialog, CGSize,                       wCellIconSize)
BLDialogSetFuncImplementation(BLDialog, DialogCellAlignType,           wCellAlignType)
BLDialogSetFuncImplementation(BLDialog, UIColor*,               wPopViewBorderColor)
BLDialogSetFuncImplementation(BLDialog, UITableViewCellSeparatorStyle,wSeparatorStyle)
BLDialogSetFuncImplementation(BLDialog, UIImage*,                       wCheckImage)
BLDialogSetFuncImplementation(BLDialog, NSArray<NSString*>*,  wCalanderWeekTitleArr)
BLDialogSetFuncImplementation(BLDialog, UIColor*,              wCellBackgroundColor)
BLDialogSetFuncImplementation(BLDialog, DialogPopCustomBlock,        wPopCustomView)
BLDialogSetFuncImplementation(BLDialog, DialogRectCorner,        wPopViewRectCorner)
BLDialogSetFuncImplementation(BLDialog, DialogType,                           wType)
BLDialogSetFuncImplementation(BLDialog, DialogShowAnination,         wShowAnimation)
BLDialogSetFuncImplementation(BLDialog, DialogHideAnination,         wHideAnimation)
BLDialogSetFuncImplementation(BLDialog, ChainType,                       wChainType)
BLDialogSetFuncImplementation(BLDialog, LoadingStyle,                  wLoadingType)
BLDialogSetFuncImplementation(BLDialog, DiaDirection,                    wDirection)
BLDialogSetFuncImplementation(BLDialog, DiaLogCustomCellBlock,          wCustomCell)
BLDialogSetFuncImplementation(BLDialog, DiaLogPresentCallBlock,     wParentHeadView)
BLDialogSetFuncImplementation(BLDialog, DiaLogPresentCallBlock,   wParentBottomView)
BLDialogSetFuncImplementation(BLDialog, DiaLogCellSelectlock,           wSelectCell)
BLDialogSetFuncImplementation(BLDialog, DialogClickBlock,               wEventClose)
BLDialogSetFuncImplementation(BLDialog, DialogClickBlock,         wEventShadomClose)
BLDialogSetFuncImplementation(BLDialog, DialogMenuClickBlock,       wEventMenuClick)
BLDialogSetFuncImplementation(BLDialog, DiaLogMyViewCallBlock,        wMyDiaLogView)
BLDialogSetFuncImplementation(BLDialog, DiaLogCollectionCellBlock,    wCalanderCell)
BLDialogSetFuncImplementation(BLDialog, DiaLogCollectionClickBlock,wCalanderCellClick)
BLDialogSetFuncImplementation(BLDialog, DialogClickBlock,            wEventOKFinish)
BLDialogSetFuncImplementation(BLDialog, DialogClickBlock,        wEventCancelFinish)
BLDialogSetFuncImplementation(BLDialog, DialogTableClickBlock,         wEventFinish)
BLDialogSetFuncImplementation(BLDialog, DialogCustomMainViewBlock,  wCustomMainView)
BLDialogSetFuncImplementation(BLDialog, DialogCustomTitle,           wCustomTitleLa)
BLDialogSetFuncImplementation(BLDialog, DialogCustomMessage,       wCustomMessageLa)
BLDialogSetFuncImplementation(BLDialog, DialogCustomOKBtn,             wCustomOKBtn)
BLDialogSetFuncImplementation(BLDialog, DialogCustomCancelBtn,     wCustomCancelBtn)
BLDialogSetFuncImplementation(BLDialog, DialogCustomCloseBtn,       wCustomCloseBtn)
BLDialogSetFuncImplementation(BLDialog, DialogCustomTextView,       wCustomTextView)
BLDialogSetFuncImplementation(BLDialog, DialogCustomImageView,     wCustomImageView)
BLDialogSetFuncImplementation(BLDialog, DialogCustomTableView,     wCustomTableView)
BLDialogSetFuncImplementation(BLDialog, DialogCustomMainShadomLayer,wCustomMainShadom)
BLDialogSetFuncImplementation(BLDialog, DialogCustomAnimal,  wEventCustomShowAmimal)
BLDialogSetFuncImplementation(BLDialog, DialogCustomAnimal,  wEventCustomHideAmimal)
BLDialogSetFuncImplementation(BLDialog, DialogCustomShareView,     wCustomShareView)
BLDialog * BLDialogCreate(void){
    return  [BLDialog  new];
}

- (BLDialog * _Nonnull (^)(NSDictionary<DialogDarkColorKey,UIColor *> * _Nullable))wDarkMode{
    return ^BLDialog*(NSDictionary<DialogDarkColorKey,UIColor *> * _Nullable info){
        self.param.wOpenDark = self.wOpenDark = YES;
        if (info && [info isKindOfClass:NSDictionary.class]) {
            for (NSString *key in info.allKeys) {
                if (BLDialogManage.shareInstance.darkColorInfo[key]) {
                    if ([info[key] isKindOfClass:UIColor.class])
                        BLDialogManage.shareInstance.darkColorInfo[key] = info[key];
                }
            }
        }
        [BLDialogManage setDefaultColorPropertiess:(BLDialogParam*)self];
        return self;
    };
}

- (BLDialog * _Nonnull (^)(void))wStart{
     return ^BLDialog*(){
         [self setUpUI:nil useConfig:YES];
         return self;
     };
}

- (BLDialog * _Nonnull (^)(UIView * _Nonnull))wStartView{
    return ^BLDialog*(UIView *startView){
        [self setUpUI:startView useConfig:YES];
        return self;
    };
}

- (BLDialog * _Nonnull (^)(BLDialogParam * _Nonnull))wStartParam{
    return ^BLDialog*(BLDialogParam *param){
        if (param) self.param = param;
        [self setUpUI:nil useConfig:param ? NO : YES];
        return self;
    };
}

- (BLDialog * _Nonnull (^)(BLDialogParam * _Nonnull, UIView * _Nonnull))wStartParamView{
    return ^BLDialog*(BLDialogParam *param,UIView *startView){
        if (param) self.param = param;
        [self setUpUI:startView useConfig:param ? NO : YES];
        return self;
    };
}

- (BLDialog * _Nonnull (^)(UIView<BLCustomPrototol> * _Nonnull))wCustomView{
    return ^BLDialog*(UIView<BLCustomPrototol> *customView){
        self.wType = DialogTypeMyView;
        self.mainView = (BLDialogNormal*)customView;
        return self;
    };
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [BLDialogManage.shareInstance setUpManageDefaultParam:(BLDialogParam*)self];
    }
    return self;
}

- (void)setUpUI:(nullable UIView*)startView useConfig:(BOOL)useeConfig{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.didScheduleUI || self.close) return;
        UIView *parentView = startView ? : DialogWindow;
        if (!parentView) {
            NSLog(@"BLDialog requires an explicit host view when no unique active window is available.");
            return;
        }
        self.didScheduleUI = YES;
        self.hostView = parentView;
        [parentView layoutIfNeeded];
        self.frame = parentView.bounds;
        self.normalRect = self.frame;
        self.beforeRect = CGRectZero;
        if (useeConfig) [self setPropertiesToParam];
        [self.param setUpDefaultParam];
        [self setUpUI];
        [self setUIdelagate:startView];
    });
}

- (void)setPropertiesToParam{
    u_int count = 0;
    objc_property_t *properties = class_copyPropertyList([BLDialogParentParam class], &count);
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *proper = [NSString stringWithUTF8String:propertyName];
        if (![proper isEqualToString:@"wOpenDark"]) {
            id object = [self valueForKey:proper];
            id paramObject = [self.param valueForKey:proper];
            if (object && paramObject != object) {
                [self.param setValue:object forKey:proper];
            }
        }
    }
    free(properties);
}

/// UI赋值
- (void)setUpUI{
    if (self.param.wType == DialogTypeWrite ||
        self.param.wType == DialogTypePay ||
        self.param.wOpenKeyBoard) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"keyboardWillShow:") name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(@"keyboardWillHide:") name:UIKeyboardWillHideNotification object:nil];
    }
    self.shadowView.frame = self.bounds;
    self.shadowView.backgroundColor = self.param.wShadowColor;
    self.shadowView.alpha = self.param.wShadowAlpha;

    if (self.param.wShadowCanTap) {
        self.shadowView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shadomClick)];
        [self.shadowView addGestureRecognizer:tap];
    }

    if (self.param.wDeviceDidChange)
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];

}

/// 设置UI代理
- (void)setUIdelagate:(nullable UIView*)showView{
    /// 兼容旧版本自定义方式
    if (self.param.wMyDiaLogView && self.wType == DialogTypeMyView) {
        [self addSubview:self.mainView];
        self.mainView.param = self.param;
        self.mainView.backgroundColor = self.param.wMainBackColor;
        self.mainView.frame = CGRectMake(0, 0, self.wWidth, DialogRealW(267));
        if (self.param.wHeight == DialogRealW(400)) self.param.wHeight = 0;
        [self showView:showView];
        UIView *bottomView = self.param.wMyDiaLogView(self.mainView);
        [self.mainView layoutIfNeeded];
        [bottomView layoutIfNeeded];
        self.param.wWidth = MAX(bottomView.frame.size.width, self.param.wWidth);
        BOOL customHeight = (self.param.wHeight > 0);
        if (self.param.wAddBottomView) {
            UIView *addBottomView  = [self.mainView addBottomView:CGRectGetMaxY(bottomView.frame) + self.param.wMainOffsetY];
            [self reSetMainViewFrame:CGRectMake(0, 0, self.param.wWidth, customHeight?self.param.wHeight:(CGRectGetMaxY(addBottomView.frame)+self.param.wMainOffsetY))];
        }else{
            [self reSetMainViewFrame:CGRectMake(0, 0, self.param.wWidth, customHeight?self.param.wHeight:CGRectGetMaxY(bottomView.frame))];
        }

        if (self.param.wDisappelSecond != DialogDisappealTime && self.param.wDisappelSecond) {
            [self performSelector:@selector(closeView) withObject:nil afterDelay:self.param.wDisappelSecond];
        }
        [self showView:showView];
    }else {
        if (self.wType != DialogTypeMyView){
            self.mainView  = [NSClassFromString(self.configDic[@(self.param.wType)]) initWithParam:self.param];
        }else{
            if ([self.mainView isKindOfClass:NSClassFromString(@"BLDialogView")] && !self.mainView.param)
                self.mainView.param = self.param;
        }
        [self addSubview:self.mainView];
        self.mainView.backgroundColor = self.param.wMainBackColor;
        if ([self.mainView conformsToProtocol:@protocol(BLCustomPrototol)]) {
            if ([self.mainView respondsToSelector:@selector(mz_setupView)])
                [self.mainView mz_setupView];
            if ([self.mainView respondsToSelector:@selector(mz_setupRect)]) {
                BOOL center = YES;
                if ([self.mainView respondsToSelector:@selector(mz_centerView)])
                    center = [self.mainView mz_centerView];

                CGRect rect = [self.mainView mz_setupRect];
                if (!CGRectIsEmpty(rect)){
                    if (center) {
                        [self reSetMainViewFrame:rect];
                    }else{
                        self.mainView.frame = rect;
                        if ([self.mainView respondsToSelector:@selector(mz_changeFrame:)])
                            [self.mainView mz_changeFrame:[NSValue valueWithCGRect:self.mainView.frame]];
                    }
                }else{
                    if ([self.mainView respondsToSelector:@selector(mz_changeFrame:)])
                        [self.mainView mz_changeFrame:[NSValue valueWithCGRect:self.mainView.frame]];
                }
            }

            if ([self.mainView respondsToSelector:@selector(mz_setupCorner)]) {
                UIRectCorner corner = [self.mainView mz_setupCorner];
                if (corner != -99999)
                    [BLDialogUntils setCornerView:self.mainView radio:CGSizeMake(self.param.wMainRadius,self.param.wMainRadius) rectCorner:corner];
            }else{
                self.mainView.layer.cornerRadius = self.param.wMainRadius;
                self.mainView.layer.masksToBounds = YES;
            }
        }

        [self showView:showView];
        /// 自动消失
        if ([self.mainView conformsToProtocol:@protocol(BLCustomPrototol)] &&
            [self.mainView respondsToSelector:@selector(mz_autoDisappeal)]) {
            CGFloat disappealTime = [self.mainView mz_autoDisappeal];

            if (disappealTime > 0){
                [self performSelector:@selector(closeView) withObject:nil afterDelay:disappealTime];
            }else{
                if (self.param.wDisappelSecond != DialogDisappealTime && self.param.wDisappelSecond) {
                    [self performSelector:@selector(closeView) withObject:nil afterDelay:self.param.wDisappelSecond];
                }
            }

            if ([self.mainView respondsToSelector:@selector(mz_changeValue:)])
                [self.mainView mz_changeValue:self.param.wData];
        }else{
            if (self.param.wDisappelSecond != DialogDisappealTime && self.param.wDisappelSecond) {
                [self performSelector:@selector(closeView) withObject:nil afterDelay:self.param.wDisappelSecond];
            }
        }
    }

    if (self.param.wMainShadowShow && self.param.wType != DialogTypeCardPresent) {
        CGRect rect = self.mainView.frame;
        UIView *shadowView = [[UIView alloc]initWithFrame:rect];
        [self addSubview:shadowView];
        shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
        shadowView.layer.shadowOffset = CGSizeMake(5, 5);
        shadowView.layer.shadowOpacity = 0.5;
        shadowView.layer.shadowRadius = 9.0;
        shadowView.layer.cornerRadius = 9.0;
        shadowView.clipsToBounds = NO;

        if (self.param.wCustomMainShadom)
            self.param.wCustomMainShadom(shadowView.layer);

        [shadowView addSubview:self.mainView];
        self.mainView.frame = shadowView.bounds;
    }

    if (!CGPointEqualToPoint(self.param.wPoint, CGPointMake(-999, -999))) {
        CGRect rect = self.mainView.frame;
        rect.origin = self.param.wPoint;
        self.mainView.frame = rect;
    }
    if (self.param.wCustomTitleLa && [self.mainView valueForKey:@"titleLabel"])
        self.param.wCustomTitleLa([self.mainView valueForKey:@"titleLabel"]);
    if (self.param.wCustomMessageLa && [self.mainView valueForKey:@"textLabel"])
        self.param.wCustomMessageLa([self.mainView valueForKey:@"textLabel"]);
    if (self.param.wCustomOKBtn && [self.mainView valueForKey:@"OKBtn"])
        self.param.wCustomOKBtn([self.mainView valueForKey:@"OKBtn"]);
    if (self.param.wCustomCancelBtn && [self.mainView valueForKey:@"cancelBtn"])
        self.param.wCustomCancelBtn([self.mainView valueForKey:@"cancelBtn"]);
    if (self.param.wCustomCloseBtn && [self.mainView valueForKey:@"closeBtn"])
        self.param.wCustomCloseBtn([self.mainView valueForKey:@"closeBtn"]);
    if (self.param.wCustomImageView && [self.mainView valueForKey:@"iconIV"])
        self.param.wCustomImageView([self.mainView valueForKey:@"iconIV"]);
    if (self.param.wCustomTableView && [self.mainView valueForKey:@"tableView"]){
        BLDialogTableView *tableView = [self.mainView valueForKey:@"tableView"];
        [tableView reloadData];
        [tableView layoutIfNeeded];
        self.param.wCustomTableView(tableView);
    }
    if (self.param.wCustomMainView) self.param.wCustomMainView(self.mainView);
}

/// 开始
- (void)showView:(nullable UIView*)showView{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{ [self showView:showView]; });
        return;
    }
    if (self.close) return;
    @DialogWeakify(self);
    UIView *view = showView ?: self.hostView ?: DialogWindow;
    if (self.param.wTag) {
        self.tag = self.param.wTag;
        BLDialog *existView = [view viewWithTag:self.param.wTag];
        if ([existView isKindOfClass:BLDialog.class] &&
            existView.wType == self.param.wType) return;
    }
    if (!view) return;

    self.userInteractionEnabled = self.param.wUserInteractionEnabled;
    self.accessibilityViewIsModal = YES;
    [BLDialogManage.shareInstance addDialog:self cover:NO superView:view];
    if (self.param.wShowAnimation != AninatonShowNone ) {
        self.mainView.userInteractionEnabled = NO;
        self.shadowView.userInteractionEnabled = NO;
    }
    if (self.param.wEffectShow) {
        [self addSubview:self.effectView];
        self.shadowView.backgroundColor = [UIColor clearColor];
        [self insertSubview:self.effectView  belowSubview:self.mainView];
    }
    if (self.param.wShadowShow) {
        [self insertSubview:self.shadowView  belowSubview:self.mainView];
        if (self.param.wShowAnimation != AninatonShowNone) {
            self.shadowView.alpha = 0;
            [UIView animateWithDuration:0.3 animations:^{
                self.shadowView.alpha = self.param.wShadowAlpha;
            }];
        }
    }
    [self bringSubviewToFront:self.mainView];
    [self setParentVCView:0.9];

    if(self.param.wEventCustomShowAmimal){
        self.param.wEventCustomShowAmimal(self.mainView, ^{
            @DialogStrongify(self)
            self.mainView.userInteractionEnabled = YES;
            self.shadowView.userInteractionEnabled = self.param.wShadowCanTap;
        });
    }else{
        [self dealAnamtionShowWithView:self.mainView withType:self.param.wShowAnimation withTime:self.param.wAnimationDurtion block:^{
            @DialogStrongify(self)
            self.mainView.userInteractionEnabled = YES;
            self.shadowView.userInteractionEnabled = self.param.wShadowCanTap;
        }];
    }
}

/// 关闭
- (void)closeView:(nullable AnimalBlock)block{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{ [self closeView:block]; });
        return;
    }
    if (!self.param.wAutoClose){
        if (block) block();
        return;
    }
    if (self.close) {
        if (!self.didCompleteClose && block) {
            if (!self.closeCompletions) self.closeCompletions = [NSMutableArray new];
            [self.closeCompletions addObject:[block copy]];
        } else if (block) {
            block();
        }
        return;
    }
    self.close = YES;
    if (block) {
        if (!self.closeCompletions) self.closeCompletions = [NSMutableArray new];
        [self.closeCompletions addObject:[block copy]];
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(closeView) object:nil];
    if (self.param.wType == DialogTypePay || self.param.wType == DialogTypeWrite)
        [self.mainView endEditing:YES];

    @DialogWeakify(self)
    if (self.param.wType == DialogTypeShare||
        self.param.wType == DialogTypeTabbarMenu||
        self.param.wType == DialogTypeNaviMenu) {
        BLDialogAnimation *animation = [BLDialogAnimation new];
        if (self.param.wEffectShow) {
            [UIView animateWithDuration:self.param.wAnimationDurtion animations:^{
                self.effectView.alpha = 0;
            }];
        }
        if (self.param.wShadowShow) {
            [UIView animateWithDuration:self.param.wAnimationDurtion animations:^{
                self.shadowView.alpha = 0;
            }];
        }
        for (UIView *view in [self.mainView subviews]) {
            if (view.tag != 10086) {
                [UIView animateWithDuration:self.param.wAnimationDurtion animations:^{
                    view.alpha = 0;
                }];
            }
        }
        [animation rotationDisappealClockwiseAnimationWithView:[self.mainView viewWithTag:666] duration:self.param.wAnimationDurtion];
        animation.block = ^{
            @DialogStrongify(self)
            [[self.mainView viewWithTag:666] removeFromSuperview];
        };
        UIScrollView *sc = [self.mainView viewWithTag:10086];
        if (sc && [sc isKindOfClass:UIScrollView.class]) {
            [UIView animateWithDuration:self.param.wAnimationDurtion * 1.5 animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                if ([sc.subviews count] == 0) [self completeClose];
            }];
            if (sc.subviews.count > 0) {
                springHideAnimation(sc, self.param.wAnimationDurtion, [sc subviews], ^{
                    @DialogStrongify(self)
                    [self completeClose];
                });
            }
        }else{
            [self closeAction];
        }
    }else{
        [self closeAction];
    }
    [self setParentVCView:1.0];
}

- (void)closeView{
    [self closeView:nil];
}

- (void)closeAction{
    @DialogWeakify(self)
    if(self.isUserInteractionEnabled) self.userInteractionEnabled = NO;
    if(self.param.wEventCustomHideAmimal){
        if (self.param.wShadowShow) {
            [UIView animateWithDuration:self.param.wAnimationDurtion animations:^{
                self.shadowView.alpha = 0;
            }];
        }
        self.param.wEventCustomHideAmimal(self.mainView, ^{
            @DialogStrongify(self)
            [self completeClose];
        });
    }else{
        if (self.param.wHideAnimation) {
             if (self.param.wShadowShow) {
                 [UIView animateWithDuration:self.param.wAnimationDurtion animations:^{
                     self.shadowView.alpha = 0;
                 }];
            }
            [self dealAnamtionHideWithView:self.mainView withType:self.param.wHideAnimation withTime:self.param.wAnimationDurtion block:^{
                @DialogStrongify(self)
                [self completeClose];
            }];
        }else{
            [self completeClose];
        }
    }
}
- (void)completeClose{
    if (self.didCompleteClose) return;
    self.didCompleteClose = YES;
    [self closeBlock];
    [self removeFromSuperview];
    NSArray *completions = [self.closeCompletions copy];
    [self.closeCompletions removeAllObjects];
    for (AnimalBlock completion in completions) completion();
}
- (void)closeBlock{
    if (self.param.wEventClose) self.param.wEventClose(self, self);
    [BLDialogManage.shareInstance deleteDialog:self];
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (!newSuperview && self.superview) {
        [BLDialogManage.shareInstance deleteDialog:self];
    }
    [super willMoveToSuperview:newSuperview];
}

+ (void)closeWithshowView:(nullable UIView*)showView block:(nullable AnimalBlock)block{
    [BLDialog closeWithshowView:showView tag:0 block:block];
}

+ (void)closeWithshowView:(nullable UIView*)showView tag:(NSInteger)tag block:(nullable AnimalBlock)block{
    UIView *view = showView?:DialogWindow;
    BLDialog *dialog = nil;
    for (BLDialog *sonView in view.subviews) {
        if ([sonView isKindOfClass:[BLDialog class]]) {
            if (tag) {
                if (sonView.tag == tag) {
                    dialog = sonView;
                    break;
                }
            }else{
                dialog = sonView;
                break;
            }
        }
    }
    if (dialog) {
        dialog.param.wAutoClose = YES;
        [dialog closeView:block];;
    }
}

/// 缩放底部控制器
- (void)setParentVCView:(CGFloat)scale{
    if (!self.param.wScaleParentVC) return;
    if (self.param.wType != DialogTypeCardPresent) return;
    [UIView animateWithDuration:0.3 animations:^{
        UIViewController *VC = [BLDialogUntils getCurrentVC];
        if (VC.navigationController) {
            VC.navigationController.view.transform = CGAffineTransformMakeScale(scale, scale);
        }else{
            VC.view.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }];
}

/// 重新设置frame
- (void)reSetMainViewFrame:(CGRect)frame{
    CGPoint center = CGPointZero;
    CGFloat safeBottom = 0;
    if (@available(iOS 11.0, *)) safeBottom = self.safeAreaInsets.bottom;
    frame.size.width = MIN(self.bounds.size.width, frame.size.width);
    frame.size.height = MIN(MAX(0, self.bounds.size.height - safeBottom), frame.size.height);
    if (self.param.wMainToBottom) {
        frame.origin.y = self.bounds.size.height - CGRectGetMaxY(frame);
        if (safeBottom > 0) {
            frame.origin.y -= safeBottom;
            frame.size.height += safeBottom;
            UIView *view = [self.mainView viewWithTag:0x574D5A];
            if (!view) {
                view = [UIView new];
                view.tag = 0x574D5A;
                [self.mainView addSubview:view];
            }
            if (self.param.wType == DialogTypeShare) {
                view.backgroundColor = self.mainView.cancelBtn.backgroundColor;
            }else{
                view.backgroundColor = self.mainView.backgroundColor;
            }
            view.frame = CGRectMake(0, frame.size.height - safeBottom, frame.size.width, safeBottom);
        }
        self.mainView.frame = frame;
        center = CGPointMake(CGRectGetMidX(self.bounds), self.mainView.center.y);
    }else{
        center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        self.mainView.frame = frame;
    }
    self.mainView.center = center;
    if ([self.mainView respondsToSelector:@selector(mz_changeFrame:)]) {
        [self.mainView mz_changeFrame:[NSValue valueWithCGPoint:center]];
    }
}

/// 阴影点击
- (void)shadomClick{
    [self closeView];
    if (self.param.wEventShadomClose) self.param.wEventShadomClose(self, self.shadowView);
}

/// 横竖屏通知
- (void)change:(NSNotification*)notification{
    self.frame = self.superview.bounds;
    self.shadowView.frame = self.bounds;
    CGRect frame = self.mainView.frame;
    if (self.param.wMainToBottom) {
        [self reSetMainViewFrame:frame];
    }else{
        self.mainView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        if (self.param.wType == DialogTypePay || self.param.wType == DialogTypeWrite) {
            [self becomeFirstResponder];
        }
    }
}

@end
