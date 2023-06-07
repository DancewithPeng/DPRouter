//
//  DPRouterResourceDespatcher.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/31.
//

#import <Foundation/Foundation.h>
#import "DPRouterResource.h"
#import "DPRouterResourceBuilder.h"

NS_ASSUME_NONNULL_BEGIN

/// 资源调度器
NS_SWIFT_NAME(Router.ResourceDespatcher)
@interface DPRouterResourceDespatcher : NSObject

/// 单例入口
@property (nonatomic, class, readonly) DPRouterResourceDespatcher *sharedDespatcher;

/// 注册构造器
/// @param builder 资源构造器
/// @param url 资源对应的URL
- (void)registerBuilder:(id<DPRouterResourceBuilder>)builder forURL:(NSURL *)url;

/// 获取URL注册的Builder
/// @param url 资源对应的URL
- (id<DPRouterResourceBuilder> _Nullable)builderForURL:(NSURL *)url;

/// 获取资源
/// @param url 资源对应的URL
- (nullable id<DPRouterResource>)resourceForURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
