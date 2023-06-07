//
//  DPRoutePolicy.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 路由策略
NS_SWIFT_NAME(RoutePolicy)
@protocol DPRoutePolicy <NSObject>

/// 创建策略的便捷方法
+ (instancetype)policy;


@optional

/// 没有目标页面的路由
/// @param url 对应的URL
- (BOOL)routeWithURL:(NSURL *)url;

/// 没有目标页面的路由
/// @param url 对应的URL
/// @param sourcePage 来源页面
- (BOOL)routeWithURL:(NSURL *)url
            fromPage:(UIViewController * _Nullable)sourcePage NS_SWIFT_NAME(route(with:from:));

/// 路由到目标页面
/// @param targetPage 目标页面
/// @param url 目标页面对应的URL
- (BOOL)routeTargetPage:(UIViewController *)targetPage
                withURL:(NSURL *)url NS_SWIFT_NAME(route(targetPage:with:));

/// 路由到目标页面
/// @param targetPage 目标页面
/// @param url 目标页面对应的URL
/// @param sourcePage 来源页面
- (BOOL)routeTargetPage:(UIViewController *)targetPage
                withURL:(NSURL *)url
               fromPage:(UIViewController * _Nullable)sourcePage NS_SWIFT_NAME(route(targetPage:with:from:));

@end

NS_ASSUME_NONNULL_END
