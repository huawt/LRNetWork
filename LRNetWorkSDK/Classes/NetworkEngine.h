#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <YTKNetwork/YTKNetwork.h>
NS_ASSUME_NONNULL_BEGIN
@interface NetworkEngine : NSObject
+ (void)startEngine;
+ (void)configureNetworkBaseUrl:(NSString *)baseURL;
+ (NSString *)getKNetworkBaseUrl;
@end
NS_ASSUME_NONNULL_END
