#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@protocol NetworkBridgeDelegate <NSObject>
- (NSString *)mainAppCustomUserAgent;
- (NSDictionary *)mainAppCustomHeaderFieldValueDictionary:(NSDictionary *)originHeaderField;
- (NSString *)mainAppServerBaseUrl;
- (NSDictionary *)mainAppCustomNetworkParams;
@end
@interface NetworkBridge : NSObject
@property (nonatomic, weak) id<NetworkBridgeDelegate>delegate;
+ (instancetype)sharedBridge;
- (NSString *)getMainAppCustomUserAgent;
- (NSDictionary *)getMainAppCustomHeaderFieldValueDictionary:(NSDictionary *)originHeaderField;
- (NSString *)getMainAppServerBaseUrl;
- (NSDictionary *)getMainAppCustomNetworkParams;
@end
NS_ASSUME_NONNULL_END
