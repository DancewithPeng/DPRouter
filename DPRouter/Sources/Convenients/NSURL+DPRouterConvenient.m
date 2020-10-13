//
//  NSURL+DPRouterConvenient.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/12.
//

#import "NSURL+DPRouterConvenient.h"

@implementation NSURL (DPRouterConvenient)

- (NSString *)resourceName {
    return [NSString stringWithFormat:@"%@%@", self.host != nil ? self.host : @"", self.path];
}

- (NSDictionary<NSString *,NSString *> *)queries {
    NSURLComponents *components = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:self.baseURL != nil];
    if (components.queryItems == nil) {
        return nil;
    }
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] initWithCapacity:components.queryItems.count];
    
    for (NSURLQueryItem *item in components.queryItems) {
        [results setObject:item.value ? item.value : @"" forKey:item.name];
    }
    
    return results.copy;
}

@end
