//
//  BLDialogDateView.h
//  BLDialog
//
//  Created by wmz on 2021/7/28.
//  Copyright © 2021 wmz. All rights reserved.
//

#import "BLDialogTable.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLDialogCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *dateLable;

@property (nonatomic, strong) UILabel *chineseLable;

@property (nonatomic, strong) UILabel *circleLabel;

@end

@interface BLDialogCollectionNormalCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *dateLable;

@property (nonatomic,strong) UILabel *circleLabel;

@end


@interface BLDialogCalanderCell : BLDialogCollectionCell

@end


@interface BLDialogDateView : BLDialogTable

@end

NS_ASSUME_NONNULL_END
