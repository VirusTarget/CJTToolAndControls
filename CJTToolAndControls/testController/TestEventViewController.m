//
//  TestEventViewController.m
//  CJTToolAndControls
//
//  Created by 陈晋添 on 2018/3/26.
//  Copyright © 2018年 cjt. All rights reserved.
//

#import "TestEventViewController.h"

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
@interface TestEventViewController ()<EKEventViewDelegate>

@end

@implementation TestEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *eventBtn = [UIButton buttonWithType:0];
    eventBtn.backgroundColor = [UIColor blueColor];
    eventBtn.frame = CGRectMake(0, 0, 60, 60);
    eventBtn.center = self.view.center;
    [eventBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eventBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)show {
    
    EKEventEditViewController *controller = [EKEventEditViewController new];
//    controller.editViewDelegate = self;
    controller.eventStore = [EKEventStore new];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)eventViewController:(EKEventViewController *)controller didCompleteWithAction:(EKEventViewAction)action {
    NSLog(@"%ld",action);
}
@end
