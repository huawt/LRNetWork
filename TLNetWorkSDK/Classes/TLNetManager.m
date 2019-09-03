
#import "TLNetManager.h"
#import "NetworkBridge.h"
#import "NetworkHeader.h"

@implementation TLNetManager

+ (instancetype)defaultManager
{
    //之前用单例崩溃,现重新使用单例
    static dispatch_once_t onceToken;
    static TLNetManager *manager;
    dispatch_once(&onceToken, ^{
        NSString *baseUrl = [[NetworkBridge sharedBridge] getMainAppServerBaseUrl];
        manager = [[TLNetManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        manager.requestSerializer.timeoutInterval = NetworkTimeout;
        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/css", nil];
    });
    //app端设置cookie测试，语言设置用cookie,这个必须放这里，否则请求过一次再切换语言不生效
    NSString *cookieValue = [NSString stringWithFormat:@"language=%@",[[NetworkBridge sharedBridge] getMainAppCurrentLanguage]];
    [manager.requestSerializer setValue:[[NetworkBridge sharedBridge] getMainAppCustomUserAgent] forHTTPHeaderField:@"User-Agent"];
    [manager.requestSerializer setValue:@"YES" forHTTPHeaderField:[[NetworkBridge sharedBridge] getMainAppNetworkSymbol]];//标记为内网
    [manager.requestSerializer setValue:cookieValue forHTTPHeaderField:@"Cookie"];
    
    return manager;
}

@end
