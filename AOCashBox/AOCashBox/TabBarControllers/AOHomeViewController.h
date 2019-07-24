//
//  AOHomeViewController.h
//  
//
//  Created by Камила Валиева on 18/07/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AOHomeViewController : UITableViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView* collectionView;
@end

NS_ASSUME_NONNULL_END
