//
//  BNRRemainderViewController.m
//  HypnoNerd
//
//  Created by Shafiq Shovo on 14/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "BNRRemainderViewController.h"
#import "UserNotifications/UserNotifications.h"


@interface BNRRemainderViewController ()
@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;
@end

@interface BNRRemainderViewController ()
{
    bool isGranted;
}
@end

@implementation BNRRemainderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    isGranted = false;
    UNUserNotificationCenter * center = [ UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    [ center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        isGranted =  granted;
    }];
}

- (IBAction) addRemainder:(id)sender
{
   
   
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reminder set"
                                                    message:@"Ready to go!!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    if (isGranted)
    {
        UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent * mucontent = [[UNMutableNotificationContent alloc]init];
        mucontent.title=@"Hypnotizer";
        ///mucontent.subtitle=@"I";
        mucontent.body=@"I am hipnotized!!!";
        mucontent.sound=[UNNotificationSound defaultSound];
         NSDate *date = self.datePicker.date;
         NSLog(@"Setting a remainder for %@",date);
        //NSDate *date = [NSDate dateWithTimeIntervalSinceNow:3600];
        NSDateComponents *triggerDate = [[NSCalendar currentCalendar]
                                         components:NSCalendarUnitYear +
                                         NSCalendarUnitMonth + NSCalendarUnitDay +
                                         NSCalendarUnitHour + NSCalendarUnitMinute +
                                         NSCalendarUnitSecond fromDate:date];
        
        UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:triggerDate
                                                                                                          repeats:NO];
        //UNTimeIntervalNotificationTrigger *trigger=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
        UNNotificationRequest * request = [UNNotificationRequest requestWithIdentifier:@"UYLocalNotification" content:mucontent trigger:trigger];
        [center addNotificationRequest:request withCompletionHandler:nil];
        
    }
    
}
- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [ super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Remainder";
        //self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [ UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
