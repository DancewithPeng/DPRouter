//
//  DPRouter.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import <Foundation/Foundation.h>
#import "DPRoutePolicy.h"

NS_ASSUME_NONNULL_BEGIN

/// 路由器
NS_SWIFT_NAME(Router)
@interface DPRouter : NSObject

/// 单例
@property (nonatomic, readonly, class) DPRouter *sharedRouter;

/// 默认的路由策略，如果没有单独为URL注册对应策略，则使用此策略进行路由。默认值是`DPRouterShowOnCurrentPageRoutePolicy`对象
@property (nonatomic, strong) id<DPRoutePolicy> defaultRoutePolicy;

/// 注册路由策略
/// @param routePolicy 路由策略
/// @param url 策略对应的URL
- (void)registerRoutePolicy:(id<DPRoutePolicy>)routePolicy
                     forURL:(NSURL *)url NS_SWIFT_NAME(register(_:for:));

/// 获取URL对应的注册策略对象
/// @param url 对应的URL
- (nullable id<DPRoutePolicy>)policyForURL:(NSURL * _Nullable)url;

/// 路由到制定的URL
/// @param url 页面对应的URL
/// @return 如果路由器能处理此URL，则返回YES，不能处理则返回NO
- (BOOL)routeToURL:(NSURL *)url;

/// 路由到制定的URL
/// @param url 页面对应的URL
/// @param sourcePage 来源页面
/// @return 如果路由器能处理此URL，则返回YES，不能处理则返回NO
- (BOOL)routeToURL:(NSURL *)url
          fromPage:(UIViewController * _Nullable)sourcePage NS_SWIFT_NAME(route(to:from:));

@end

NS_ASSUME_NONNULL_END
