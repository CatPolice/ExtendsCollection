//
//  CollectionViewDataSource.h
//  Evaluation
//
//  Created by gavin on 15/7/13.
//  Copyright (c) 2015年 gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CollectionViewCellConfigureBlock)(id cell, id item , NSInteger index);

@interface CollectionViewDataSource : NSObject<UICollectionViewDataSource>


- (id)initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier
                                   configureCellBlock:(CollectionViewCellConfigureBlock)aConfigureCellBlock
                               numberOfItemsInSection:(NSInteger)numberOfItemsInSection
                         numberOfSectionsInCollection:(NSInteger)sections;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end




