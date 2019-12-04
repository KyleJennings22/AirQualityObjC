//
//  DVMCityAirQuality.m
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "DVMCityAirQuality.h"

@implementation DVMCityAirQuality

- (instancetype)initWeatherWithCity:(NSString *)city state:(NSString *)state country:(NSString *)country weather:( DVMWeather *)weather pollution:( DVMPollution *)pollution
{
    self = [super init];
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
        
    }
    return self;
}
@end

@implementation DVMCityAirQuality (JSONConvertableDesignated)

- (instancetype)initWeatherWithDictionary:(NSDictionary *)dictionary
{
    NSString *city = dictionary[@"city"];
    NSString *state = dictionary[@"state"];
    NSString *country = dictionary[@"country"];
    DVMWeather *weather = [[DVMWeather alloc] initWithDictionary:dictionary[@"current"][@"weather"]];
    DVMPollution *pollution = [[DVMPollution alloc] initWIthDictionary:dictionary[@"current"][@"pollution"]];
    
    return [self initWeatherWithCity:city state:state country:country weather:weather pollution:pollution];
}

@end
