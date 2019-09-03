
#import "ServiceBaseRequest.h"
#import "NetworkHeader.h"

@implementation ServiceBaseRequest

- (instancetype) init{
    self = [super init];
    
    if(self){
        //忽略缓存
        self.ignoreCache = YES;
    }
    return self;
}

- (instancetype)initWithExtraParameters:(NSDictionary *)extraParameters
{
    if (self = [super init]) {
        self.extraParameters = extraParameters;
    }
    return self;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (id)requestArgument
{
    NSDictionary *comPara = [self getURLCommonParameter];
    if (self.extraParameters && [self.extraParameters count]) {
        NSMutableDictionary *muExtraPara = self.extraParameters.mutableCopy;
        [muExtraPara addEntriesFromDictionary:comPara];
        NETLog(@"✈️✈️✈️❤️✈️✈️✈️\n请求参数:%@",muExtraPara);
        return muExtraPara;
    }
    
    NETLog(@"✈️✈️✈️❤️✈️✈️✈️\n请求参数:%@",comPara );
    return comPara;
}

- (NSDictionary *)getURLCommonParameter
{
    return [[NetworkBridge sharedBridge] getMainAppCustomNetworkParams];
}


-(NSString *)requestUrl{
    
    NETLog(@"✈️✈️✈️✈️✈️✈️请求的接口:%@", self.apiPath);
    
    return self.apiPath;
}

-(instancetype)initRequestWithPath:(NSString*)path queryParameters:(NSDictionary*)params
{
    if (self = [super init]) {
        if([path length] == 0)
        {
            self.apiPath = @"";
        }
        else
        {
            if([path hasPrefix:@"http"])
            {
                self.apiPath = path;
            }
            else{
                NSString *baseUrl = [[NetworkBridge sharedBridge] getMainAppServerBaseUrl];
                if ([[path substringToIndex:1] isEqualToString:@"/"]) {
                     self.apiPath = [NSString stringWithFormat:@"%@%@", baseUrl, path];
                }
                else{
                     self.apiPath = [NSString stringWithFormat:@"%@/%@", baseUrl, path];
                }
            }
        }
        self.extraParameters = params;
    }
    return self;
}

- (NSTimeInterval)requestTimeoutInterval {
    return NetworkTimeout;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return self.customRequestSerializerType;
}


- (NSString *)getStringURL:(NSString *)path params:(NSDictionary *)params useNetWorkParams:(BOOL)use
{
    NSMutableDictionary *mulParam = [NSMutableDictionary dictionaryWithCapacity:10];

    if(params != nil)
    {
        [mulParam addEntriesFromDictionary:params];
    }
    
    //用字典的方式，是为了避免参数有重复的情况
    if(use){
        NSDictionary *commonParamDic = [self getURLCommonParameter];
        [mulParam addEntriesFromDictionary:commonParamDic];
    }
    
    NSArray *allKeys = [mulParam allKeys];
    
    NSString *lastStrParam = @"";
    for(NSString *key in allKeys){
        lastStrParam = [lastStrParam stringByAppendingFormat:@"%@=%@&",key,mulParam[key]];
    }
    
    //去掉&号
    if([lastStrParam length] > 0){
        lastStrParam = [lastStrParam substringToIndex:lastStrParam.length-1];
    }
    
    NSRange range = [path rangeOfString:@"?"];
    if (range.location == NSNotFound)
    {
        path = [path stringByAppendingFormat:@"?%@",lastStrParam];
    }
    else{
        //特殊情况
        if([path containsString:@"/?#"]){
            path = [path stringByAppendingFormat:@"?%@",lastStrParam];
        }
        else{
            path = [path stringByAppendingFormat:@"&%@",lastStrParam];
        }
    }
    
    return path;
}

@end
