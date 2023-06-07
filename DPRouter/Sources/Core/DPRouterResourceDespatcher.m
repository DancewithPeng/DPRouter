//
//  DPRouterResourceDespatcher.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/31.
//

#import "DPRouterResourceDespatcher.h"
#import "NSURL+DPRouterConvenient.h"

@interface DPRouterResourceDespatcher ()

/// 注册的构造器
@property (nonatomic, strong) NSMutableDictionary<NSString *, id<DPRouterResourceBuilder>> *registeredBuilders;

@end

@implementation DPRouterResourceDespatcher

+ (DPRouterResourceDespatcher *)sharedDespatcher {
    static DPRouterResourceDespatcher *_despatcher;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _despatcher = [[DPRouterResourceDespatcher alloc] init];
    });
    return _despatcher;
}

- (void)registerBuilder:(id<DPRouterResourceBuilder>)builder forURL:(NSURL *)url {
    self.registeredBuilders[url.resourceName] = builder;
}

- (id<DPRouterResourceBuilder>)builderForURL:(NSURL *)url {
    return self.registeredBuilders[url.resourceName];
}

- (nullable id<DPRouterResource>)resourceForURL:(NSURL *)url {
    id<DPRouterResourceBuilder> builder = self.registeredBuilders[url.resourceName];
    if (builder == nil) {
        return nil;
    }
    return [builder resourceForURL:url];
}

#pragma mark - Getters

- (NSMutableDictionary<NSString *,id<DPRouterResourceBuilder>> *)registeredBuilders {
    if (_registeredBuilders == nil) {
        _registeredBuilders = [[NSMutableDictionary alloc] init];
    }
    return _registeredBuilders;
}

@end
