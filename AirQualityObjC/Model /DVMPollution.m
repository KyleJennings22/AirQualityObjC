//
//  DVMPollution.m
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "DVMPollution.h"

@implementation DVMPollution

- (instancetype)initWithAirQualityIndex:(NSNumber *)airQualityIndex
{
    self = [super init];
    if (self) {
        _airQualityIndex = airQualityIndex;
    }
    
    return self;
}

@end

@implementation DVMPollution (JSONConvertableDesignated)

- (instancetype)initWIthDictionary:(NSDictionary *)dictionary
{
    NSNumber *airQualityIndex = dictionary[@"aqius"];
    
    return [self initWithAirQualityIndex:airQualityIndex];
}

@end
