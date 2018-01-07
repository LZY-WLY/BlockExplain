//
//  CVController.h
//  BlockExplain
//
//  Created by LZY on 18/1/7.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVController : UICollectionViewController
// ==========================  block传值第一步 ========================== 
/**
 定义block, 为上一界面传值
 byValue : block名字
 imageName : 传给上一界面的值
 注意: 创建block属性, 必须使用 copy 修饰
 */
@property (nonatomic, copy) void(^byValue)(NSString *imageName);
@end
