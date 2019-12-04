//
//  DVMWeather.m
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "DVMWeather.h"

@implementation DVMWeather

- (instancetype)initWithTemperature:(NSNumber *)temperature humidity:(NSNumber *)humidity windspeed:(NSNumber *)windspeed
{
    self = [super init];
    if (self)
    {
        _temperature = temperature;
        _humidity = humidity;
        _windspeed = windspeed;
    }
    return self;
}
@end

@implementation DVMWeather (JSONConvertableDesignated)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
//    NSDictionary *weatherDictionary = dictionary[@"weather"];
    NSNumber *temperature = dictionary[@"tp"];
    NSNumber *humidity = dictionary[@"hu"];
    NSNumber *windspeed = dictionary[@"ws"];
    
    return [self initWithTemperature:temperature humidity:humidity windspeed:windspeed];
}

@end
