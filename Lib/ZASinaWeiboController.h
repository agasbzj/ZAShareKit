//
//  ZASinaWeiboController.h
//  ZAShareKit
//
//  Created by 卞中杰 on 14-5-27.
//  Copyright (c) 2014年 agas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IShare.h"
#import "WeiboSDK.h"

#define SINA_WEIBO_APP_KEY      @"565462726"
#define SINA_WEIBO_APP_SECRET   @"0135c6d428434c39891d7e9a8d8d95fd"
#define SINA_WEIBO_REDIRECT_URL @"https://api.weibo.com/oauth2/default.html"
@interface ZASinaWeiboController : NSObject<IShare, WeiboSDKDelegate>
- (void)auth;
@end
