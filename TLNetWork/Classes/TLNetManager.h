
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

/**
 网络请求管理器
 */
@interface TLNetManager : AFHTTPSessionManager

/**
单例
 */
+ (instancetype)defaultManager;

@end

NS_ASSUME_NONNULL_END
