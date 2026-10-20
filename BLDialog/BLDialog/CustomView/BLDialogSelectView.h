//
//  BLDialogSelectView.h
//  BLDialog
//
//  Created by wmz on 2021/7/21.
//  Copyright © 2021 wmz. All rights reserved.
//

#import "BLDialogTable.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLDialogSelectView : BLDialogTable<NSXMLParserDelegate>

- (void)updateMenuChildrenDataWithSection:(NSInteger)section withUpdateChildren:(BOOL)update withData:(NSArray *)data;

@end

NS_ASSUME_NONNULL_END
