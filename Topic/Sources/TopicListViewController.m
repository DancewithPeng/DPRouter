//
//  TopicListViewController.m
//  Topic
//
//  Created by 张鹏 on 2020/10/12.
//

#import "TopicListViewController.h"

@interface TopicListViewController ()

@end

@implementation TopicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
}

+ (__kindof UIViewController *)pageForURL:(NSURL *)url {
    
    TopicListViewController *topicPage = [[TopicListViewController alloc] initWithNibName:@"TopicListViewController" bundle:[NSBundle bundleForClass:TopicListViewController.class]];
    topicPage.title = @"话题";
    topicPage.navigationItem.title = @"话题列表";
    
    if ([url.queries[@"nav"] integerValue] == 1) {
        return [[UINavigationController alloc] initWithRootViewController:topicPage];
    } else {
        return topicPage;
    }
}

@end
