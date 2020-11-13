//
//  ListViewController.m
//  TestCollectionView
//
//  Created by chenzhuqing on 2019/6/26.
//  Copyright © 2019 chenzhuqing. All rights reserved.
//

#import "ListViewController.h"
#import <UIView+SDAutoLayout.h>

@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, assign) CGFloat mContentOffsetY;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%@",@(indexPath.row)];
    cell.detailTextLabel.text=@"这是一个prepareForSegue:(UIStoryboardSegue *)segue sender:(idsegue";
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.mContentOffsetY = scrollView.contentOffset.y;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.isDragging) {
        if ((scrollView.contentOffset.y - self.mContentOffsetY) > 5.0f) {  // 向上拖拽
            if (self.delegate && [self.delegate respondsToSelector:@selector(didScrollViewDerection:)]) {
                [self.delegate didScrollViewDerection:YES];
            }
           
        }else if ((self.mContentOffsetY - scrollView.contentOffset.y) > 5.0f){
            if (self.delegate && [self.delegate respondsToSelector:@selector(didScrollViewDerection:)]) {
                [self.delegate didScrollViewDerection:NO];
            }
        }
    }
}
#pragma mark - <UleNavigationBar Animal>

#pragma mark - <>
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.rowHeight=100;
        _tableView.clipsToBounds=NO;
    }
    return _tableView;
}

@end
