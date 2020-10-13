//
//  NSURL+DPRouterConvenient.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// NSURL的便捷方法
@interface NSURL (DPRouterConvenient)

/// 资源名称（host+path）
@property (nonatomic, readonly) NSString *resourceName;

/// 查询参数
@property (nonatomic, readonly, nullable) NSDictionary<NSString *, NSString *> *queries;

@end

NS_ASSUME_NONNULL_END
