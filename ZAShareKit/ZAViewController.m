//
//  ZAViewController.m
//  ZAShareKit
//
//  Created by 卞中杰 on 14-5-27.
//  Copyright (c) 2014年 agas. All rights reserved.
//

#import "ZAViewController.h"
#import "ZAShareManager.h"
#import "ZASinaWeiboController.h"
#import "ZAWeixinController.h"

@interface ZAViewController ()

@end

@implementation ZAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareToSinaWeibo:(id)sender {
    ZASinaWeiboController *impl = [[ZASinaWeiboController alloc] init];
    [[ZAShareManager sharedManager] shareToTimelineWithShareImpl:impl text:@"Test Weibo" image:nil onFinish:^(BOOL success, id userInfo) {
        NSLog(@"Share Result:%i", success);
    }];
}

- (IBAction)shareToWXTimeLine:(id)sender {
}

- (IBAction)shareToWXFriend:(id)sender {
}

@end
