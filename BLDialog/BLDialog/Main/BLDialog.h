//
//  BLDialog.h
//  BLDialog
//
//  Created by wmz on 2019/6/5.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import "BLDialogBase.h"

NS_ASSUME_NONNULL_BEGIN

@class BLDialog;
BLDialog * BLDialogCreate(void);

@interface BLDialog : BLDialogBase
/// 初始化
/// 使用自定义弹窗 （实现BLCustomPrototol协议的视图）
@property (nonatomic, copy, readonly) BLDialog *(^wCustomView)(UIView <BLCustomPrototol>*customView);
/// 开启暗黑模式 字典传nIl使用默认的暗黑颜色 传对应key则改变颜色 此处为全局配置
@property (nonatomic, copy, readonly) BLDialog *(^wDarkMode)(NSDictionary <DialogDarkColorKey, UIColor*>* _Nullable darkinfo);
/// 开始 必传
@property (nonatomic, copy, readonly) BLDialog *(^wStart)(void);
/// 开始 带父视图 必传
@property (nonatomic, copy, readonly) BLDialog *(^wStartView)(UIView *parentView);
/// 开始 带配置 必传
@property (nonatomic, copy, readonly) BLDialog *(^wStartParam)(BLDialogParam *param);
/// 开始 带配置和父视图 必传
@property (nonatomic, copy, readonly) BLDialog *(^wStartParamView)(BLDialogParam *param,UIView *parentView);
/// 开始 必传
@property (nonatomic, copy, readonly) BLDialog *(^wStartConfig)(DialogCustomParam param);
/// 手动弹出视图
/// @param showView 父视图 nil 则为默认window
- (void)showView:(nullable UIView*)showView;

/// 手动关闭
- (void)closeView;

/// 手动关闭
/// @param block 动画结束回调
- (void)closeView:(nullable AnimalBlock)block;

/// 手动关闭 类方法
/// @param showView 父视图 nil 则为window
/// @param block 动画结束回调
+ (void)closeWithshowView:(nullable UIView*)showView block:(nullable AnimalBlock)block;

/// 手动关闭 类方法
/// @param tag tag
/// @param showView 父视图 nil 则为window
/// @param block 动画结束回调
+ (void)closeWithshowView:(nullable UIView*)showView tag:(NSInteger)tag block:(nullable AnimalBlock)block;

/// 重新设置frame
/// @param frame frame
- (void)reSetMainViewFrame:(CGRect)frame;

