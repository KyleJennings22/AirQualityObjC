//
//  DVMPollution.h
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMPollution : NSObject

@property (nonatomic, readonly) NSNumber *airQualityIndex;

-(instancetype)initWithAirQualityIndex: (NSNumber *)airQualityIndex;

@end

@interface DVMPollution (JSONConvertableDesignated)

-(instancetype)initWIthDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
