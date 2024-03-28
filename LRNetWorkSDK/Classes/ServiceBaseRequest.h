#import "YTKRequest.h"
@interface ServiceBaseRequest : YTKRequest
@property(nonatomic, assign)YTKRequestSerializerType customRequestSerializerType;
@property (nonatomic, copy) NSString *apiPath;
@property (nonatomic, strong) NSDictionary *extraParameters;
- (NSDictionary *)getURLCommonParameter;
- (instancetype)initWithExtraParameters:(NSDictionary *)extraParameters;
-(instancetype)initRequestWithPath:(NSString*)path queryParameters:(NSDictionary*)params;
- (NSString *)getStringURL:(NSString *)path params:(NSDictionary *)params useNetWorkParams:(BOOL)use;
@end
