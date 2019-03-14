//
//  ViewController.m
//  HypnoNerd
//
//  Created by Shafiq Shovo on 14/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()
{
bool isGranted;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isGranted = false;
    UNUserNotificationCenter * center = [ UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    [ center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        isGranted =  granted;
    }];
}


@end
