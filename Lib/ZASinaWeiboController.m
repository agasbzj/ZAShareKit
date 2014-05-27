//
//  ZASinaWeiboController.m
//  ZAShareKit
//
//  Created by 卞中杰 on 14-5-27.
//  Copyright (c) 2014年 agas. All rights reserved.
//

#import "ZASinaWeiboController.h"

@interface ZASinaWeiboController ()
@property (nonatomic, strong) OnShareResponse response;
@end

@implementation ZASinaWeiboController

- (id)init
{
    self = [super init];
    if (self) {
        [WeiboSDK enableDebugMode:YES];
        [WeiboSDK registerApp:SINA_WEIBO_APP_KEY];
    }
    return self;
}

- (void)auth
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = SINA_WEIBO_REDIRECT_URL;
    request.scope = @"all";
    [WeiboSDK sendRequest:request];
}

- (BOOL)isShareAvailable
{
    return [WeiboSDK isWeiboAppInstalled];
}

- (BOOL)handleOpenUrl:(NSURL *)url sourceApplication:(NSString *)app annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

- (void)shareToTimelineWithText:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response
{
    _response = response;
    WBMessageObject *message = [WBMessageObject message];
    message.text = text;
    if (image) {
        WBImageObject *imgObj = [WBImageObject object];
        imgObj.imageData = UIImagePNGRepresentation(image);
        message.imageObject = imgObj;
    }
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    [WeiboSDK sendRequest:request];
}

- (void)shareToUserWithText:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response
{
    //新浪微博不能发送给某个好友
    if (_response) {
        _response(NO, nil);
        _response = nil;
    }
}

#pragma mark - WeiboSDKDelegate
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if (_response) {
        if (response.statusCode == WeiboSDKResponseStatusCodeSuccess) {
            _response(YES, response.userInfo);
        }
        else {
            _response(NO, response.userInfo);
        }
        _response = nil;
    }
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}
@end
