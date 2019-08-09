//
//  MFILocationChecker.m
//  LocationCheckerDemo
//
//  Created by supergo on 2019/6/4.
//  Copyright © 2019 supergo. All rights reserved.
//

#import "LocationDataSource.h"
#define LocationDataSourceLowAccuracyValue 1500

@implementation CLLocation(LocationDataSource)
- (LocationDataSource)dataSource
{
    double latitude = self.coordinate.latitude;
    double longtitude = self.coordinate.longitude;
    double altitude = self.altitude;
    
    NSString* lati74 = [self floatValue:latitude from:8 length:4];
    NSString* long74 = [self floatValue:longtitude from:8 length:4];
    NSString* alti15 = [self floatValue:altitude from:1 length:5];
    
    BOOL lati_b = [self isSameValueString:lati74];
    BOOL long_b = [self isSameValueString:long74];
    BOOL alti_b = [self isSameValueString:alti15];
    
    if(lati_b == long_b == alti_b == TRUE){
        return LocationDataSourceMFIDevice;
    }
    
    if(self.horizontalAccuracy > LocationDataSourceLowAccuracyValue){
        return LocationDataSourceLowAccuracy;
    }
        
    return LocationDataSourceRealWorld;
}

- (NSString*)dataSourceDescription{
    LocationDataSource source = [self dataSource];
    switch (source) {
        case LocationDataSourceMFIDevice:
            return @"LocationDataSourceMFIDevice";
        case LocationDataSourceLowAccuracy:
            return @"LocationDataSourceLowAccuracy";
        case LocationDataSourceRealWorld:
            return @"LocationDataSourceRealWorld";
        default:
            return @"oh";
    }
}

#ifdef DEBUG
- (NSString*)test{
    
    double latitude = self.coordinate.latitude;
    double longtitude = self.coordinate.longitude;
    double altitude = self.altitude;
    
    NSString* lati74 = [self floatValue:latitude from:8 length:4];
    NSString* long74 = [self floatValue:longtitude from:8 length:4];
    NSString* alti15 = [self floatValue:altitude from:1 length:5];
    
    return [NSString stringWithFormat:@"%@ %d \n%@ %d\n%@ %d",
            lati74,[self isSameValueString:lati74] ,
            long74,[self isSameValueString:long74],
            alti15,[self isSameValueString:alti15]];
}
#endif

- (NSString*)floatValue:(double)value from:(int)start length:(int)len{
    NSString* floatString = [NSString stringWithFormat:@"%.14f",value];
    floatString = [[floatString componentsSeparatedByString:@"."] lastObject];
    return [floatString substringWithRange:NSMakeRange(start, len)];
}

- (BOOL)isSameValueString:(NSString*)str{
    int len = (int)[str length];
    int value = [str intValue];
    
    int v = value%10;
    for(int i=1; i<len; i++){
        value = value / 10;
        if(value%10 != v) return false;
    }
    return true;
}


@end
