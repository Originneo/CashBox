//
//  LoginViewController.h
//  AOCashBox
//
//  Created by Камила Валиева on 29/06/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkServiceProtocol.h"
@protocol loginViewProtocol;

@interface LoginViewController : UIViewController<NetworkServiceOutputProtocol>
@property(nonatomic,weak)id<loginViewProtocol>delegate;

@end

@protocol loginViewProtocol <NSObject>
@required

- (void)allDataofShopsIsReceived:(NSArray*)arrayOfShops;
@end


