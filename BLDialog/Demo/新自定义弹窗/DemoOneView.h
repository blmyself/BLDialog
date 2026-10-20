//
//  DemoOneView.h
//  BLDialog
//
//  Created by wmz on 2021/9/28.
//  Copyright © 2021 wmz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLCustomPrototol.h"
NS_ASSUME_NONNULL_BEGIN

@interface DemoOneView : UIView<BLCustomPrototol>
@property (weak, nonatomic) IBOutlet UIButton *confirmBTN;
@property (weak, nonatomic) IBOutlet UIButton *closeBTN;
+ (DemoOneView*)loadNibView;
@end

NS_ASSUME_NONNULL_END
