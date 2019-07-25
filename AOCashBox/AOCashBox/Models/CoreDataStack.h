//
//  CoreDataStack.h
//  AOCashBox
//
//  Created by Камила Валиева on 23/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataStack : NSObject

@property(nonatomic,strong) NSPersistentContainer *container;

+(instancetype) shared;

@end

NS_ASSUME_NONNULL_END
