//
//  CVCell.m
//  BlockExplain
//
//  Created by LZY on 18/1/7.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "CVCell.h"

@interface CVCell ()
//图片
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end

@implementation CVCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setIconName:(NSString *)iconName {
    _iconName = iconName;
    self.icon.image = [UIImage imageNamed:iconName];
}
@end
