//
//  DPRouterPageBuilder.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import <UIKit/UIKit.h>
#import "DPRouterResourceBuilder.h"
#import "DPRouterResourceDespatcher.h"

NS_ASSUME_NONNULL_BEGIN

#define DPRoute(url, pageProvider) [DPRouterResourceDespatcher.sharedDespatcher registerPageProvider:pageProvider forURL:url];

/// 页面提供者
NS_SWIFT_NAME(Router.PageProvider)
@protocol DPRouterPageProvider <NSObject>

/// 页面创建方法
/// @param url 页面对应的URL
+ (nullable __kindof UIViewController *)pageForURL:(NSURL *)url;

@end

/// 页面构造器
NS_SWIFT_NAME(Router.PageBuilder)
@interface DPRouterPageBuilder : NSObject <DPRouterResourceBuilder>

/// 页面类型，这里的类需要符合`DPRouterPageProvider`协议
@property (nonatomic, strong) Class<DPRouterPageProvider> pageProvider;

/// 初始化方法，这里的类需要符合`DPRouterPageProvider`协议
/// @param pageProvider 页面类型
- (instancetype)initWithPageProvider:(Class<DPRouterPageProvider>)pageProvider;

@end

/// DPRouterPageBuilder对DPRouterResourceDespatcher的扩展
@interface DPRouterResourceDespatcher (DPRouterPageBuilder)

/// 默认页面，当URL没有注册对应的页面时，将使用此默认页面
@property (nonatomic, strong, nullable) Class<DPRouterPageProvider> defaultPageProvider;

/// 注册页面
/// @param pageProvider 页面提供者
/// @param url 页面对应的URL
- (void)registerPageProvider:(Class<DPRouterPageProvider>)pageProvider
                      forURL:(NSURL *)url NS_SWIFT_NAME(register(_:for:));

/// 根据URL获取页面
/// @param url 页面对应的URL
- (nullable __kindof UIViewController *)pageForURL:(NSURL *)url;

@end

@interface UIViewController (DPRouterResource) <DPRouterResource>

@end

NS_ASSUME_NONNULL_END
