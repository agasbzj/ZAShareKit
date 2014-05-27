/*!
 @header ZAWeixinController
 ZAWeixinController，微信分享的实现
 @author 卞中杰
 @updated 2014-02-12
 @copyright 2014年 China317. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "IShare.h"
#import "WXApi.h"


#define KEY_WEIXIN  @""


/*!
 @class ZAWeixinController
 @abstract 微信分享的实现
 */
@interface ZAWeixinController : NSObject<IShare, WXApiDelegate>
{
    OnShareResponse _onResp;
}
@end
