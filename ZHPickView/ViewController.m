//
//  ViewController.m
//  ZHPickView
//
//  Created by 李保征 on 2017/7/19.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import "ViewController.h"
#import "DatePickViewController.h"
#import "CityPickViewController.h"
#import "PhonePickViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    button.frame = CGRectMake(0, 80, 120, 20);
    [button setTitle:@"时间Pick" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(datePickClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor greenColor];
    button1.frame = CGRectMake(0, 110, 120, 20);
    [button1 setTitle:@"城市Pick" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(cityPickClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor greenColor];
    button2.frame = CGRectMake(0, 140, 120, 20);
    [button2 setTitle:@"电话区号Pick" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(phonePickClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)datePickClick:(UIButton *)btn{
    DatePickViewController *vc = [[DatePickViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cityPickClick:(UIButton *)btn{
    CityPickViewController *vc = [[CityPickViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)phonePickClick:(UIButton *)btn{
    PhonePickViewController *vc = [[PhonePickViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
