
//
//  AOHomeViewController.m
//
//
//  Created by Камила Валиева on 18/07/2019.
//

#import "AOHomeViewController.h"
#import "AOCustomHomeTableViewCell.h"
#import "AODetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AOHistoryViewController.h"
#import "AOCustomCollectionViewCell.h"

static NSString * const AOCustomTableViewCellIdentifier = @"AOHomeTableViewCellIdentifier";
@interface AOHomeViewController ()
@property(nonatomic,copy)NSArray * arrayOfShops;
@property (nonatomic, strong) NSArray *colorArray;

@end

@implementation AOHomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.arrayOfShops = @[@"Супермаркет",@"Десткий магазин",@"Магазин косметики",@"Алкогольные магазины"];
    
    const NSInteger numberOfTableViewSections = 7;
    const NSInteger numberOfCollectionViewCells = 7;
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:numberOfTableViewSections];
    
    for (NSInteger tableViewRow = 0; tableViewRow < numberOfTableViewSections; tableViewRow++)
    {
        NSMutableArray *colorArray = [NSMutableArray arrayWithCapacity:numberOfCollectionViewCells];
        
        for (NSInteger collectionViewItem = 0; collectionViewItem < numberOfCollectionViewCells; collectionViewItem++)
        {
            
            CGFloat red = arc4random() % 255;
            CGFloat green = arc4random() % 255;
            CGFloat blue = arc4random() % 255;
            UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0f];
            [colorArray addObject:color];
        }
        
        [mutableArray addObject:colorArray];
    }
    
    self.colorArray = [NSArray arrayWithArray:mutableArray];
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayOfShops.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    AOCustomHomeTableViewCell *cell = (AOCustomHomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:AOCustomTableViewCellIdentifier];

    if (!cell)
    {
        cell = [[AOCustomHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AOCustomTableViewCellIdentifier];
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(AOCustomHomeTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
}

#pragma mark - UITableViewDelegate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.colorArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AOCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 19.f;

    NSArray<UIColor *> *collectionViewArray = self.colorArray[[(AOCustomCollectionView *)collectionView indexPath].section];
    cell.layer.borderColor = collectionViewArray[indexPath.item].CGColor;
    cell.layer.borderWidth = 2.5f;
    AOShopModel* shop = self.shopModelArray[indexPath.row];
    cell.imageView.image = [UIImage imageWithData:shop.shopImage];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* headerView = [[UIView alloc]init];
    headerView.backgroundColor =  UIColor.whiteColor;
    headerView.tintColor = UIColor.blackColor;
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:17]];
    NSString *string = self.arrayOfShops[section];
    [label setText:string];
    [headerView addSubview:label];
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//     UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
//    if (cell.backgroundView != nil)
//    {
    AOHistoryViewController* historyVC = [AOHistoryViewController new];
//         AODetailsViewController*detailsVC = [AODetailsViewController new];
//        detailsVC.imageView = [UIImageView new];
//        detailsVC.nameOfImage = [UILabel new];
//        detailsVC.nameOfImage.text =@"Hi";
        [self.navigationController pushViewController:historyVC animated:YES];

//    }

}


@end
