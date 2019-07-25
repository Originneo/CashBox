//
//  AOSettingsViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 18/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOSettingsViewController.h"
#import "AOButtonView.h"
#import "AOCoordinateViewController.h"
@interface AOSettingsViewController ()
@property(nonatomic,strong)AOButtonView *buttonLogOut;
@end

@implementation AOSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.buttonLogOut = [[AOButtonView alloc]initWithTitle:@"Выйти из аккаунта"];
    [self.view addSubview:self.buttonLogOut];
    [self makeConstraints];
    [self.buttonLogOut addTarget:self action:@selector(AObuttonLogOut) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
-(void)makeConstraints
{
    [self.buttonLogOut.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.buttonLogOut.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.buttonLogOut.widthAnchor constraintEqualToConstant:250].active = YES;
    [self.buttonLogOut.heightAnchor constraintEqualToConstant:40].active = YES;
}

-(void)AObuttonLogOut
{   AOCoordinateViewController *coord = [AOCoordinateViewController new];
    NSUserDefaults *defaults = [NSUserDefaults new];
        [defaults removeObjectForKey:@"loggedin"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self presentViewController:coord.navcon animated:YES completion:nil];
}

@end
