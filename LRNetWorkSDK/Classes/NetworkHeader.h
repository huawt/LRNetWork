#import <Foundation/Foundation.h>
#ifndef _NETWORKSDK_
#define _NETWORKSDK_
#if __has_include(<LRNetWork/NetworkHeader.h>)
FOUNDATION_EXPORT double LRNetWorkVersionNumber;
FOUNDATION_EXPORT const unsigned char LRNetWorkVersionString[];
#import <LRNetWork/NetworkBridge.h>
#import <LRNetWork/NetworkEngine.h>
#import <LRNetWork/YTKRequest+CustomHeader.h>
#import <LRNetWork/ServiceBaseRequest.h>
#import <LRNetWork/ServiceBaseGetRequest.h>
#import <LRNetWork/ServiceBasePutRequest.h>
#import <LRNetWork/ServiceBaseDeleteRequest.h>
#import <LRNetWork/LRNetManager.h>
#else
#import "NetworkBridge.h"
#import "NetworkEngine.h"
#import "YTKRequest+CustomHeader.h"
#import "ServiceBaseRequest.h"
#import "ServiceBaseGetRequest.h"
#import "ServiceBasePutRequest.h"
#import "ServiceBaseDeleteRequest.h"
#import "LRNetManager.h"
#endif
#endif 
#ifdef DEBUG
#define NETLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NETLog(...)
#endif
#define NetworkTimeout  200.0
