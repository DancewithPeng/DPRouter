//
//  DPRouterPageBuilder.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import <UIKit/UIKit.h>
#import "DPRouterResourceBuilder.h"
#import "DPRouterImplement.h"

NS_ASSUME_NONNULL_BEGIN

#define DPRoute(url, pageType) [DPRouter.sharedRouter registerPage:pageType forURL:url];

/// 页面提供者
@protocol DPRouterPageProvider <NSObject>

/// 页面创建方法
/// @param url 页面对应的URL
+ (nullable __kindof UIViewController *)pageForURL:(NSURL *)url;

@end

/// 页面构造器
@interface DPRouterPageBuilder : NSObject <DPRouterResourceBuilder>

/// 页面类型，这里的类需要符合`DPRouterPageProvider`协议
@property (nonatomic, strong) Class pageType;

/// 初始化方法，这里的类需要符合`DPRouterPageProvider`协议
/// @param pageType 页面类型
- (instancetype)initWithPageType:(Class)pageType;

@end

/// DPRouterPageBuilder对DPRouter的扩展
@interface DPRouter (DPRouterPageBuilder)

/// 注册页面
/// @param pageType 页面类型
/// @param url 页面对应的URL
- (void)registerPage:(Class)pageType forURL:(NSURL *)url NS_SWIFT_NAME(register(_:for:));

/// 根据URL获取页面
/// @param url 页面对应的URL
- (nullable __kindof UIViewController *)pageForURL:(NSURL *)url;

@end

@interface UIViewController (DPRouterResource) <DPRouterResource>

@end

NS_ASSUME_NONNULL_END
