
#import "NetworkEngine.h"
#import <objc/runtime.h>
#import "NetworkHeader.h"
#import "NetworkBridge.h"

@interface NetworkEngine ()
@property (nonatomic, copy) NSString *baseUrl;
@property (nonatomic, strong) NSDictionary *userAgent;
@end

@implementation NetworkEngine

+ (instancetype)sharedEngine
{
    static dispatch_once_t __singletonToken;
    static id __singleton__;
    dispatch_once( &__singletonToken, ^{ __singleton__ = [[self alloc] initPrivate]; } );
    return __singleton__;
}
- (instancetype)init
{
    NSAssert(NO, @"");
    return nil;
}
- (instancetype)initPrivate
{
    if (self = [super init]) {
        _baseUrl = @"";
        _userAgent = @{};
    }
    return self;
}

+ (void)startEngine
{
    [self configureYTKNetworkAgent];
}

+ (void)configureYTKNetworkAgent
{
    YTKNetworkAgent *agent = [YTKNetworkAgent sharedAgent];
    NSSet *contentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", @"text/css", @"application/zip", nil];
    NSString *path = @"jsonResponseSerializer.acceptableContentTypes";
    @try {
        [agent setValue:contentTypes forKeyPath:path];
    } @catch (NSException *exception) {
        NETLog(@"配置YTKNetwork失败: %@", exception);
    } @finally {
        
    }
}

+ (void)configureNetworkBaseUrl:(NSString *)baseURL
{
    if (baseURL == nil || [baseURL length] == 0) {
        return;
    }
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    NSString *baseUrl = baseURL;
    if (![baseUrl hasPrefix:@"http"]) {
        BOOL isHttp = [[NSUserDefaults standardUserDefaults] boolForKey:@"isHttp"];
        baseUrl = [NSString stringWithFormat:@"%@%@", isHttp ? @"http://" : @"https://",baseUrl];
    }
    config.baseUrl = baseUrl;
    
    [NetworkEngine sharedEngine].baseUrl = baseUrl;
}

+ (NSString *)getKNetworkBaseUrl
{
    return [NetworkEngine sharedEngine].baseUrl;
}

@end

@implementation AFJSONResponseSerializer (Extension)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL org_selector = @selector(init);
        SEL wt_selector = @selector(wt_init);
        
        Method org_method = class_getInstanceMethod([self class], org_selector);
        Method wt_method = class_getInstanceMethod([self class], wt_selector);
        
        BOOL isAdd = class_addMethod(self, org_selector, method_getImplementation(wt_method), method_getTypeEncoding(wt_method));
        if (isAdd) {
            class_replaceMethod(self, wt_selector, method_getImplementation(org_method), method_getTypeEncoding(org_method));
        }else{
            method_exchangeImplementations(org_method, wt_method);
        }
    });
    
}
-(instancetype)wt_init
{
    [self wt_init];
    self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", @"text/css", @"application/zip", nil];
    return self;
}
@end;

@implementation AFHTTPRequestSerializer (Extension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL org_selector = @selector(init);
        SEL wt_selector = @selector(wt_init);
        
        Method org_method = class_getInstanceMethod([self class], org_selector);
        Method wt_method = class_getInstanceMethod([self class], wt_selector);
        
        BOOL isAdd = class_addMethod(self, org_selector, method_getImplementation(wt_method), method_getTypeEncoding(wt_method));
        if (isAdd) {
            class_replaceMethod(self, wt_selector, method_getImplementation(org_method), method_getTypeEncoding(org_method));
        }else{
            method_exchangeImplementations(org_method, wt_method);
        }
    });
}
-(instancetype)wt_init
{
    [self wt_init];
    [self setValue:[[NetworkBridge sharedBridge] getMainAppCustomUserAgent] forHTTPHeaderField:@"User-Agent"];
    return self;
}

@end
