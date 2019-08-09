# iAP2-location-checker
Check where iOS Location data comes from real world or from an iAP2-protocol device

可以检测iOS设备的坐标数据来源于系统数据源，或是来源于iAP2协议的外设数据源

# usage 用法

    #import "LocationDataSource.h"
    LocationDataSource datasource =  [location dataSource];
    
    typedef enum : NSUInteger {
        // 真实世界数据源
        LocationDataSourceRealWorld,
        // 外设数据源
        LocationDataSourceMFIDevice,
        // 拔掉外设，在坐标尚未恢复情况下有一定概率坐标精度会恢复正常，但此时horizontalAccuracy 数值会变得很大。
        // 这种情况下也可以认定当前坐标不能反映真实世界坐标
        LocationDataSourceLowAccuracy,
    } LocationDataSource;

# theory 原理

通过苹果iAP2协议产生的坐标系统，海拔精度会被苹果限制在0.1m，经纬度精度限制到小数点后8-9位。




