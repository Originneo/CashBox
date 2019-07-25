//
//  CoordinateViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 18/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCoordinateViewController.h"
#import "AOHomeViewController.h"
#import "AOHistoryViewController.h"
#import "AOSettingsViewController.h"
#import "AutorizationViewController.h"


@interface AOCoordinateViewController () 
@property(nonatomic, strong) UITabBarController* tabBar;
@property(nonatomic,strong)UINavigationController* navcon;
@property(nonatomic,strong)LoginViewController* loginViewController;
@property(nonatomic,strong)NSMutableArray<AOShopModel*> *shopModelArray;
@property(nonatomic,strong)AOHomeViewController *homeViewController;

@end

@implementation AOCoordinateViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        AutorizationViewController* autorizationvc = [AutorizationViewController new];
        
        //Создаем вьюконтроллеры
        self.homeViewController = [AOHomeViewController new];
        AOHistoryViewController* historyViewController = [AOHistoryViewController new];
        AOSettingsViewController* settingsViewController = [AOSettingsViewController new];
        _navcon = [[UINavigationController alloc]initWithRootViewController:autorizationvc];
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:71/255. green:155/255. blue:112/255. alpha:1]];
        _navcon.navigationBar.barTintColor = [UIColor colorWithRed:247/255. green:235/255. blue:245/255. alpha:1];
        _tabBar = [[UITabBarController alloc]init];
        [_tabBar setViewControllers:(@[self.homeViewController,historyViewController,settingsViewController])];
        _tabBar.tabBar.barTintColor =[UIColor colorWithRed:87/255. green:198/255. blue:206/255. alpha:1];
        _tabBar.tabBar.tintColor =[UIColor colorWithRed:247/255. green:235/255. blue:245/255. alpha:1];
        
    
//        _tabBar.tabBar.translatesAutoresizingMaskIntoConstraints = YES;
//        [_tabBar.tabBar.heightAnchor constraintEqualToConstant:50].active = YES;
//        UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,0, _tabBar.tabBar.frame.size.width, _tabBar.tabBar.frame.size.height+40) cornerRadius:15];
//        CAShapeLayer* mask = [CAShapeLayer new];
//        mask.path = path.CGPath;
//        _tabBar.tabBar.layer.mask = mask;
        [self viewWillLayoutSubviews];
        self.homeViewController.tabBarItem.image = [UIImage imageNamed:@"home"];
        historyViewController.tabBarItem.image = [UIImage imageNamed:@"newspaper"];
        settingsViewController.tabBarItem.image = [UIImage imageNamed:@"settings"];
    }
    return self;
}

const CGFloat kBarHeight = 50;

- (void)viewWillLayoutSubviews {//?????
    
    CGRect tabFrame = self.tabBar.tabBar.frame;
    tabFrame.size.height = kBarHeight;
    tabFrame.origin.y = self.view.frame.size.height - kBarHeight;
    self.tabBar.tabBar.frame = tabFrame;
}
-(UINavigationController*)navcon
{
    if (_navcon == nil) {
        _navcon = [[UINavigationController alloc] init];
    }
    return _navcon;
}
-(UITabBarController*)tabBar
{
    if (_tabBar == nil) {
        _tabBar = [[UITabBarController alloc] init];
    }
    return _tabBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginViewController = [LoginViewController new];
    self.loginViewController.delegate = self;
}

-(UIViewController*)chooseRootController
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"loggedin"])
    {
        return self.tabBar;
    }
    else
    {
        return self.navcon;
    }
}
-(void)allDataofShopsIsReceived:(NSArray *)arrayOfShops
{
    self.homeViewController.shopModelArray = [arrayOfShops copy];
}



@end
