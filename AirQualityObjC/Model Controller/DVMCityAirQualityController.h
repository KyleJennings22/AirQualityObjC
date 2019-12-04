//
//  DVMCityAirQualityController.h
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DVMCityAirQuality;

NS_ASSUME_NONNULL_BEGIN

@interface DVMCityAirQualityController : NSObject

+(void)fetchSupportedCountriesWithCompletion:(void(^) (NSArray<NSString *> *))completion;
+(void)fetchSupportedStatesInCountry: (NSString *)country completion:(void(^) (NSArray<NSString *> *))completion;
+(void)fetchSupportedCitiesInState: (NSString *)country state: (NSString *)state completion:(void(^)(NSArray<NSString *> *))completion;
+(void)fetchDataForCity: (NSString *)country state: (NSString *)state city: (NSString *)city completion:(void (^)(DVMCityAirQuality *))completion;

@end

NS_ASSUME_NONNULL_END
