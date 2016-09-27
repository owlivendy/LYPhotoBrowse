//
//  LYPhotoBrowse.h
//  LYPotoBrowseDemo
//
//  Created by xiaofeishen on 16/9/27.
//  Copyright © 2016年 xiaofeishen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYPhotoBrowse : UIView

@property(strong,nonatomic) UICollectionView *collection;

- (instancetype)initWithObjs:(NSArray *)objs;

@end
