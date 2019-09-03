
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 桥接代理
 */
@protocol NetworkBridgeDelegate <NSObject>

/**
 APP 语言
 */
- (NSString *)mainAppCurrentLanguage;

/**
 app 自定义 useragent
 */
- (NSString *)mainAppCustomUserAgent;

/**
 内网标记
 */
- (NSString *)mainAppNetworkSymbol;

/**
 自定义请求头
 */
- (NSDictionary *)mainAppCustomHeaderFieldValueDictionary:(NSDictionary *)originHeaderField;

/**
 app 主服务地址
 */
- (NSString *)mainAppServerBaseUrl;

/**
 添加请求参数
 */
- (NSDictionary *)mainAppCustomNetworkParams;

@end

/**
 桥接文件
 */
@interface NetworkBridge : NSObject

@property (nonatomic, weak) id<NetworkBridgeDelegate>delegate;

/**
 单例
 */
+ (instancetype)sharedBridge;

/**
 获取主语言
 */
- (NSString *)getMainAppCurrentLanguage;

/**
 获取自定义 useragent
 */
- (NSString *)getMainAppCustomUserAgent;

/**
 获取内网标识
 */
- (NSString *)getMainAppNetworkSymbol;

/**
 获取自定义请求头
 */
- (NSDictionary *)getMainAppCustomHeaderFieldValueDictionary:(NSDictionary *)originHeaderField;

/**
 获取主服务器地址
 */
- (NSString *)getMainAppServerBaseUrl;

/**
 获取公共参数
 */
- (NSDictionary *)getMainAppCustomNetworkParams;
@end

NS_ASSUME_NONNULL_END
