//
//  BLDialogTests.m
//  BLDialogTests
//
//  Created by wmz on 2019/6/5.
//  Copyright © 2019年 wmz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../BLDialog/BLDialog/Main/BLDialog.h"
#import "../BLDialog/BLDialog/CustomView/BLDialogDateView.h"
#import "../BLDialog/BLDialog/CustomView/BLDialogSelectView.h"
#import "../BLDialog/BLDialog/Main/BLDialog.h"

@interface BLDialogTests : XCTestCase

@end

@interface BLDialogDateView (B2Testing)
- (NSArray *)timeDayWithArr:(NSArray *)arr Data:(NSDictionary *)limitDic;
@end

@implementation BLDialogTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testCurrentDialogReturnsNilForDetachedViewsAndFindsOwner {
    BLDialogManage *manager = BLDialogManage.shareInstance;
    XCTAssertNil([manager currentDialog:[UIView new]]);

    BLDialog *dialog = BLDialogCreate();
    UIView *content = [UIView new];
    [dialog addSubview:content];
    XCTAssertEqual([manager currentDialog:content], dialog);
    XCTAssertEqual([manager currentDialog:dialog], dialog);
}

- (void)testManagerKeepsSameTagDialogsInDifferentHostsAndDeletesByIdentity {
    BLDialogManage *manager = BLDialogManage.shareInstance;
    NSInteger tag = 876543;
    UIView *firstHost = [UIView new];
    UIView *secondHost = [UIView new];
    BLDialog *first = BLDialogCreate();
    BLDialog *second = BLDialogCreate();
    first.wTag = tag;
    second.wTag = tag;

    [manager addDialog:first cover:NO superView:firstHost];
    [manager addDialog:second cover:NO superView:secondHost];
    XCTAssertEqual(first.superview, firstHost);
    XCTAssertEqual(second.superview, secondHost);

    [manager deleteDialog:first];
    XCTAssertEqual(manager.dialogInfo[@(tag)], second);
    [manager deleteDialog:second];
    XCTAssertNil(manager.dialogInfo[@(tag)]);
}

- (void)testManagerOrdersDialogsByLevel {
    BLDialogManage *manager = BLDialogManage.shareInstance;
    UIView *host = [UIView new];
    NSArray<NSNumber *> *levels = @[@10, @20, @30, @25];
    NSMutableArray<BLDialog *> *dialogs = [NSMutableArray new];
    for (NSNumber *level in levels) {
        BLDialog *dialog = BLDialogCreate();
        dialog.wLevel = level.integerValue;
        [dialogs addObject:dialog];
        [manager addDialog:dialog cover:NO superView:host];
    }

    NSMutableArray<NSNumber *> *actual = [NSMutableArray new];
    for (BLDialog *dialog in host.subviews) [actual addObject:@(dialog.wLevel)];
    XCTAssertEqualObjects(actual, (@[@10, @20, @25, @30]));
    for (BLDialog *dialog in dialogs) [manager deleteDialog:dialog];
}

- (void)testCloseEventRunsOnceAndEveryCloseRequestCompletesOnce {
    BLDialog *dialog = BLDialogCreate();
    __block NSInteger closeCount = 0;
    __block NSInteger completionCount = 0;
    dialog.param.wEventClose = ^(id first, id second) { closeCount += 1; };

    [dialog closeView:^{ completionCount += 1; }];
    [dialog closeView:^{ completionCount += 1; }];
    [dialog closeView];

    XCTAssertEqual(closeCount, 1);
    XCTAssertEqual(completionCount, 2);
    XCTAssertTrue(dialog.isClose);
}

- (void)testManualCloseCancelsPendingAutoCloseAndRepeatedStartIsIgnored {
    XCTestExpectation *closed = [self expectationWithDescription:@"manual close completes"];
    UIView *host = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 390, 844)];
    BLDialog *dialog = BLDialogCreate().wTypeSet(DialogTypeAuto).wDisappelSecondSet(0.25);
    __block NSInteger closeCount = 0;
    dialog.param.wEventClose = ^(id first, id second) {
        closeCount += 1;
        [closed fulfill];
    };
    dialog.wStartView(host);
    dialog.wStartView(host);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dialog closeView];
    });
    [self waitForExpectations:@[closed] timeout:1.0];
    XCTestExpectation *autoCloseWindowElapsed = [self expectationWithDescription:@"pending automatic close elapsed"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [autoCloseWindowElapsed fulfill];
    });
    [self waitForExpectations:@[autoCloseWindowElapsed] timeout:1.0];
    XCTAssertEqual(closeCount, 1);
    XCTAssertNil(dialog.superview);
}

