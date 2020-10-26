//
//  DPRouterPageBuilder.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import "DPRouterPageBuilder.h"

@implementation DPRouterPageBuilder

- (instancetype)initWithPageType:(Class)pageType {
    if (self = [super init]) {
        self.pageType = pageType;
    }
    return self;
}

- (id<DPRouterResource>)resourceForURL:(NSURL *)url {
    if ([self.pageType respondsToSelector:@selector(pageForURL:)] == NO) {
        return nil;
    }
    return [self.pageType pageForURL:url];
}

@end

@implementation DPRouter (DPRouterPageBuilder)

- (void)registerPage:(Class)pageType forURL:(NSURL *)url {
    
    // 如果没有遵循DPRouterPageProvider协议，则不进行注册
    if ([pageType conformsToProtocol:@protocol(DPRouterPageProvider)] == NO) {
        NSLog(@"pageType需要遵循`DPRouterPageProvider`协议");
        return;
    }
    
    DPRouterPageBuilder *pageBuilder = [[DPRouterPageBuilder alloc] initWithPageType:pageType];
    [self registerBuilder:pageBuilder forURL:url];
}

- (__kindof UIViewController *)pageForURL:(NSURL *)url {
    id<DPRouterResource> resource = [self resourceForURL:url];
    if ([resource isKindOfClass:UIViewController.class]) {
        return (UIViewController *)resource;
    }
    
    return nil;
}

@end

@implementation UIViewController (DPRouterResource)

@end
