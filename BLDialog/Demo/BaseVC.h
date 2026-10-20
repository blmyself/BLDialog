//
//  BaseVC.h
//  BLDialog
//
//  Created by wmz on 2020/4/10.
//  Copyright © 2020 wmz. All rights reserved.
//


#import "BLDialog.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseVC : UIViewController
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat btnWidth;
-(void)action:(UIButton*)sender;
@end

NS_ASSUME_NONNULL_END
