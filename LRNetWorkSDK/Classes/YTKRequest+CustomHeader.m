#import "YTKRequest+CustomHeader.h"
#import <objc/runtime.h>
#import "NetworkBridge.h"
static inline void class_methodSwizzling(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@implementation YTKRequest (CustomHeader)
+ (void)load
{
    class_methodSwizzling(self, @selector(requestHeaderFieldValueDictionary), @selector(requestCustomHeaderFieldValueDictionary));
}
- (nullable NSDictionary<NSString *, NSString *> *)requestCustomHeaderFieldValueDictionary {
   NSDictionary *dic = [self requestCustomHeaderFieldValueDictionary];
    NSDictionary *mulDic = [[NetworkBridge sharedBridge] getMainAppCustomHeaderFieldValueDictionary:dic];
    return mulDic;
}
@end
