//
//  CYLPlusButtonSubclass.m
//  CYLTabBarControllerDemo
//
//  v1.21.x Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 15/10/24.
//  Copyright (c) 2018年 https://github.com/ChenYilong . All rights reserved.
//

#import "CYLPlusButtonSubclass.h"
#import <CYLTabBarController/CYLTabBarController.h>

@interface CYLPlusButtonSubclass () {
    CGFloat _buttonImageHeight;
}

@end

@implementation CYLPlusButtonSubclass

#pragma mark -
#pragma mark - Life Cycle

+ (void)load {
    //请在 `-[AppDelegate application:didFinishLaunchingWithOptions:]` 中进行注册，否则iOS10系统下存在Crash风险。
    //[super registerPlusButton];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}


#pragma mark -
#pragma mark - CYLPlusButtonSubclassing Methods

/*
 *
 Create a custom UIButton with title and add it to the center of our tab bar
 *
 */
+ (id)plusButton {
    CYLPlusButtonSubclass *button = [[CYLPlusButtonSubclass alloc] init];
    UIImage *normalButtonImage = [UIImage imageNamed:@"icon_tabbar_plus"];
    UIImage *hlightButtonImage = [UIImage imageNamed:@"icon_tabbar_plus"];
    
    [button setBackgroundImage:normalButtonImage forState:UIControlStateNormal];
    [button setBackgroundImage:hlightButtonImage forState:UIControlStateSelected];
    button.imageEdgeInsets = UIEdgeInsetsMake(-25, 0, 0, 0);
    button.frame = CGRectMake(0.0, 0.0, 64, 57);
    
    // if you use `+plusChildViewController` , do not addTarget to plusButton.
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark -
#pragma mark - Event Response

- (void)clickPublish {
    CYLTabBarController *tabBarController = [self cyl_tabBarController];
    UIViewController *viewController = tabBarController.selectedViewController;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:nil
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showInView:viewController.view];
#pragma clang diagnostic pop

}

#pragma mark - UIActionSheetDelegate
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %@", @(buttonIndex));
}
#pragma clang diagnostic pop
#pragma mark - CYLPlusButtonSubclassing

+ (UIViewController *)plusChildViewController {
    UIViewController *plusChildViewController = [[UIViewController alloc] init];
    plusChildViewController.view.backgroundColor = [UIColor redColor];
    plusChildViewController.navigationItem.title = @"PlusChildViewController";
    UIViewController *plusChildNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:plusChildViewController];
    return plusChildNavigationController;
}

+ (NSUInteger)indexOfPlusButtonInTabBar {
    return 2;
}

+ (BOOL)shouldSelectPlusChildViewController {
    BOOL isSelected = CYLExternPlusButton.selected;
    if (isSelected) {
//        HDLLogDebug("🔴类名与方法名：%@（在第%@行），描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"PlusButton is selected");
    } else {
//        HDLLogDebug("🔴类名与方法名：%@（在第%@行），描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"PlusButton is not selected");
    }
    return YES;
}

+ (CGFloat)multiplierOfTabBarHeight:(CGFloat)tabBarHeight {
    return  0.3;
}

+ (CGFloat)constantOfPlusButtonCenterYOffsetForTabBarHeight:(CGFloat)tabBarHeight {
    return (-15);
}

//+ (NSString *)tabBarContext {
//    return NSStringFromClass([self class]);
//}

@end
