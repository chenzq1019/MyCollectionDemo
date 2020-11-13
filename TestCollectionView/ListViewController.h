//
//  ListViewController.h
//  TestCollectionView
//
//  Created by chenzhuqing on 2019/6/26.
//  Copyright © 2019 chenzhuqing. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@protocol ListViewControllerDelegate <NSObject>

@optional
- (void)didScrollViewDerection:(BOOL)up;
@end

@interface ListViewController : UIViewController
@property (nonatomic, weak) id <ListViewControllerDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
