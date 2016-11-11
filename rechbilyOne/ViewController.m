//
//  ViewController.m
//  rechbilyOne
//
//  Created by 密码123 on 16/11/9.
//  Copyright © 2016年 密码123. All rights reserved.
//
typedef enum
{
    no_netwoking=0,
    networking_2G=1,
    networking_3G=2,
    networking_4G=3,
    networking_other=4,
    networking_wifi=5,
}netWorkingType;
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender
{
    NSInteger num= [self getNetWorkStates];
    NSLog(@"-=-=-=-=-:%d",(int)num);
    [[[UIAlertView alloc] initWithTitle:@"RealReachability" message:[NSString stringWithFormat:@"--->:%d",(int)num] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil] show];
    
//    if (num==5)
//    {
//        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//            if (data) {
//                
//                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];  //把data转化成NSString
//                
//                
//                NSLog(@"str:%@",str);  //根据服务器给的返回值判断请求是否正确(即使成功连接服务器，不代表你的请求是正确的)。
//            }
//            
//            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//            NSLog(@"statusCode:%ld",(long)httpResponse.statusCode);
//        }];
//    }
    
}


/**
 *  获取当前网络连接状态
 */
-(NSInteger)getNetWorkStates{
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            break;
        }
        //根据状态选择
    }
    return netType;
}
@end
