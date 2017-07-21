//
//  ProvinceModel.h
//  ZHPickView
//
//  Created by 李保征 on 2017/7/19.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityModel.h"

@interface ProvinceModel : NSObject

@property (nonatomic,copy) NSString *state;
@property (nonatomic,retain) NSMutableArray <CityModel *> *cities;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
