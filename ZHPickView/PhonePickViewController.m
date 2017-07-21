//
//  PhonePickViewController.m
//  ZHPickView
//
//  Created by 李保征 on 2017/7/20.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import "PhonePickViewController.h"
#import "ZHPhonePickView.h"

@interface PhonePickViewController ()

@end

@implementation PhonePickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    ZHPhonePickView *pickVIew = [[ZHPhonePickView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:pickVIew];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
