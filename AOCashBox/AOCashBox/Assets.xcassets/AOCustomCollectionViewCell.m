//
//  AOCustomCollectionViewCell.m
//  AOCashBox
//
//  Created by Камила Валиева on 25/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCustomCollectionViewCell.h"

@implementation AOCustomCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [UIImageView new];
        _imageView.frame = self.contentView.frame;
        [self.contentView addSubview:_imageView];
        
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = true;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _spinner = [[UIActivityIndicatorView alloc] init];
        [self.contentView addSubview:_spinner];
        [_spinner setCenter:self.contentView.center];
        
        _imageView.layer.cornerRadius = 20;
        self.contentView.layer.cornerRadius = 20;
    }
    
    return self;
}


- (void)prepareForReuse
{
    self.imageView.image = nil;
    
    [super prepareForReuse];
}

@end
