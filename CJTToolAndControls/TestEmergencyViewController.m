//
//  TestEmergencyViewController.m
//  CJTToolAndControls
//
//  Created by 陈晋添 on 2018/3/22.
//  Copyright © 2018年 cjt. All rights reserved.
//

#import "TestEmergencyViewController.h"
#import "ViewController.h"

#import "EmergencyObject.h"

#import "UINavigationController+Emergency.h"
#import "UIViewController+Emergency.h"

@interface TestEmergencyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *itemArray;

@end

@implementation TestEmergencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.itemArray = @[@"present url",@"present image",@"push url",@"push url"];
    
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [EmergencyObject removeViewControllerWithClassName:@"ViewController"];
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.itemArray[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDataSource>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            [self presentUrl];
            break;
        }
        case 1:{
            [self presentImage];
            break;
        }
        case 2:{
            [self pushUrl];
            break;
        }
        case 3:{
            [self pushImage];
            break;
        }
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)presentUrl {
    [EmergencyObject addViewControllerWithClassName:@"ViewController" emergencyUrl:[NSURL URLWithString:@"https://www.baidu.com"]];
    ViewController *controller = [ViewController new];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)presentImage {
    [EmergencyObject addViewControllerWithClassName:@"ViewController" emergencyPicture:
     [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"default.png"]]];
    ViewController *controller = [ViewController new];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)pushUrl {
    [EmergencyObject addViewControllerWithClassName:@"ViewController" emergencyUrl:[NSURL URLWithString:@"https://www.baidu.com"]];
    ViewController *controller = [ViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)pushImage {
    [EmergencyObject addViewControllerWithClassName:@"ViewController" emergencyPicture:
     [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"default.png"]]];
    ViewController *controller = [ViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark - getter/setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
