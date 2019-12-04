//
//  DVMCityAirQuality.h
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMWeather.h"
#import "DVMPollution.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMCityAirQuality : NSObject

@property (nonatomic, copy, readonly) NSString *city;
@property (nonatomic, copy, readonly) NSString *state;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic) DVMWeather *weather;
@property (nonatomic) DVMPollution *pollution;


- (instancetype)initWeatherWithCity: (NSString *)city state: (NSString *)state country: (NSString *)country weather: (DVMWeather *)weather pollution: (DVMPollution *)pollution;

@end

@interface DVMCityAirQuality (JSONConvertableDesignated)

- (instancetype)initWeatherWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
