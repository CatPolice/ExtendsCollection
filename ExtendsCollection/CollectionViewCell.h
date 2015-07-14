//
//  CollectionViewCell.h
//  Evaluation
//
//  Created by gavin on 15/7/13.
//  Copyright (c) 2015年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;


- (void)configureForData:(NSString *)title;

- (void)configureForCellState:(UIColor *)color;

@end
