//
//  ViewController.m
//  TestCollectionView
//
//  Created by chenzhuqing on 2019/6/26.
//  Copyright © 2019 chenzhuqing. All rights reserved.
//

#import "ViewController.h"
#import <UIView+SDAutoLayout.h>
#import "ListViewController.h"
#import "CustemCollectionCell.h"
#import <Masonry/Masonry.h>

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ListViewControllerDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UIView * topView;
@property (nonatomic, strong) UICollectionView * mCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout * layout;
@property (nonatomic, assign) BOOL beginAniaml;
@property (nonatomic, assign) CGFloat mContentOffsetY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mCollectionView];
    [self.mCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    //1,添加headView,到CollectionView上
    [self.mCollectionView addSubview:self.topView];
    //2.设置frame
    self.topView.frame = CGRectMake(0, -200, CGRectGetWidth(self.view.frame), 200);
    //3、设置CollectionView的contentInset，使其可以显示出来。
    self.mCollectionView.contentInset= UIEdgeInsetsMake(200, 0, 0, 0);
}
#pragma mark - <colletion Datasource delegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustemCollectionCell * cell=(CustemCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    
    cell.backgroundColor = UIColor.redColor;
    return cell;
}

- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"sectionHeaderId" forIndexPath:indexPath];
    header.backgroundColor = UIColor.orangeColor;
    return header;
}



#pragma mark - <CollectionFlawLayoutdelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake((CGRectGetWidth(self.view.frame)-15)/2.0, 100);
    }
    return CGSizeMake((CGRectGetWidth(self.view.frame) -15)/2.0, 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5 );
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(CGRectGetWidth(self.view.frame), 50);
}
#pragma mark - <getter>

- (UIView *)topView{
    if (!_topView) {
        _topView=[[UIView alloc] initWithFrame:CGRectZero];

        _topView.backgroundColor=[UIColor greenColor];
    }
    return _topView;
}

- (UICollectionView *)mCollectionView{
    if (!_mCollectionView) {
        _mCollectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _mCollectionView.dataSource=self;
        _mCollectionView.delegate=self;
        [_mCollectionView registerClass:[CustemCollectionCell class] forCellWithReuseIdentifier:@"cell"];
        _mCollectionView.backgroundColor=[UIColor whiteColor];
        [_mCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeaderId"];
    }
    return _mCollectionView;
}

- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout=[[UICollectionViewFlowLayout alloc] init];
        _layout.minimumInteritemSpacing = 5;
        _layout.minimumLineSpacing = 5;
        _layout.itemSize=CGSizeMake(CGRectGetWidth(self.view.frame),50);
    }
    return _layout;
}
@end

