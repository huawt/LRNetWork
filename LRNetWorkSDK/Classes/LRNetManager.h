#import <AFNetworking/AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN
@interface LRNetManager : AFHTTPSessionManager
+ (instancetype)defaultManager;
@end
NS_ASSUME_NONNULL_END
