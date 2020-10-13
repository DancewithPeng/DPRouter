//
//  DPRouter.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import "DPRouterImplement.h"
#import "NSURL+DPRouterConvenient.h"

@interface DPRouter ()

/// 注册的构造器
@property (nonatomic, strong) NSMutableDictionary<NSString *, id<DPRouterResourceBuilder>> *registeredBuilders;

@end

@implementation DPRouter

#pragma mark - Interfaces

- (void)registerBuilder:(id<DPRouterResourceBuilder>)builder forURL:(NSURL *)url {
    self.registeredBuilders[url.resourceName] = builder;
}

- (nullable id<DPRouterResource>)resourceForURL:(NSURL *)url {
    id<DPRouterResourceBuilder> builder = self.registeredBuilders[url.resourceName];
    if (builder == nil) {
        return nil;
    }
    return [builder resourceForURL:url];
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

- (NSMutableDictionary<NSString *,id<DPRouterResourceBuilder>> *)registeredBuilders {
    if (_registeredBuilders == nil) {
        _registeredBuilders = [[NSMutableDictionary alloc] init];
    }
    return _registeredBuilders;
}

@end
