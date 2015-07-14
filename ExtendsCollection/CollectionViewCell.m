//
//  CollectionViewCell.m
//  Evaluation
//
//  Created by gavin on 15/7/13.
//  Copyright (c) 2015年 gavin. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)configureForData:(NSString *)title{
    self.cellTitle.text = title;
}


- (void)configureForCellState:(UIColor *)color{
    self.backgroundColor = color;
}

@end
