//
//  TLViewController.m
//  TLNetWork
//
//  Created by huawt on 09/03/2019.
//  Copyright (c) 2019 huawt. All rights reserved.
//

#import "TLViewController.h"
#import "NetworkHeader.h"

@interface TLViewController ()<NetworkBridgeDelegate>

@end

@implementation TLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [NetworkBridge sharedBridge].delegate = self;
    [NetworkEngine startEngine];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
