//
//  MFILocationChecker.h
//  LocationCheckerDemo
//
//  Created by supergo on 2019/6/4.
//  Copyright © 2019 supergo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    // 真实世界数据源
    LocationDataSourceRealWorld,
    // 外设数据源
    LocationDataSourceMFIDevice,
    // 拔掉外设，在坐标尚未恢复情况下有一定概率坐标精度会恢复正常，但此时horizontalAccuracy 数值会变得很大。
    // 这种情况下也可以认定当前坐标不能反映真实世界坐标
    LocationDataSourceLowAccuracy,
} LocationDataSource;


@interface  CLLocation(LocationDataSource)
- (LocationDataSource)dataSource;
- (NSString*)dataSourceDescription;
#ifdef DEBUG
- (NSString*)test;
#endif
@end


NS_ASSUME_NONNULL_END
