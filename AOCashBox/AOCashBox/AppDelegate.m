//
//  AppDelegate.m
//  AOCashBox/Users/kamilavalieva/Desktop/SberIos/AOCashBox/AOCashBox/AppDelegate.m
//
//  Created by Камила Валиева on 29/06/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AppDelegate.h"
#import "AOCoordinateViewController.h"


@interface AppDelegate ()

@property(nonatomic) UIBarStyle barStyle;
@property(nonatomic, strong) UITabBarController* tabBar;
@property(nonatomic,strong)UINavigationController* navcon;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AOCoordinateViewController* coordinator = [AOCoordinateViewController new];
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = [coordinator chooseRootController];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
