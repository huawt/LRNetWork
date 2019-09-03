
#import <Foundation/Foundation.h>

#ifndef _NETWORKSDK_
#define _NETWORKSDK_

#if __has_include(<TLNetWork/NetworkHeader.h>)

FOUNDATION_EXPORT double TLNetWorkVersionNumber;
FOUNDATION_EXPORT const unsigned char TLNetWorkVersionString[];

#import <TLNetWork/NetworkBridge.h>
#import <TLNetWork/NetworkEngine.h>
#import <TLNetWork/YTKRequest+CustomHeader.h>
#import <TLNetWork/ServiceBaseRequest.h>
#import <TLNetWork/ServiceBaseGetRequest.h>
#import <TLNetWork/ServiceBasePutRequest.h>
#import <TLNetWork/ServiceBaseDeleteRequest.h>

#else

#import "NetworkBridge.h"
#import "NetworkEngine.h"
#import "YTKRequest+CustomHeader.h"
#import "ServiceBaseRequest.h"
#import "ServiceBaseGetRequest.h"
#import "ServiceBasePutRequest.h"
#import "ServiceBaseDeleteRequest.h"

#endif /* __has_include */

#endif /* _NETWORKSDK_ */


#ifdef DEBUG
#define NETLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NETLog(...)
#endif

#define NetworkTimeout  20.0
