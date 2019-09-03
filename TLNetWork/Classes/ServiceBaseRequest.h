
#import "YTKRequest.h"

/**
 Base Request
 */
@interface ServiceBaseRequest : YTKRequest

//默认就是YTKRequestSerializerTypeHTTP = 0，YTKRequestSerializerTypeJSON
@property(nonatomic, assign)YTKRequestSerializerType customRequestSerializerType;

//接口路径
@property (nonatomic, copy) NSString *apiPath;

/**
 额外的参数
 */
@property (nonatomic, strong) NSDictionary *extraParameters;

/**
 获取公共参数
 */
- (NSDictionary *)getURLCommonParameter;

/**
 初始化方法

 @param extraParameters 额外的参数
 @return Request
 */
- (instancetype)initWithExtraParameters:(NSDictionary *)extraParameters;

/**
 初始化方法
 
 @param path  接口地址，包含http协议的话不会自动追加域名，不包含的话自动追加http和域名
 @param params 参数，如果为空，自动填充公共参数；非空，也会再追加公共参数

 */

-(instancetype)initRequestWithPath:(NSString*)path queryParameters:(NSDictionary*)params;

/**
 拼接 Get参数
 */
- (NSString *)getStringURL:(NSString *)path params:(NSDictionary *)params useNetWorkParams:(BOOL)use;
@end
