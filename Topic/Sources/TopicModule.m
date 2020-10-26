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
        
    DPRoute(@"sub.myhost.com/topics".URL, TopicListViewController.class);
}

@end
