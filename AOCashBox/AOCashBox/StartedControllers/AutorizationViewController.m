//
//  AutorizationViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 05/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AutorizationViewController.h"
#import "LoginViewController.h"
#import "RegistrationViewController.h"
#import "AOButtonView.h"
@interface AutorizationViewController ()
@property(nonatomic,strong)UIView* view1;
@property(nonatomic,strong)UILabel* label;
@property(nonatomic,strong)UIButton* loginButton;
@property(nonatomic,strong)UIButton* registerButton;
@property(nonatomic,strong)UIView *strangeView;

@end

@implementation AutorizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    self.view.backgroundColor = [UIColor colorWithRed:247/255. green:235/255. blue:245/255. alpha:1];
    // Do any additional setup after loading the view.
}


#pragma mark - setupUI

-(void)setupUI
{
   
    //лейбл
    self.label = [[UILabel alloc]init];
    UIFont *theRegularFont = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:50];
    [self.label setFont:theRegularFont];
    self.label.text = @"Selfy Pay";
    self.label.textColor = UIColor.blackColor;
    self.navigationController.navigationBar.topItem.title = @"";

    //кнопка авторизации
    
    self.loginButton = [[AOButtonView alloc]initWithTitle:@"Войти"];
    [self.loginButton addTarget:self action:@selector(enterLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    //кнопка регистрации
    
    self.registerButton = [[AOButtonView alloc]initWithTitle:@"Зарегистрироваться"];
    [self.registerButton addTarget:self action:@selector(enterRegisterButton) forControlEvents:UIControlEventTouchUpInside];

    //херня в центре экрана

    self.strangeView = [UIView new];
    self.strangeView.frame = CGRectMake(0, 40,40,40);
    self.strangeView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.strangeView];
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseIn| UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.strangeView.backgroundColor = UIColor.orangeColor;
    } completion:nil];
    

    [self makeConstraints];
}

#pragma mark -Constraints

-(void)makeConstraints
{
    [self.view addSubview:self.label];
     [self.view addSubview:self.registerButton];
    [self.view addSubview:self.loginButton];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    self.strangeView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.label.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor].active = YES;
    [self.label.topAnchor constraintLessThanOrEqualToSystemSpacingBelowAnchor:self.view.topAnchor multiplier:40].active = YES;
    
  
    [self.strangeView.heightAnchor constraintEqualToConstant:115].active = YES;
    [self.strangeView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1].active = YES;
    [self.strangeView.topAnchor constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:self.label.bottomAnchor multiplier:2].active = YES;

    
    [self.registerButton.bottomAnchor constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:self.strangeView.bottomAnchor multiplier:5].active = YES;
    [self.registerButton.leadingAnchor constraintEqualToAnchor:self.label.leadingAnchor].active = YES;
    [self.registerButton.trailingAnchor constraintEqualToAnchor:self.label.trailingAnchor].active = YES;
    [self.registerButton.heightAnchor constraintEqualToConstant:35].active = YES;
    [self.registerButton.bottomAnchor constraintLessThanOrEqualToAnchor:self.view.bottomAnchor constant:-50].active = YES;
    
    
    
    [self.loginButton.heightAnchor constraintEqualToConstant:35].active = YES;
    [self.loginButton.bottomAnchor constraintEqualToAnchor:self.registerButton.topAnchor constant:-25].active = YES;
    [self.loginButton.leadingAnchor constraintEqualToAnchor:self.label.leadingAnchor].active = YES;
    [self.loginButton.trailingAnchor constraintEqualToAnchor:self.label.trailingAnchor].active = YES;
    [self.loginButton.topAnchor constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:self.strangeView.bottomAnchor multiplier:5].active = YES;
    
}

#pragma mark -Functions

-(void)enterLoginButton:(UIButton *)sender
{
    LoginViewController* loginViewController = [LoginViewController new];
    [self.navigationController pushViewController:loginViewController animated:YES];
    [self.navigationController setNavigationBarHidden:NO];

}

-(void)enterRegisterButton
{
    RegistrationViewController* registrationViewController = [RegistrationViewController new];
    [self.navigationController pushViewController:registrationViewController animated:YES];
    [self.navigationController setNavigationBarHidden:NO];

}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

@end
