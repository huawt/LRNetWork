#import "LRNetManager.h"
#import "NetworkBridge.h"
#import "NetworkHeader.h"
@implementation LRNetManager
+ (instancetype)defaultManager
{
    static dispatch_once_t onceToken;
    static LRNetManager *manager;
    dispatch_once(&onceToken, ^{
        NSString *baseUrl = [[NetworkBridge sharedBridge] getMainAppServerBaseUrl];
        manager = [[LRNetManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        manager.requestSerializer.timeoutInterval = NetworkTimeout;
        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", @"text/css", @"application/zip", nil];
    });
    [manager.requestSerializer setValue:[[NetworkBridge sharedBridge] getMainAppCustomUserAgent] forHTTPHeaderField:@"User-Agent"];
    return manager;
}
@end