/// 数据源
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, id,                       wData)
/// 设置弹窗tag 防止快速点击重复弹出 (也可设置不同tag 依次弹出)
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wTag)
/// 设置弹窗的层级 层级高的在上层 可传入NSInteger 范围在0-999之间 必须同一父级才有效 default DialogLevelHigh
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogLevel,              wLevel)
/// 弹窗type
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogType,               wType)
/// 弹窗出现的动画 default AninatonShowNone
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogShowAnination,      wShowAnimation)
/// 弹窗消失的动画 default AninatonHideNone
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogHideAnination,      wHideAnimation)
/// 弹窗动画时间
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSTimeInterval,           wAnimationDurtion)
/// 默认选中 可传/model/@(index)/字符串/{@"id"}/ 的数组 单个表示单选 多个表示多选
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSArray*,                 wListDefaultValue)
/// 列表达到滚动的个数 default 8
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wListScrollCount)
/// 弹窗的宽度
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wWidth)
/// 弹窗的高度
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wHeight)
/// 竖直方向间距
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wMainOffsetY)
/// 水平方向间距
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wMainOffsetX)
/// 按钮高度  shareview高度
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wMainBtnHeight)
/// cell高度
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wCellHeight)
/// 线条颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wLineColor)
/// 线条透明度
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wLineAlpha)
/// 标题颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wTitleColor)
/// 内容颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wMessageColor)
/// sheet底部颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wBottomLineColor)
/// 标题文本
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, id,                       wTitle)
/// 内容文本
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, id,                       wMessage)
/// 主题色 default =  OKColor
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wThemeColor)
/// 确定按钮的文本
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, id,                       wOKTitle)
/// 取消按钮的文本
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, id,                       wCancelTitle)
/// 确定按钮的颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wOKColor)
/// 取消按钮的颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wCancelColor)
/// 弹窗背景颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wMainBackColor)
/// 确定按钮的font
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wOKFont)
/// 取消按钮的font
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wCancelFont)
/// 标题文本font
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wTitleFont)
/// 内容文本font
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wMessageFont)
/// 弹窗视图的圆角
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wMainRadius)
/// 遮罩层颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wShadowColor)
/// 遮罩层透明度
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wShadowAlpha)
/// 遮罩层能否点击
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wShadowCanTap)
/// 遮罩层是否显示
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wShadowShow)
/// v1.4.3显示主视图的阴影  default NO
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wMainShadowShow)
/// 毛玻璃是否显示 优先级大于遮罩层
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wEffectShow)
/// 多选
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wMultipleSelection)
/// 选中是否打钩
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wSelectShowChecked)
/// 是否将弹窗放置最底部
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wMainToBottom)
/// 是否监听横竖屏 default NO
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wDeviceDidChange)
/// 是否添加底部确定取消按钮
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wAddBottomView)
/// 隐藏已经存在的头部确定视图
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wHideExistTop)
/// 下划线样式 default none
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, UITableViewCellSeparatorStyle,wSeparatorStyle)
/// 选中打钩图片 default dialog_check
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIImage*,                 wCheckImage)
/// 开启键盘监听 自动偏移在键盘上部 default NO
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wOpenKeyBoard)
/// 底部确定取消按钮中间横线充满 default NO
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wFillBottomLine)
/// 响应库内的自动关闭 default YES 如果设为NO则需要自己调用手动关闭的类方法 closeWithshowView
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wAutoClose)
/// 自定义位置 default使用系统
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGPoint,                  wPoint)
/// 自动消失时间
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wDisappelSecond)
/// 是否可交互 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wUserInteractionEnabled)
/// cell背景颜色 defalult white
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wCellBackgroundColor)
/// cell所带图片的size default {30,30}
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGSize,                   wCellIconSize)
/// cell文本居中样式
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSTextAlignment,          wTextAlignment)

/*=========================================aoto=======================================================================*/
/// v1.4.3 最大宽度 默认等于wWidth
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wAutoMaxWidth)
/// toastPosition
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogToastPosition,      wToastPosition)

/*=========================================Pay=======================================================================*/
/// 距离弹窗键盘的距离
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wKeyBoardMarginY)
/// 嵌套弹窗的数据源
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSArray*,                 wSonData)
/// 密码框数量
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wPayNum)
/// 支付方式默认文本
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wDefaultSelectPayStr)
/// 关闭支付方式点击 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wCanSelectPay)

/*=========================================write=======================================================================*/
/// 提示文本
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wPlaceholder)
/// 默认文本
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wWriteDefaultText)
/// 编辑框最大行数 大于行数则滚动
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wWirteTextMaxLine)
/// 编辑框可输入的文本最大文本长度
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wWirteTextMaxNum)
/// 键盘类型
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, UIKeyboardType,           wWirteKeyBoardType)
/// 正则校验规则 default nil  例如 可传入 @{@"reguler":@"^1+[3578]+\\d{9}",@"reguletTip":@"请输入正确的手机号"}  key为DialogRegularKey
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSDictionary*,            wRegular)
///  多行文本默认高度 default lineHeight + 20
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wInputAreaHeight)
/// 输入框背景颜色 default  .white
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor* ,                wInputBackGroundColor)
/// 编辑框颜色 default black
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wInputTextColor)

