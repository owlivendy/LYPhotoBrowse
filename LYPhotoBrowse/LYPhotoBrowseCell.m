//
//  LYPhotoBrowseCell.m
//  LYPotoBrowseDemo
//
//  Created by xiaofeishen on 16/9/27.
//  Copyright © 2016年 xiaofeishen. All rights reserved.
//

#import "LYPhotoBrowseCell.h"

@implementation LYPhotoBrowseCell

#pragma mark
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

#pragma mark - lazy getter 
- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

@end
