//
//  ZAShareManager.m
//  Nav168
//
//  Created by 卞中杰 on 14-2-11.
//  Copyright (c) 2014年 China317. All rights reserved.
//

#import "ZAShareManager.h"

@implementation ZAShareManager

+ (instancetype)sharedManager
{
    __strong static ZAShareManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZAShareManager alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _implArray = [NSMutableArray array];
    }
    return self;
}

- (void)shareToTimelineWithShareImpl:(id<IShare>)impl text:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response
{
    if ([impl isShareAvailable]) {
        if (![_implArray containsObject:impl]) {
            [_implArray addObject:impl];
        }
        [impl shareToTimelineWithText:text image:image onFinish:response];
    }
}

- (void)shareToUserWithShareImpl:(id<IShare>)impl text:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response
{
    if ([impl isShareAvailable]) {
        if (![_implArray containsObject:impl]) {
            [_implArray addObject:impl];
        }
        [impl shareToUserWithText:text image:image onFinish:response];
    }
}

- (BOOL)handleOpenUrl:(NSURL *)url sourceApplication:(NSString *)app annotation:(id)annotation
{
    BOOL handled = NO;
    for (id<IShare> impl in _implArray) {
        handled = [impl handleOpenUrl:url sourceApplication:app annotation:annotation] || handled;
    }
    return handled;
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    BOOL handled = NO;
    for (id<IShare> impl in _implArray) {
        handled = [impl handleOpenURL:url] || handled;
    }
    return handled;
}

- (void)removeShareImpl:(id<IShare>)impl
{
    [_implArray removeObject:impl];
}

@end
