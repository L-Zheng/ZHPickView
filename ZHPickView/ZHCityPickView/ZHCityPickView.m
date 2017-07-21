//
//  ZHCityPickView.m
//  ZHPickView
//
//  Created by 李保征 on 2017/7/19.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import "ZHCityPickView.h"
#import "ProvinceModel.h"

@interface ZHCityPickView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIPickerView *cityPickView;

@property (nonatomic,retain) NSMutableArray <ProvinceModel *> *modelsArray;

@end

@implementation ZHCityPickView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self handleCityData];
        [self addSubview:self.cityPickView];
    }
    return self;
}

#pragma mark - getter

- (NSMutableArray <ProvinceModel *> *)modelsArray{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray array];
    }
    return _modelsArray;
}

- (UIPickerView *)cityPickView{
    if (!_cityPickView) {
        _cityPickView = [[UIPickerView alloc] initWithFrame:self.bounds];
        _cityPickView.backgroundColor = [UIColor clearColor];
        _cityPickView.delegate = self;
        _cityPickView.dataSource = self;
    }
    return _cityPickView;
}

#pragma mark - data

- (void)handleCityData{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil];
    NSArray *provinceArray = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *dic in provinceArray) {
        ProvinceModel *provinceModel = [[ProvinceModel alloc] initWithDic:dic];
        [self.modelsArray addObject:provinceModel];
    }
}

#pragma mark - action

#pragma mark - delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.modelsArray.count;
    }else if (component == 1){
        //获取第零组的选中行
        NSInteger selectRowZeroComponent = [pickerView selectedRowInComponent:0];
        ProvinceModel *provinceModel = self.modelsArray[selectRowZeroComponent];
        return provinceModel.cities.count;
    }else{
        //获取第零组的选中行
        NSInteger selectRowZeroComponent = [pickerView selectedRowInComponent:0];
        //获取第1组的选中行
        NSInteger selectRowOneComponent = [pickerView selectedRowInComponent:1];
        ProvinceModel *provinceModel = self.modelsArray[selectRowZeroComponent];
        CityModel *cityModel = provinceModel.cities[selectRowOneComponent];
        return cityModel.areas.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        ProvinceModel *provinceModel = self.modelsArray[row];
        return provinceModel.state;
    }else if (component == 1){
        //获取第零组的选中行
        NSInteger selectRow = [pickerView selectedRowInComponent:0];
        //获取省模型  哪个省
        ProvinceModel *provinceModel = self.modelsArray[selectRow];
        //获取某个省的所有城市
        NSArray *cityModelArray = provinceModel.cities;
        //取出哪个城市
        CityModel *cityModel = cityModelArray[row];
        
        return cityModel.city;
    }else{
        //获取第零组的选中行
        NSInteger selectRowZeroComponent = [pickerView selectedRowInComponent:0];
        //获取第1组的选中行
        NSInteger selectRowOneComponent = [pickerView selectedRowInComponent:1];
        //获取省模型  哪个省
        ProvinceModel *provinceModel = self.modelsArray[selectRowZeroComponent];
        //获取某个省的所有城市
        NSArray *cityModelArray = provinceModel.cities;
        //取出哪个城市
        CityModel *cityModel = cityModelArray[selectRowOneComponent];

        return cityModel.areas[row];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews){
        if (singleLine.frame.size.height < 1){
            singleLine.backgroundColor = [UIColor blueColor];
            singleLine.alpha = 0.7;
        }
    }
    
    //设置文字的属性
    UILabel *genderLabel = [UILabel new];
    genderLabel.textAlignment = NSTextAlignmentCenter;
    genderLabel.textColor = [UIColor blackColor];
    genderLabel.font = [UIFont systemFontOfSize:15];
    
    NSString *textStr = @"";
    if (component == 0) {
        ProvinceModel *provinceModel = self.modelsArray[row];
        textStr =  provinceModel.state;
    }else if (component == 1){
        //获取第零组的选中行
        NSInteger selectRow = [pickerView selectedRowInComponent:0];
        //获取省模型  哪个省
        ProvinceModel *provinceModel = self.modelsArray[selectRow];
        //获取某个省的所有城市
        NSArray *cityModelArray = provinceModel.cities;
        //取出哪个城市
        CityModel *cityModel = cityModelArray[row];
        
        textStr = cityModel.city;
    }else{
        //获取第零组的选中行
        NSInteger selectRowZeroComponent = [pickerView selectedRowInComponent:0];
        //获取第1组的选中行
        NSInteger selectRowOneComponent = [pickerView selectedRowInComponent:1];
        //获取省模型  哪个省
        ProvinceModel *provinceModel = self.modelsArray[selectRowZeroComponent];
        //获取某个省的所有城市
        NSArray *cityModelArray = provinceModel.cities;
        //取出哪个城市
        CityModel *cityModel = cityModelArray[selectRowOneComponent];
        
        textStr = cityModel.areas[row];
    }
    genderLabel.text = textStr;
    return genderLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        
    }else if (component == 1){
        [pickerView reloadComponent:2];
        [pickerView selectRow:0 inComponent:2 animated:YES];
        
    }else{
        
    }
    
    //获取第零组的选中行
    NSInteger selectRowZeroComponent = [pickerView selectedRowInComponent:0];
    //获取第1组的选中行
    NSInteger selectRowOneComponent = [pickerView selectedRowInComponent:1];
    //获取第2组的选中行
    NSInteger selectRowTwoComponent = [pickerView selectedRowInComponent:2];
    
    //选中的省
    ProvinceModel *provinceModel = self.modelsArray[selectRowZeroComponent];
    //选中省的所有城市
    NSArray *cityModelArray = provinceModel.cities;
    //选中的城市
    CityModel *cityModel = cityModelArray[selectRowOneComponent];
    //选中城市的所有区域
    NSArray *areasArray = cityModel.areas;
    //选中的区域
    NSString *areaString = (selectRowTwoComponent >= cityModel.areas.count) ? @"" : areasArray[selectRowTwoComponent];
    
    NSLog(@"%ld  %ld  %ld",selectRowZeroComponent,selectRowOneComponent,selectRowTwoComponent);
    NSLog(@"%@  %@  %@",provinceModel.state,cityModel.city,areaString);
}

@end
