//
//  DatePickViewController.m
//  ZHPickView
//
//  Created by 李保征 on 2017/7/19.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import "DatePickViewController.h"

@interface DatePickViewController ()

@end

@implementation DatePickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    UIDatePicker *datepick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 100)];
    datepick.tag = 175;
    datepick.backgroundColor = [UIColor orangeColor];
    datepick.date = [NSDate date];
    datepick.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:datepick];
    
    UIDatePicker *timepick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 180, [UIScreen mainScreen].bounds.size.width, 100)];
    timepick.backgroundColor = [UIColor orangeColor];
    timepick.date = [NSDate date];
    timepick.datePickerMode = UIDatePickerModeTime;
    [self.view addSubview:timepick];
    
    UIDatePicker *timeanddatepick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 290, [UIScreen mainScreen].bounds.size.width, 100)];
    timeanddatepick.backgroundColor = [UIColor orangeColor];
    timeanddatepick.date = [NSDate date];
    timeanddatepick.datePickerMode = UIDatePickerModeDateAndTime;
    [self.view addSubview:timeanddatepick];
    
    UIDatePicker *countDownpick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 100)];
    countDownpick.backgroundColor = [UIColor orangeColor];
    countDownpick.date = [NSDate date];
    countDownpick.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.view addSubview:countDownpick];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 510, [UIScreen mainScreen].bounds.size.width, 20)];
    label.tag = 165;
    label.backgroundColor = [UIColor greenColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    button.frame = CGRectMake(0, 540, 120, 20);
    [button setTitle:@"选择时间" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectdatepick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)selectdatepick:(UIButton *)btn{
    UIDatePicker *datepick = (UIDatePicker *)[self.view viewWithTag:175];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"YYYY-MM-dd hh:mm:ss aaa";
    UILabel *getlabel = (UILabel *)[self.view viewWithTag:165];
    getlabel.text = [formatter stringFromDate:datepick.date];
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
