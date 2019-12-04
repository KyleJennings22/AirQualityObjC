//
//  DVMCityAirQualityController.m
//  AirQuality ObjC
//
//  Created by Kyle Jennings on 12/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "DVMCityAirQualityController.h"
#import "DVMCityAirQuality.h"
#import "DVMWeather.h"
#import "DVMPollution.h"

static NSString *const baseURLString = @"https://api.airvisual.com/";
static NSString *const versionComponents = @"v2";
static NSString *const countryComponent = @"countries";
static NSString *const stateComponent = @"states";
static NSString *const cityComponent = @"cities";
static NSString *const cityDetailsComponent = @"city";
static NSString *const apiKey = @"39871329-06fd-4585-93ba-9e851caaae99";

@implementation DVMCityAirQualityController

+ (void)fetchSupportedCountriesWithCompletion:(void (^)(NSArray<NSString *> * _Nonnull))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponents];
    NSURL *countryURL = [versionURL URLByAppendingPathComponent:countryComponent];
    NSURLComponents *components = [NSURLComponents componentsWithURL:countryURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *apiQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    components.queryItems = @[apiQuery];
    NSURL *finalURL = components.URL;
    //    NSLog(finalURL.absoluteString);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            return completion([NSArray new]);
        }
        
        if (!data)
        {
            NSLog(@"No Data");
            return completion([NSArray new]);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        NSMutableArray *countryArray = [NSMutableArray new];
        
        for (NSDictionary *country in dataDictionary)
        {
            [countryArray addObject:country[@"country"]];
 //           NSLog(@"Country: %@", country);
        }
        //        NSLog(@"Array: %@", countryArray);
        return completion(countryArray);
    }]resume];
}

+ (void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nonnull))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponents];
    NSURL *stateURL = [versionURL URLByAppendingPathComponent:stateComponent];
    NSURLComponents *components = [NSURLComponents componentsWithURL:stateURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *apiQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    components.queryItems = @[countryQuery, apiQuery];
    NSURL *finalURL = components.URL;
    //        NSLog(finalURL.absoluteString);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            return completion([NSArray new]);
        }
        
        if (!data)
        {
            NSLog(@"No Data");
            return completion([NSArray new]);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        NSMutableArray *stateArray = [NSMutableArray new];
        for (NSDictionary *state in dataDictionary)
        {
            [stateArray addObject:state[@"state"]];
//            NSLog(@"State: %@", state);
        }
        //            NSLog(@"Array: %@", stateArray);
        return completion(stateArray);
    }]resume];
}

+ (void)fetchSupportedCitiesInState:(NSString *)country state:(NSString *)state completion:(void (^)(NSArray<NSString *> * _Nonnull))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponents];
    NSURL *cityURL = [versionURL URLByAppendingPathComponent:cityComponent];
    NSURLComponents *components = [NSURLComponents componentsWithURL:cityURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem *apiQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    components.queryItems = @[stateQuery, countryQuery, apiQuery];
    NSURL *finalURL = components.URL;
    //    NSLog(finalURL.absoluteString);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            return completion([NSArray new]);
        }
        
        if (!data)
        {
            NSLog(@"No Data");
            return completion([NSArray new]);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
        NSMutableArray *cityArray = [NSMutableArray new];
        for (NSDictionary *city in dataDictionary)
        {
            [cityArray addObject:city[@"city"]];
//            NSLog(@"City: %@", city);
        }
        //        NSLog(@"Array: %@", cityArray);
        return completion(cityArray);
    }]resume];
}

+ (void)fetchDataForCity:(NSString *)country state:(NSString *)state city:(NSString *)city completion:(void (^)(DVMCityAirQuality * _Nonnull))completion
{
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURL *versionURL = [baseURL URLByAppendingPathComponent:versionComponents];
    NSURL *cityDetailURL = [versionURL URLByAppendingPathComponent:cityDetailsComponent];
    NSURLComponents *components = [NSURLComponents componentsWithURL:cityDetailURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *stateQuery = [[NSURLQueryItem alloc] initWithName:@"state" value:state];
    NSURLQueryItem *apiQuery = [[NSURLQueryItem alloc] initWithName:@"key" value:apiKey];
    NSURLQueryItem *countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem *cityQuery = [[NSURLQueryItem alloc] initWithName:@"city" value:city];
    components.queryItems = @[cityQuery, stateQuery, countryQuery, apiQuery];
    NSURL *finalURL = components.URL;
    //    NSLog(finalURL.absoluteString);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            return completion([DVMCityAirQuality new]);
        }
        
        if (!data)
        {
            NSLog(@"No Data");
            return completion([DVMCityAirQuality new]);
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = topLevelDictionary[@"data"];
//        NSDictionary *currentWeather = dataDictionary[@"current"];
        
        DVMCityAirQuality *airQuality = [[DVMCityAirQuality alloc] initWeatherWithDictionary:dataDictionary];
        
        return completion(airQuality);
        
    }]resume];
}
@end
