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

/// 页面
@protocol DPRouterPage <DPRouterResource>

/// 页面对应的URL
@property (nonatomic, strong, class, readonly) NSURL *pageURL;

/// 页面创建方法
/// @param url 页面对应的URL
+ (nullable __kindof UIViewController *)pageForURL:(NSURL *)url;

@end

/// 页面构造器
@interface DPRouterPageBuilder : NSObject <DPRouterResourceBuilder>

/// 页面类型，这里的类需要符合`DPRouterPage`协议
@property (nonatomic, strong) Class pageType;

/// 初始化方法，这里的类需要符合`DPRouterPage`协议
/// @param pageType 页面类型
- (instancetype)initWithPageType:(Class)pageType;

@end

/// DPRouterPageBuilder对DPRouter的扩展
@interface DPRouter (DPRouterPageBuilder)

/// 注册页面
/// @param pageType 页面类型
- (void)registerPage:(Class)pageType NS_SWIFT_NAME(register(_:));

/// 根据URL获取页面
/// @param url 页面对应的URL
- (nullable __kindof UIViewController *)pageForURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
