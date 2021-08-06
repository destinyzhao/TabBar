//
//  MainTabBarController.h
//  TabBar
//
//  Created by Destiny on 2021/8/6.
//

#import <UIKit/UIKit.h>
#import <CYLTabBarController/CYLTabBarController.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTabBarController : CYLTabBarController

- (instancetype)initTabBar;

- (void)showTabBarBadgeWithIndex:(NSInteger)index badge:(NSString *)badge;

@end

NS_ASSUME_NONNULL_END
