//
//  ProvinceModel.m
//  ZHPickView
//
//  Created by 李保征 on 2017/7/19.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        if (dic) {
            self.state = [dic valueForKey:@"state"];
            
            self.cities = [NSMutableArray array];
            NSArray *cities = [dic valueForKey:@"cities"];
            for (NSDictionary *cityDic in cities) {
                CityModel *cityModel = [[CityModel alloc] initWithDic:cityDic];
                [self.cities addObject:cityModel];
            }
        }
    }
    return self;
}

@end
