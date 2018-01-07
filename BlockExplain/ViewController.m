//
//  ViewController.m
//  BlockExplain
//
//  Created by LZY on 18/1/7.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "ViewController.h"
#import "CVController.h"
#import "AFNTools.h"

@interface ViewController ()
//图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


//跳转到下一界面
- (IBAction)item:(UIBarButtonItem *)sender {
    CVController *cv = [[CVController alloc]init];
    [self.navigationController pushViewController:cv animated:YES];
    
    // ========================== block传值重点 ==========================
    // ==========================  block传值第二步 ========================== 
    //使用block来接受下一界面传来的值
    [cv setByValue:^(NSString *imageName) {
        //显示图片
        self.imageView.image = [UIImage imageNamed:imageName];
    }];
}

// ==========================  block方法回调 ==========================
/*我们使用 Block 方法封装后的 AFN 来获取数据, 也就是 AFNTools 工具类
    为什么我们要封装AFNTools工具类?
    因为在我们项目中使用网络请求的地方可能是很多处, 如果以后项目中不使用AFN框架, 而使用其他框架, 那我们改动的地方就太多了(以前使用AFN的地方都需要修改), 这样太繁琐, 不易于项目的维护.
    如果使用我们封装的AFNTools工具类, 如果以后项目更换框架, 只需要更改工具类中的方法, 则万事大吉
 */
- (IBAction)callBack {
    NSString *url = @"http://v2.ysjk.189read.com/api/V2/audio/GetHomePageInfo5.json?sign=8DDA2B2059989D3FC615CEA4EDC27352&pno=20000001&proxytype=0&ver=TYYDYSB_I2.5.1.2&ScreenHeight=1334&Uid=1&userkey=ts_iphonev2&dateTime=20171012104904&ScreenWidth=750";
    //GET请求
    [AFNTools GET:url parameters:nil success:^(id json) {
        NSLog(@"%@", json);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}


@end
