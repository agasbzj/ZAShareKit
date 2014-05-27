//
//  ZAWeixinController.m
//  Nav168
//
//  Created by 卞中杰 on 14-2-11.
//  Copyright (c) 2014年 China317. All rights reserved.
//

#import "ZAWeixinController.h"

@implementation ZAWeixinController

- (id)init
{
    self = [super init];
    if (self) {
        [WXApi registerApp:KEY_WEIXIN];
    }
    return self;
}

#pragma mark - IShare
- (BOOL)isShareAvailable
{
    return [WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi];
}

- (void)shareToTimelineWithText:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response
{
    _onResp = response;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.scene = WXSceneTimeline;

    if (image) {
        req.bText = NO;
        WXMediaMessage *media = [WXMediaMessage message];
        media.description = text;
        WXImageObject *imgObj = [WXImageObject object];
        imgObj.imageData = UIImagePNGRepresentation(image);
        media.mediaObject = imgObj;
        req.message = media;
    }
    else {
        req.bText = YES;
        req.text = text;
    }
    
    [WXApi sendReq:req];
}

- (void)shareToUserWithText:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response
{
    _onResp = response;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.scene = WXSceneSession;
    
    if (image) {
        req.bText = NO;
        WXMediaMessage *media = [WXMediaMessage message];
        media.description = text;
        WXImageObject *imgObj = [WXImageObject object];
        imgObj.imageData = UIImagePNGRepresentation(image);
        media.mediaObject = imgObj;
        req.message = media;
    }
    else {
        req.bText = YES;
        req.text = text;
    }
    
    [WXApi sendReq:req];
}

- (BOOL)handleOpenUrl:(NSURL *)url sourceApplication:(NSString *)app annotation:(id)annotation
{
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

#pragma mark - WxApiDelegate
- (void)onResp:(BaseResp *)resp
{
    if (resp.errCode == WXSuccess) {
        if (_onResp) {
            _onResp(YES, nil);
        }
    }
    else {
        if (_onResp) {
            _onResp(NO, nil);
        }
    }
    _onResp = nil;
}

@end
