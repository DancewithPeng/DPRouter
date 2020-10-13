//
//  NSString+DPRouterConvenient.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/12.
//

#import "NSString+DPRouterConvenient.h"

@implementation NSString (DPRouterConvenient)

- (NSURL *)URL {
    return [NSURL URLWithString:self];
}

@end
