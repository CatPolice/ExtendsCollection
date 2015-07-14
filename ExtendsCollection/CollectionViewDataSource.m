//
//  CollectionViewDataSource.m
//  Evaluation
//
//  Created by gavin on 15/7/13.
//  Copyright (c) 2015年 gavin. All rights reserved.
//

#import "CollectionViewDataSource.h"


@interface CollectionViewDataSource()

@property (nonatomic, strong) NSArray  *items;
@property (nonatomic, copy)   NSString *cellIdentifier;
@property (nonatomic, copy)   CollectionViewCellConfigureBlock configureCellBlock;

@property (nonatomic ) NSInteger numberOfItemsInSection;
@property (nonatomic ) NSInteger sections;

@end



@implementation CollectionViewDataSource




#pragma mark - Initialization

- (id)init {
    // 只能通过initWithItems:cellIdentifier:configureCellBlock:方法初始化
    return nil;
}

- (id)initWithItems:(NSArray *)anItems  cellIdentifier:(NSString *)aCellIdentifier
                                    configureCellBlock:(CollectionViewCellConfigureBlock)aConfigureCellBlock
                                numberOfItemsInSection:(NSInteger)numberOfItemsInSection
                          numberOfSectionsInCollection:(NSInteger)sections
{
    self = [super init];
    
    if (self) {
        self.items              = anItems;
        self.cellIdentifier     = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.numberOfItemsInSection = numberOfItemsInSection;
        self.sections = sections;
    }
    
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[(NSUInteger) indexPath.row];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.numberOfItemsInSection;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sections;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath :indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.configureCellBlock(cell , item , indexPath.row);
    
    return cell;
}

@end