//
//  AutorizationViewController.h
//  AOCashBox
//
//  Created by Камила Валиева on 05/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AOAutorizationViewControllerOutput;


@interface AutorizationViewController : UIViewController

@property (nonatomic, weak) id<AOAutorizationViewControllerOutput> output;

@end


@protocol AOAutorizationViewControllerOutput

- (void)userSelectTransitionToRegistrationController;

@end

NS_ASSUME_NONNULL_END
