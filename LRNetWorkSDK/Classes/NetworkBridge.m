#import "NetworkBridge.h"
@implementation NetworkBridge
+ (instancetype)sharedBridge
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
    }
    return self;
}
- (NSString *)getMainAppCustomUserAgent
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mainAppCustomUserAgent)]) {
        return [self.delegate mainAppCustomUserAgent];
    }else{
        return @"";
    }
}
- (NSDictionary *)getMainAppCustomHeaderFieldValueDictionary:(NSDictionary *)originHeaderField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mainAppCustomHeaderFieldValueDictionary:)]) {
        return [self.delegate mainAppCustomHeaderFieldValueDictionary:originHeaderField];
    }else{
        return @{};
    }
}
- (NSString *)getMainAppServerBaseUrl
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mainAppServerBaseUrl)]) {
        return [self.delegate mainAppServerBaseUrl];
    }else{
        return @"";
    }
}
- (NSDictionary *)getMainAppCustomNetworkParams
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mainAppCustomNetworkParams)]) {
        return [self.delegate mainAppCustomNetworkParams];
    }else{
        return @{};
    }
}
@end
