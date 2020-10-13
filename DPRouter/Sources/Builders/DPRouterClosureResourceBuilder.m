//
//  DPRouterClosureResourceBuilder.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/10.
//

#import "DPRouterClosureResourceBuilder.h"

@implementation DPRouterClosureResourceBuilder

- (instancetype)initWithResourceBuildClosure:(id<DPRouterResource>  _Nullable (^)(NSURL * _Nonnull))resourceBuildClosure {
    if (self = [super init]) {
        self.resourceBuildClosure = resourceBuildClosure;
    }
    return self;
}

#pragma mark - DPRouterResourceBuilder

- (id<DPRouterResource>)resourceForURL:(NSURL *)url {
    return self.resourceBuildClosure(url);
}

@end

#pragma mark - DPRouter (DPRouteClosureResourceBuilder)

@implementation DPRouter (DPRouterClosureResourceBuilder)

- (void)registerClosureBuilder:(id<DPRouterResource>  _Nullable (^)(NSURL * _Nonnull))resourceBuildClosure
                        forURL:(NSURL *)url {
    DPRouterClosureResourceBuilder *closureResourceBuilder = [[DPRouterClosureResourceBuilder alloc] initWithResourceBuildClosure:resourceBuildClosure];
    [self registerBuilder:closureResourceBuilder forURL:url];
}

@end
