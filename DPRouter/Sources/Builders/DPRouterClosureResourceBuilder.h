//
//  DPRouterClosureResourceBuilder.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import <Foundation/Foundation.h>
#import "DPRouterResource.h"
#import "DPRouterResourceBuilder.h"
#import "DPRouterImplement.h"

NS_ASSUME_NONNULL_BEGIN

/// 闭包资源构造器
@interface DPRouterClosureResourceBuilder : NSObject <DPRouterResourceBuilder>

/// 资源构造闭包
@property (nonatomic, copy) _Nullable id<DPRouterResource> (^resourceBuildClosure)(NSURL *);

/// 出事化方法
/// @param resourceBuildClosure 资源构造闭包
- (instancetype)initWithResourceBuildClosure:(_Nullable id<DPRouterResource> (^)(NSURL *))resourceBuildClosure;

@end

/// DPRouteClosureResourceBuilder对DPRouter的扩展
@interface DPRouter (DPRouterClosureResourceBuilder)

/// 注册闭包构造器器
/// @param resourceBuildClosure 资源构造闭包
/// @param url 对应的URL
- (void)registerClosureBuilder:(_Nullable id<DPRouterResource> (^)(NSURL *))resourceBuildClosure
                        forURL:(NSURL *)url NS_SWIFT_NAME(register(_:for:));

@end

NS_ASSUME_NONNULL_END