- (void)testEmptyShareDialogCanCloseAndClearsManagerEntry {
    XCTestExpectation *closed = [self expectationWithDescription:@"empty share dialog closes"];
    UIView *host = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 390, 844)];
    BLDialog *dialog = BLDialogCreate().wTypeSet(DialogTypeShare).wDataSet(@[]);
    dialog.param.wEventClose = ^(id first, id second) { [closed fulfill]; };
    dialog.wStartView(host);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dialog closeView];
    });
    [self waitForExpectations:@[closed] timeout:2.0];
    XCTAssertNil(BLDialogManage.shareInstance.dialogInfo[@(dialog.wTag)]);
    XCTAssertNil(dialog.superview);
}

- (void)testDateDayGenerationHandlesInvalidMonthAndBounds {
    BLDialogDateView *dateView = [BLDialogDateView new];
    dateView.param = BLDialogCreate().param;
    NSArray *days = [dateView timeDayWithArr:@[@2024, @13] Data:@{}];
    XCTAssertEqual(days.count, 0);
    days = [dateView timeDayWithArr:@[@2024] Data:@{}];
    XCTAssertEqual(days.count, 0);
    days = [dateView timeDayWithArr:@[@2000, @2] Data:@{}];
    XCTAssertEqual(days.count, 29);
    days = [dateView timeDayWithArr:@[@1900, @2] Data:@{}];
    XCTAssertEqual(days.count, 28);
    days = [dateView timeDayWithArr:@[@2024, @2] Data:@{@"min": @30, @"max": @31}];
    XCTAssertEqual(days.count, 0);
}

- (void)testChineseCalendarFallsBackOutsideSolarTermTableRange {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
    NSDictionary *beforeTable = [NSDate getChineseCalendarWithDate:date Year:1900 Month:1 Day:1];
    NSDictionary *afterTable = [NSDate getChineseCalendarWithDate:date Year:2051 Month:1 Day:1];
    XCTAssertNotNil(beforeTable[@"name"]);
    XCTAssertNotNil(afterTable[@"name"]);
}

- (void)testBLDialogFactoryKeepsBLDialogCompatibility {
    BLDialog *dialog = BLDialogCreate();
    XCTAssertTrue([dialog isKindOfClass:BLDialog.class]);
    XCTAssertNotNil(dialog.wStart);
    XCTAssertNotNil(BLDialogCreate());
}

- (void)testMenuUpdateConvertsNestedDictionariesAndHonorsFirstPath {
    BLDialogSelectView *selectView = [BLDialogSelectView new];
    BLDialogTree *root = [BLDialogTree new];
    BLDialogTree *parent = [[BLDialogTree alloc] initWithDetpth:1 withName:@"parent" withID:@"1"];
    BLDialogTree *first = [[BLDialogTree alloc] initWithDetpth:2 withName:@"first" withID:@"2a"];
    BLDialogTree *selected = [[BLDialogTree alloc] initWithDetpth:2 withName:@"selected" withID:@"2b"];
    selected.isSelected = YES;
    [parent.children addObjectsFromArray:@[first, selected]];
    [root.children addObject:parent];
    selectView.tree = root;
    selectView.depth = 2;
    BLDialog *dialog = BLDialogCreate();
    dialog.mainView = (BLDialogNormal *)selectView;
    XCTAssertEqualObjects(((BLDialogTree *)[selectView getTreeSelectDataArr:YES].lastObject).name, @"first");
    XCTAssertEqualObjects(((BLDialogTree *)[selectView getTreeSelectDataArr:NO].lastObject).name, @"selected");
    [dialog updateMenuChildrenDataWithSection:2 withUpdateChildren:YES withData:@[
        @{@"name": @"child", @"id": @"2", @"children": @[@{@"name": @"leaf", @"id": @"3"}]}
    ]];
    BLDialogTree *child = parent.children.firstObject;
    XCTAssertTrue([child isKindOfClass:BLDialogTree.class]);
    XCTAssertEqualObjects(child.name, @"child");
    XCTAssertEqualObjects([child.children.firstObject name], @"leaf");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
