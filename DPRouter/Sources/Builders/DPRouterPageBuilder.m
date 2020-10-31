//
//  DPRouterPageBuilder.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import "DPRouterPageBuilder.h"
#import <objc/runtime.h>

@interface DPRouterPageBuilder ()

@end

@implementation DPRouterPageBuilder

- (instancetype)initWithPageProvider:(Class<DPRouterPageProvider>)pageProvider {
    if (self = [super init]) {
        self.pageProvider = pageProvider;
    }
    return self;
}

- (id<DPRouterResource>)resourceForURL:(NSURL *)url {
    if ([self.pageProvider respondsToSelector:@selector(pageForURL:)] == NO) {
        return nil;
    }
    return [self.pageProvider pageForURL:url];
}

@end

@implementation DPRouterResourceDespatcher (DPRouterPageBuilder)

- (void)setDefaultPageProvider:(Class<DPRouterPageProvider>)defaultPageProvider {
    objc_setAssociatedObject(self, "defaultPageProvider", defaultPageProvider, OBJC_ASSOCIATION_RETAIN);
}

- (Class<DPRouterPageProvider>)defaultPageProvider {
    return objc_getAssociatedObject(self, "defaultPageProvider");
}

- (void)registerPageProvider:(Class<DPRouterPageProvider>)pageProvider forURL:(NSURL *)url {
    
    // 如果没有遵循DPRouterPageProvider协议，则不进行注册
    if ([pageProvider conformsToProtocol:@protocol(DPRouterPageProvider)] == NO) {
        NSLog(@"pageProvider需要遵循`DPRouterPageProvider`协议");
        return;
    }
    
    DPRouterPageBuilder *pageBuilder = [[DPRouterPageBuilder alloc] initWithPageProvider:pageProvider];
    [self registerBuilder:pageBuilder forURL:url];
}

- (__kindof UIViewController *)pageForURL:(NSURL *)url {
    id<DPRouterResource> resource = [self resourceForURL:url];
    if ([resource isKindOfClass:UIViewController.class]) {
        return (UIViewController *)resource;
    } else {
        if (self.defaultPageProvider) {
            return [self.defaultPageProvider pageForURL:url];
        }
    }
    
    return nil;
}

@end

@implementation UIViewController (DPRouterResource)

@end
