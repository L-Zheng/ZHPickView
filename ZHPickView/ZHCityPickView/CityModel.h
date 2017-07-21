//
//  CityModel.h
//  ZHPickView
//
//  Created by 李保征 on 2017/7/19.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject

@property (nonatomic,copy) NSString *city;
@property (nonatomic,retain) NSMutableArray <NSString *> *areas;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
