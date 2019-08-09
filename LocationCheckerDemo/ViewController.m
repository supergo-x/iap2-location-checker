//
//  ViewController.m
//  LocationCheckerDemo
//
//  Created by supergo on 2019/6/4.
//  Copyright © 2019 supergo. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationDataSource.h"

@interface ViewController ()<CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLocationUpdate];
}

- (void)setupLocationUpdate
{
    if (nil == _locationManager)
        _locationManager = [[CLLocationManager alloc] init];
    
    [_locationManager  requestWhenInUseAuthorization];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
}

# pragma mark -
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation* location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    double latitude = coordinate.latitude;
    double longtitude = coordinate.longitude;
    double altitude = location.altitude;
    
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYMMdd HH:mm:ss.S"];
    NSString* time = [dateFormatter stringFromDate:location.timestamp];
    NSString* textString = [NSString stringWithFormat:
                            @"time       : %@\n"
                            @"latitude   : %.15f\n"
                            @"longtitude : %.15f\n"
                            @"altitude   : %.10f\n"
                            @"horizontalA: %.5fm\n"
                            @"verticalA  : %.5fm\n"
                            @"\nDebugInfo:\n%@\n\n"
                            @"DataSource : %@"
                            ,
                            time,
                            latitude,
                            longtitude,
                            altitude,
                            location.horizontalAccuracy,
                            location.verticalAccuracy,
                            [location test],
                            [location dataSourceDescription]
                            ];
    self.textView.text = textString;
    
}




@end
