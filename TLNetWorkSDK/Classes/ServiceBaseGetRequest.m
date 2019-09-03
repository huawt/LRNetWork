
#import "ServiceBaseGetRequest.h"
#import "NetworkHeader.h"

@implementation ServiceBaseGetRequest


- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

/**
 初始化方法
 
 @param path  接口地址，包含http协议的话不会自动追加域名，不包含的话自动追加http和域名
 @param params 参数，如果为空，自动填充公共参数；非空，也会再追加公共参数
 
 */

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
        
        self.apiPath = [self getStringURL:self.apiPath params:params useNetWorkParams:YES];
    }
     NETLog(@"✈️✈️✈️❤️✈️✈️✈️\n请求地址:%@",self.apiPath);
    return self;
}

- (id)requestArgument
{
    return nil;
}

@end