/*=========================================Pop=======================================================================*/
/// 弹出的气泡位置
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wPercentAngle)
/// 弹出视图的中心X轴偏移
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wPercentOrginX)
/// 弹出视图的位置 上下左右
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DiaDirection,             wDirection)
/// 弹出视图的位置对象 必传(如果传入wTapRect则可不传)
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIView* ,                 wTapView)
/// 如果弹出视图的frame不准确 可以自行调节
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGRect,                   wTapRect)
/// 是否是导航栏的按钮点击弹窗
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wNavigationItem)
/// 所在父视图的类型
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DiaPopInView,             wTapViewType)
/// 父视图的tableviewHead还是tableviewFoot default Head
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wTapViewTableViewFoot)
/// 在tableViewHead上的按钮所在的headViewSection的index default 0
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wTableViewSectionHead)
/// 弹窗视图的borderWidth default 0
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wPopViewBorderWidth)
/// 弹窗视图的borderColor default 主题颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wPopViewBorderColor)
/// 弹窗视图的圆角 可单独设置或者全部设置  默认无 和UIRectCorner用法相同 多了一个none
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogRectCorner,         wPopViewRectCorner)
/// 三角形的size
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGSize,                   wAngleSize)
/// 三角形的顶部圆角 default 0
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wAngleRadio)
/// v1.4.4 pop弹窗内容视图类型 default DialogPopTypeTable tableView列表样式
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogPopType,            wPopStyleType)
/// 如果弹出视图的位置不对 设置此属性 例如继承了tableView则传入 继承的类名 default nil
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wPopNestStopView)
/// cell内容对齐位置(图文有效) 传入字符串的时候使用wTextAlignment default 左对齐
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogCellAlignType,       wCellAlignType)

/// 可设置wMainOffsetY 调整弹出视图的y default 0
/// wMainOffsetY

/*=========================================dowm=======================================================================*/
/// 图片的size
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGSize,                   wImageSize)
/// 图片的路径
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wImageName)
/// 进度条颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wProgressTintColor)
/// 进度条运动的颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wTrackTintColor)


/*=========================================menu=======================================================================*/
/// tableview的颜色 有tableViewCell的时候取数组的第一个 可改变背景颜色
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSArray* ,                wTableViewColor)

/*=========================================location=======================================================================*/
/// 地区的类型 1省 2省市 3省市区
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, DialogLocationType,       wLocationType)
/// 弹出的地区选择类型 pickview/tableview
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, ChainType,                wChainType)
/// 选中数据的分割符 默认‘，’
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wSeparator)
/// 默认地区的数据路径名称 default @"province_data"
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wXMLPathName)

/*=========================================datePicker===================================================================*/
/// 时间弹窗的样式
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wDateTimeType)
/// 循环滚动
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wPickRepeat)
/// 默认选中时间 默认此刻
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, NSDate*,                  wDefaultDate)
/// 最大时间 default nil
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, NSDate*,                  wMaxDate)
/// 最小时间 default nil
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, NSDate*,                  wMinDate)

/*=========================================Share/tabbarMenu/NaviMENU==================================================*/
/// BLDialogShareView显示多少列 default 4
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wColumnCount)
/// BLDialogShareView显示多少行 default 1
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, NSInteger,                wRowCount)

/*=========================================load=======================================================================*/
/// 加载框样式
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, LoadingStyle,             wLoadingType)
/// 加载框大小
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGSize,                   wLoadingSize)
/// 加载框线条颜色
BLDialogStatementAndPropSetFuncStatement(strong, BLDialog, UIColor*,                 wLoadingColor)
/// 显示右上角关闭按钮 default NO
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wShowClose)
/// 加载框线条宽度 default 2.5f
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wLoadingWidth)

/*=========================================cardParent==============================================================*/
/// 滑动到顶部继续滑动可关闭 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wOpenScrollClose)
/// 开启侧滑滑动关闭 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wLeftScrollClose)
/// 开启拖动 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wOpenDragging)
/// 缩放底部控制器 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wScaleParentVC)
/// 自定义顶部视图
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DiaLogPresentCallBlock,   wParentHeadView)
/// 自定义底部视图
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DiaLogPresentCallBlock,   wParentBottomView)

