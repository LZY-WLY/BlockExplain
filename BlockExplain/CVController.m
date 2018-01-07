//
//  CVController.m
//  BlockExplain
//
//  Created by LZY on 18/1/7.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "CVController.h"
#import "CVCell.h"
@interface CVController ()
///数据源
@property (nonatomic, strong) NSMutableArray<NSString *> *dataSoucre;
@end

@implementation CVController

//指定layout
- (instancetype)init {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    if (self = [super initWithCollectionViewLayout:flowLayout]) {}
    return self;
}

//懒加载
- (NSMutableArray<NSString *> *)dataSoucre {
    if (!_dataSoucre) {
        self.dataSoucre = [NSMutableArray arrayWithObjects:@"liutao1", @"liutao2", @"liutao3", @"liutao4", @"liutao5", @"liutao6", @"liutao7", @"liutao8", @"liutao9", @"liutao10",@"liutao11", nil];
    }
    return _dataSoucre;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"CVCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    

}
#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSoucre.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.iconName = self.dataSoucre[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *value = self.dataSoucre[indexPath.item];
    //给上一界面传值
    // ========================== block传值第三步 ========================== 
    //首先判断byValue是否为空
    if (self.byValue) {
        self.byValue(value);
        
        //返回上一界面
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
