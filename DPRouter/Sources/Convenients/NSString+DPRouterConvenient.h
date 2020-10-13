//
//  NSString+DPRouterConvenient.h
//  DPRouter
//
//  Created by 张鹏 on 2020/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 通过字符串快速生成URL对象
@interface NSString (DPRouterConvenient)

/// 生成对应的URL对象
@property (nonatomic, readonly) NSURL *URL;

@end

NS_ASSUME_NONNULL_END
