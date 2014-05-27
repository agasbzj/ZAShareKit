/*!
 @header IShare
 IShare接口，向各个第三方平台进行分享的实现须继承该接口
 @author 卞中杰
 @updated 2014-02-12
 @copyright 2014年 China317. All rights reserved.
 */

#import <Foundation/Foundation.h>

/*!
 @typedef OnShareResponse
 @abstract 分享结束后进行回调的block
 @param success 分享是否成功
 @param userInfo 任何回调所带的信息，可能为nil
 @discussion 分享完成后，分享控制器设计者必须调用该block，并且传入适当的参数
 */
typedef void (^OnShareResponse)(BOOL success, id userInfo);

/*!
 @protocol IShare
 @discussion 各种共享控制器必须现实的接口
 */
@protocol IShare <NSObject>

/*!
 检查分享是否可用
 @return 返回这种分享是否可用
 */
- (BOOL)isShareAvailable;

/*!
 分享文字和图片到时间线，分享结束后获得回调
 @param text 分享的文字
 @param image 分享的图片
 @param response 回调block，可以为nil
 */
- (void)shareToTimelineWithText:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response;

/*!
 分享文字和图片到用户，分享结束后获得回调
 @param text 分享的文字
 @param image 分享的图片
 @param response 回调block，可以为nil
 */
- (void)shareToUserWithText:(NSString *)text image:(UIImage *)image onFinish:(OnShareResponse)response;

/*!
 从第三方程序跳转回来时，供UIApplication调用
 @param url App's URL
 @param app App's name
 @param annotation Annotation
 @return 如果能处理这个url，返回YES，否则返回NO
 */
- (BOOL)handleOpenUrl:(NSURL *)url sourceApplication:(NSString *)app annotation:(id)annotation;

- (BOOL)handleOpenURL:(NSURL *)url;

@end
