//
//  AppDelegate.m
//  TabBar
//
//  Created by Destiny on 2021/8/6.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    MainTabBarController *tabBarController = [[MainTabBarController alloc] initWithContext:@""];
//    MainRootController *rootViewController = [[MainRootController alloc] init];
    [self.window setRootViewController:tabBarController];
    
    //模拟数字角标
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tabBarController showTabBarBadgeWithIndex:2 badge:@"100"];
    });
    
    return YES;
}

@end
