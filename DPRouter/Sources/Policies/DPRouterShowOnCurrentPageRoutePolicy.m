//
//  DPRouterShowOnCurrentPageRoutePolicy.m
//  DPRouter
//
//  Created by 张鹏 on 2020/10/31.
//

#import "DPRouterShowOnCurrentPageRoutePolicy.h"
#import <UIKit/UIKit.h>

#pragma mark - DPTopestViewController

@interface UIViewController (DPTopestViewController)

/// 最顶部的ViewController
@property (nonatomic, readonly) UIViewController *DP_topestViewController;

@end

@implementation UIViewController (DPTopestViewController)

- (UIViewController *)DP_topestViewController {
    if ([self isKindOfClass:UITabBarController.class]) {
        UITabBarController *tabBarController = (UITabBarController *)self;
        if (tabBarController.selectedViewController != nil) {
            return tabBarController.selectedViewController.DP_topestViewController;
        }
        return tabBarController;
    }
    
    if ([self isKindOfClass:UINavigationController.class]) {
        UINavigationController *navigationController = (UINavigationController *)self;
        if (navigationController.topViewController != nil) {
            return navigationController.topViewController.DP_topestViewController;
        }
        return navigationController;
    }
    
    if (self.presentedViewController != nil) {
        return self.presentedViewController.DP_topestViewController;
    }
    
    if (self.childViewControllers.lastObject != nil) {
        return self.childViewControllers.lastObject.DP_topestViewController;
    }
    
    return self;
}

@end

#pragma mark - DPRouterShowOnCurrentPageRoutePolicy

@implementation DPRouterShowOnCurrentPageRoutePolicy

+ (instancetype)policy {
    return [[DPRouterShowOnCurrentPageRoutePolicy alloc] init];
}

- (BOOL)routeTargetPage:(UIViewController *)targetPage withURL:(NSURL *)url {
    
    UIViewController *currentPage;
    
    if (@available(iOS 13.0, *)) {
        UIScene *scene = [UIApplication.sharedApplication.connectedScenes anyObject];
        if ([scene.delegate conformsToProtocol:@protocol(UIWindowSceneDelegate)]) {
            currentPage = [(id<UIWindowSceneDelegate>)scene.delegate window].rootViewController.DP_topestViewController;
        } else {
            if ([UIApplication.sharedApplication.delegate respondsToSelector:@selector(window)]) {
                currentPage = UIApplication.sharedApplication.delegate.window.rootViewController.DP_topestViewController;
            } else {
                return NO;
            }
        }
    } else {
        currentPage = UIApplication.sharedApplication.delegate.window.rootViewController.DP_topestViewController;
    }
    
    if (currentPage == nil) {
        return NO;
    }
    
    if (currentPage.navigationController) {
        targetPage.hidesBottomBarWhenPushed = YES;
        [currentPage.navigationController pushViewController:targetPage animated:YES];
    } else {
        targetPage.modalPresentationStyle = UIModalPresentationFullScreen;
        [currentPage presentViewController:targetPage animated:YES completion:nil];
    }
    
    return YES;
}

@end