/*=========================================Calander==============================================================*/
/// 开启纵向滑动 default NO(横向滑动)
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wDirectionVertical)
/// 开启滑动 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wCalanderCanScroll)
/// 开启农历节日显示 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wOpenChineseDate)
/// 隐藏日历上的按钮 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wHideCalanderBtn)
/// 展示圆点的日期 携带格式为yyyy-MM-dd的日期
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSArray*,                 wDateShowCircle)
/// 注册自定义的collectionViewCell
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSString*,                wReginerCollectionCell)
/// 开启选择多个选续区域 default YES
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wOpenMultiZone)
/// 多选中间部分透明度 default 1 不透明
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGFloat,                  wLimitAlpha)
/// cellSize default(屏幕宽度/7,屏幕宽度/7) 如果设置了那么 wWidth为 wCalanderCellSize.width * 7
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, CGSize,                   wCalanderCellSize)
/// 日历顶部标题数组 必须为数量 = 7 的数组
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSArray<NSString*>*,      wCalanderWeekTitleArr)
/// 设置日历设置最大最小值的效果 default @[DialogCalanderLimitCloseClick]
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, NSArray<DialogCalanderLimitTypeKey>*,wMinMaxResultArr)
/// 是否开启wBounces 默认NO
BLDialogStatementAndPropSetFuncStatement(assign, BLDialog, BOOL,                     wBounces)

/*=========================================Attributes==========================================*/


/*=========================================Event================================================*/
/// 自定义tableviewCell (带是否选中isSelected 参数)
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DiaLogCustomCellBlock,    wCustomCell)
/// 自定义点击tableviewCell
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DiaLogCellSelectlock,     wSelectCell)
/// 自定义弹窗视图内容
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DiaLogMyViewCallBlock,    wMyDiaLogView)
/// 按钮确定点击事件
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogClickBlock,         wEventOKFinish)
/// 按钮取消点击事件
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogClickBlock,         wEventCancelFinish)
/// 阴影关闭事件
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogClickBlock,         wEventShadomClose)
/// 操作完成事件
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogTableClickBlock,    wEventFinish)
/// 弹窗关闭事件
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogClickBlock,         wEventClose)
/// 菜单点击事件
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogMenuClickBlock,     wEventMenuClick)
/// 自定义日历cell
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DiaLogCollectionCellBlock,wCalanderCell)
/// 自定义日历点击事件
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DiaLogCollectionClickBlock,wCalanderCellClick)
///v1.4.4 pop弹窗自定义内容视图
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogPopCustomBlock,      wPopCustomView)
/// 自定义出现动画
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomAnimal,        wEventCustomShowAmimal)
/// 自定义消失动画
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomAnimal,        wEventCustomHideAmimal)

/*=========================================Event================================================*/

/*=========================================CustomView================================================*/
/// 自定义mainView 可改变frame
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomMainViewBlock,wCustomMainView)
/// 自定义TitleLa
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomTitle,wCustomTitleLa)
/// 自定义MessageLa
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomMessage,wCustomMessageLa)
/// 自定义OKBtn
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomOKBtn,wCustomOKBtn)
/// 自定义CancelBtn
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomCancelBtn,wCustomCancelBtn)
/// 自定义closeBtn
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomCloseBtn,wCustomCloseBtn)
/// 自定义TextView
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomTextView,wCustomTextView)
/// 自定义ImageView
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomImageView,wCustomImageView)
/// 自定义tableview
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomTableView,wCustomTableView)
/// v1.4.3 自定义修改主视图阴影 非底部阴影
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomMainShadomLayer,wCustomMainShadom)
/// 自定义shareView
BLDialogStatementAndPropSetFuncStatement(copy,   BLDialog, DialogCustomShareView,wCustomShareView)
/*=========================================CustomView================================================*/
@end

NS_ASSUME_NONNULL_END
