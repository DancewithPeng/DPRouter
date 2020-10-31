//
//  DPRouter.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import "DPRouterImplement.h"
#import "NSURL+DPRouterConvenient.h"
#import "DPRouterPageBuilder.h"
#import "DPRouterShowOnCurrentPageRoutePolicy.h"

@interface DPRouter ()

/// 注册的路由策略
@property (nonatomic, strong) NSMutableDictionary<NSString *, id<DPRoutePolicy>> *registeredRoutePolicies;

@end

@implementation DPRouter

#pragma mark - Interfaces

- (void)registerRoutePolicy:(id<DPRoutePolicy>)routePolicy forURL:(NSURL *)url {
    [self.registeredRoutePolicies setObject:routePolicy forKey:url.resourceName];
}

- (BOOL)routeToURL:(NSURL *)url {
    
    id<DPRoutePolicy> routePolicy = [self.registeredRoutePolicies objectForKey:url.resourceName];
    if (routePolicy == nil) {
        routePolicy = self.defaultRoutePolicy;
    }
    
    // 没有目标页面的路由策略
    if ([routePolicy respondsToSelector:@selector(routeWithURL:)]) {
        return [routePolicy routeWithURL:url];
    }
    
    // 带目标页面的路由策略
    if ([routePolicy respondsToSelector:@selector(routeTargetPage:withURL:)]) {
        UIViewController *targetPage = [DPRouterResourceDespatcher.sharedDespatcher pageForURL:url];
        if (targetPage == nil) {
            return NO;
        }
        return [routePolicy routeTargetPage:targetPage withURL:url];
    }
    
    return NO;
}

#pragma mark - Getters

+ (DPRouter *)sharedRouter {
    static DPRouter *_router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _router = [[DPRouter alloc] init];
    });
    return _router;
}

- (NSMutableDictionary<NSString *,id<DPRoutePolicy>> *)registeredRoutePolicies {
    if (_registeredRoutePolicies == nil) {
        _registeredRoutePolicies = [[NSMutableDictionary alloc] init];
    }
    return _registeredRoutePolicies;
}

- (id<DPRoutePolicy>)defaultRoutePolicy {
    if (_defaultRoutePolicy == nil) {
        _defaultRoutePolicy = [DPRouterShowOnCurrentPageRoutePolicy policy];
    }
    return _defaultRoutePolicy;
}

@end
