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

- (void)registerPage:(Class)pageType {
    
    // 未实现DPRouterPage不进行注册
    if ([pageType respondsToSelector:@selector(pageURL)] == NO ||
        [pageType respondsToSelector:@selector(pageForURL:)] == NO) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@: 页面类型不符合`DPRouterPage`协议", pageType]);
        return;
    }

    NSURL *url = [pageType pageURL];
    if (url == nil) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@: 页面类型返回的URL不能为空", pageType]);
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
