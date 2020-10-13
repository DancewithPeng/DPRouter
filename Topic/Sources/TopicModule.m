//
//  TopicModule.m
//  Topic
//
//  Created by 张鹏 on 2020/10/12.
//

#import "TopicModule.h"
#import <DPRouter/DPRouter.h>
#import "TopicListViewController.h"

@implementation TopicModule

- (void)didLoad {
    [super didLoad];
    
    [DPRouter.sharedRouter registerPage:TopicListViewController.class];
    
//    [DPRouter.sharedRouter registerClosureBuilder:^id<DPRouterResource> _Nullable(NSURL * _Nonnull url) {
//        TopicListViewController *topicPage = [[TopicListViewController alloc] initWithNibName:@"TopicListViewController" bundle:[NSBundle bundleForClass:TopicListViewController.class]];
//        topicPage.title = @"话题";
//        return topicPage;
//    } forURL:@"sub.myhost.com/topics".URL];
}

@end
