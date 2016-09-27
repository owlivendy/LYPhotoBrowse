//
//  LYPhotoBrowse.m
//  LYPotoBrowseDemo
//
//  Created by xiaofeishen on 16/9/27.
//  Copyright © 2016年 xiaofeishen. All rights reserved.
//

#import "LYPhotoBrowse.h"
#import "LYPhotoBrowseCell.h"

static NSString *const cellId = @"cellId";

@interface LYPhotoBrowse()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic) NSMutableArray *data;
@end
@implementation LYPhotoBrowse

#pragma mark - show
- (void)show {
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:self];
    self.frame = mainWindow.bounds;
    [self.collection reloadData];
    self.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

#pragma mark - action
- (void)tap {
    [self hide];
}

#pragma mark - life cycle
- (instancetype)initWithObjs:(NSArray *)objs {
    if ([super initWithFrame:CGRectZero]) {
        self.data = objs.mutableCopy;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collection.frame = self.bounds;
}


#pragma mark - collection dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LYPhotoBrowseCell *cell = (LYPhotoBrowseCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return (CGSize){screenWidth,screenHeight};
}

#pragma mark - lazy get
- (UICollectionView *)collection {
    if (_collection == nil) {
        UICollectionViewLayout *customLayout = [[UICollectionViewLayout alloc] init];
        _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:customLayout];
        _collection.pagingEnabled = true;
        _collection.dataSource = self;
        _collection.delegate = self;
        [_collection registerClass:[LYPhotoBrowseCell class] forCellWithReuseIdentifier:cellId];
        [self addSubview:_collection];
    }
    return _collection;
}


@end
