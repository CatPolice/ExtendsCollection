//
//  ViewController.m
//  ExtendsCollection
//
//  Created by gavin on 15/7/14.
//  Copyright (c) 2015年 gavin. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CollectionViewDataSource.h"
#import "FullyHorizontalFlowLayout.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;

@property (nonatomic , strong) NSArray *arr;
@property (nonatomic , strong) CollectionViewDataSource *collectionDatasource;

@property (nonatomic , strong) NSMutableDictionary *dic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    FullyHorizontalFlowLayout *collectionViewLayout = [FullyHorizontalFlowLayout new];
    
    collectionViewLayout.itemSize = CGSizeMake(50. , 50.);
    //collectionViewLayout.nbColumns = 5;
    //collectionViewLayout.nbLines = 3;
    
    [self.myCollection setCollectionViewLayout:collectionViewLayout];
    
    
    
    [self.myCollection registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    self.dic = [[NSMutableDictionary alloc] init];
    
    self.arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14"];
    
    [self setupCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setupCollectionView {
    
    CollectionViewCellConfigureBlock configureCell = ^(CollectionViewCell *cell, NSString *str , NSInteger index) {
        [cell configureForData:str];
        
        NSString *indexStr = [NSString stringWithFormat:@"%zd",index];
        if ([self.dic objectForKey:indexStr]) {
            [cell configureForCellState:[UIColor yellowColor]];
        }else{
            [cell configureForCellState:[UIColor redColor]];
        }
    };
    
    self.collectionDatasource = [[CollectionViewDataSource alloc] initWithItems:self.arr
                                                                 cellIdentifier:@"CollectionViewCell"
                                                             configureCellBlock:configureCell
                                                         numberOfItemsInSection:self.arr.count
                                                   numberOfSectionsInCollection:1];
    
    self.myCollection.dataSource = self.collectionDatasource;
}


#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select indexpath : %zd",indexPath.row);
    
    NSString *indexStr = [NSString stringWithFormat:@"%zd",indexPath.row];
    
    if ([self.dic objectForKey:indexStr]) {
        
        [self.dic removeObjectForKey:indexStr];
        
    }else{
        [self.dic setObject:collectionView forKey:indexStr];
    }
    
    [self.myCollection reloadData];
    
}


@end
