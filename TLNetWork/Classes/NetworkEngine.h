
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

/**
 网络引擎，配置网络参数
 */
@interface NetworkEngine : NSObject

/**
 启动
 */
+ (void)startEngine;

/**
 单独配置 BaseUrl
 */
+ (void)configureNetworkBaseUrl:(NSString *)baseURL;

/**
 获取 BaseUrl
 */
+ (NSString *)getKNetworkBaseUrl;

@end

NS_ASSUME_NONNULL_END
