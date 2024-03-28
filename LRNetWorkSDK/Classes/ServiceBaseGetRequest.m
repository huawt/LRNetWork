#import "ServiceBaseGetRequest.h"
#import "NetworkHeader.h"
@implementation ServiceBaseGetRequest
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
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
        self.apiPath = [self getStringURL:self.apiPath params:params useNetWorkParams:YES];
    }
     NETLog(@"✈️✈️✈️❤️✈️✈️✈️\nURL:%@",self.apiPath);
    return self;
}
- (id)requestArgument
{
    return nil;
}
@end
