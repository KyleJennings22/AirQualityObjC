//
//  DVMWeather.h
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMWeather : NSObject

@property (nonatomic, readonly) NSNumber *temperature;
@property (nonatomic, readonly) NSNumber *humidity;
@property (nonatomic, readonly) NSNumber *windspeed;

- (instancetype)initWithTemperature: (NSNumber *)temperature
                           humidity: (NSNumber *)humidity
                          windspeed: (NSNumber *)windspeed;


@end

@interface DVMWeather (JSONConvertableDesignated)

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
