//
//  DPRouterResourceBuilder.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import <Foundation/Foundation.h>
#import "DPRouterResource.h"

NS_ASSUME_NONNULL_BEGIN

/// 资源构造器
NS_SWIFT_NAME(Router.ResourceBuilder)
@protocol DPRouterResourceBuilder <NSObject>

/// 返回URL对应的资源
/// @param url 对应的URL
- (nullable id<DPRouterResource>)resourceForURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
