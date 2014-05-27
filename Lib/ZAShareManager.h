/*!
 @header ZAShareManager
 ZAShareManager，向各个第三方平台进行分享须通过该类来进行
 @author 卞中杰
 @updated 2014-02-12
 @copyright 2014年 China317. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "IShare.h"

/*!
 @class ZAShareManager
 @abstract 这是一个Singleton
 @discussion 必须调用sharedManager方法来获取其实例
 */
@interface ZAShareManager : NSObject
{
    NSMutableArray *_implArray; //id<IShare>
}

/*!
 Singleton
 @return Instance of ZAShareManager
 */
+ (instancetype)sharedManager;

/*!
 分享文字和图片到TimeLine
 @param impl 实现IShare接口的分享实现
 @param text 分享的文字
 @param image 分享的图片
 @param response 分享完成后用于回调的block
 */
- (void)shareToTimelineWithShareImpl:(id<IShare>)impl text:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response;

/*!
 分享文字和图片到用户
 @param impl 实现IShare接口的分享实现
 @param text 分享的文字
 @param image 分享的图片
 @param response 分享完成后用于回调的block
 */
- (void)shareToUserWithShareImpl:(id<IShare>)impl text:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response;

/*!
 UIApplication的handleOpenUrl统一处理入口，会给每个注册的IShare进行处理
 @param url URL
 @param app Source App's name
 @param annotation Annotation
 @return 返回所有注册的IShare实现中，是否有能够处理该url
 */
- (BOOL)handleOpenUrl:(NSURL *)url sourceApplication:(NSString *)app annotation:(id)annotation;

- (BOOL)handleOpenURL:(NSURL *)url;


- (void)removeShareImpl:(id<IShare>)impl;
@end
