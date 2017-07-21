//
//  ZHPhonePickView.m
//  ZHPickView
//
//  Created by 李保征 on 2017/7/20.
//  Copyright © 2017年 李保征. All rights reserved.
//

#import "ZHPhonePickView.h"
#import "PhoneModel.h"

@interface ZHPhonePickView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIPickerView *phonePickView;

@property (nonatomic,retain) NSMutableArray <PhoneModel *> *modelsArray;

@end

@implementation ZHPhonePickView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self handlePhoneData];
        [self addSubview:self.phonePickView];
    }
    return self;
}

#pragma mark - getter

- (NSMutableArray <PhoneModel *> *)modelsArray{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray array];
    }
    return _modelsArray;
}

- (UIPickerView *)phonePickView{
    if (!_phonePickView) {
        _phonePickView = [[UIPickerView alloc] initWithFrame:self.bounds];
        _phonePickView.backgroundColor = [UIColor clearColor];
        _phonePickView.delegate = self;
        _phonePickView.dataSource = self;
    }
    return _phonePickView;
}

#pragma mark - data

- (void)handlePhoneData{
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"phoneCode" ofType:@"json"]];
    NSError *error = nil;
    NSArray *arrayCode = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        return;
    }
    
    NSMutableDictionary *modelsDic = [NSMutableDictionary dictionary];
    
    for (NSDictionary *dic in arrayCode) {
        PhoneModel *phoneModel = [[PhoneModel alloc] initWithDic:dic];
        [modelsDic setObject:phoneModel forKey:phoneModel.code];
    }
    //获得时区和国家codeArray
    NSLocale *locale = [NSLocale currentLocale];
    NSArray *countryCodeArray = [NSLocale ISOCountryCodes];
    
    for (NSString *countryCode in countryCodeArray) {
        PhoneModel *phoneModel = [modelsDic objectForKey:countryCode];
        if (phoneModel) {
            phoneModel.name_zh = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
            if ([phoneModel.name_zh isEqualToString:@"台湾"]){
                phoneModel.name_zh = @"中国台湾";
            }
            phoneModel.latin = [PhoneModel getLatinize:phoneModel.name_zh];
        }else {
            NSLog(@"++ %@ %@",[locale displayNameForKey:NSLocaleCountryCode value:countryCode],countryCode);
        }
    }
    
    for (NSString *codeKey in modelsDic.allKeys) {
        [self.modelsArray addObject:[modelsDic objectForKey:codeKey]];
    }
}

#pragma mark - delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.modelsArray.count;
    }else if (component == 1){
        return 1;
    }else{
        return 0;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.modelsArray[row].name_zh;
    }else if (component == 1){
        //获取第零组的选中行
        NSInteger selectRow = [pickerView selectedRowInComponent:0];
        return self.modelsArray[selectRow].dial_code;
    }else{
        return @"";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        
        PhoneModel *phoneModel = self.modelsArray[row];
        NSLog(@"--city--%@--区号--%@----",phoneModel.name_zh,phoneModel.dial_code);
        
    }else if (component == 1){
        
    }else{
        
    }
}

@end
