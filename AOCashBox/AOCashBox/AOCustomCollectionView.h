//
//  AOCustomCollectionView.h
//  AOCashBox
//
//  Created by Камила Валиева on 21/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AOCustomCollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

static NSString *CollectionViewCellIdentifier = @"CollectionViewCellIdentifier";

NS_ASSUME_NONNULL_END
