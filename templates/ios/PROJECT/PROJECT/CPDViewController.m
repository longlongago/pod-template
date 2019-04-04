//
//  CPDViewController.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "CPDViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Login/Login.h>

@interface CPDViewController ()

@end

@implementation CPDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 100, 100)];
    label.text = @"这里使用SDWebImage加载网络图片";
    [label sizeToFit];
    [self.view addSubview:label];
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(10, 150, 100, 100)];
    NSURL* url = [[NSURL alloc] initWithString:@"https://pic1.zhimg.com/v2-3b4fc7e3a1195a081d0259246c38debc_1200x500.jpg"];
    [view sd_setImageWithURL:url];
    [self.view addSubview:view];
    
    NSDictionary *dic = @{kLoginPlatformAPPIdQQ:@"1108071150",kLoginPlatformAPPIdWeChat:@"wxa6755aa6eaa049e1"};
    [[RAAPPLoginService sharedInstance] configureAppIds:dic];
    [[RAAPPLoginService sharedInstance] autoLogin];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
