#import "TLViewController.h"
#import "NetworkHeader.h"
@interface TLViewController ()<NetworkBridgeDelegate>
@end
@implementation TLViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [NetworkBridge sharedBridge].delegate = self;
    [NetworkEngine startEngine];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (nonnull NSString *)mainAppCurrentLanguage {
    return @"zh_CN";
}
- (nonnull NSDictionary *)mainAppCustomHeaderFieldValueDictionary:(nonnull NSDictionary *)originHeaderField {
    NSMutableDictionary *dic = [originHeaderField mutableCopy];
    [dic setObject:@"123" forKey:@"customKey"];
    return originHeaderField;
}
- (nonnull NSDictionary *)mainAppCustomNetworkParams {
    return @{@"appversion": @"1.0.0"};
}
- (nonnull NSString *)mainAppCustomUserAgent {
    return @"";
}
- (nonnull NSString *)mainAppNetworkSymbol {
    return @"我是内网标识";
}
- (nonnull NSString *)mainAppServerBaseUrl {
    return @"https://www.basehost.com";
}
@end
