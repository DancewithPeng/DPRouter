//
//  DPRouter.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import <Foundation/Foundation.h>
#import "DPRouterResource.h"
#import "DPRouterResourceBuilder.h"

NS_ASSUME_NONNULL_BEGIN

/// 路由器
@interface DPRouter : NSObject

/// 单例
@property (nonatomic, readonly, class) DPRouter *sharedRouter;

/// 注册构造器
/// @param builder 资源构造器
/// @param url 资源对应的URL
- (void)registerBuilder:(id<DPRouterResourceBuilder>)builder forURL:(NSURL *)url;

/// 获取资源
/// @param url 资源对应的URL
- (nullable id<DPRouterResource>)resourceForURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
