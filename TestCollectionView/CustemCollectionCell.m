//
//  CustemCollectionCell.m
//  TestCollectionView
//
//  Created by chenzhuqing on 2019/6/26.
//  Copyright © 2019 chenzhuqing. All rights reserved.
//

#import "CustemCollectionCell.h"
#import <UIView+SDAutoLayout.h>
@interface CustemCollectionCell ()

@end

@implementation CustemCollectionCell


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel=[UILabel new];
        _titleLabel.textColor=[UIColor blueColor];
    }
    return _titleLabel;
}
@end
