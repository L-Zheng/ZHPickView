//
//  CityModel.m
//  ZHPickView
//
//  Created by 李保征 on 2017/7/19.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        if (dic) {
            self.city = [dic valueForKey:@"city"];
            
            NSArray *areas = [dic valueForKey:@"areas"];
            self.areas = [NSMutableArray arrayWithArray:areas];
        }
    }
    return self;
}

@end
