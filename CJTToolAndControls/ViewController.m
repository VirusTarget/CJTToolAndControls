//
//  ViewController.m
//  CJTToolAndControls
//
//  Created by 陈晋添 on 2018/3/22.
//  Copyright © 2018年 cjt. All rights reserved.
//

#import "ViewController.h"

#import "TestEmergencyViewController.h"
#import "testToastTableViewController.h"
#import "TestColorViewController.h"
#import "TestKeyboardViewController.h"
#import "TestEventViewController.h"

#import "toast.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *itemArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemArray = @[@"紧急处理",@"toast提示",@"字符串检查",@"颜色生成",@"特殊键盘",@"农历选择器",@"日历"];
    
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
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
        case 0: {
            TestEmergencyViewController *controller = [TestEmergencyViewController new];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
        case 1: {
            testToastTableViewController *controller = [testToastTableViewController new];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
        case 2: {
            [toast toastString:@"通过unitTests验证"];
            break;
        }
        case 3: {
            TestColorViewController *controller = [TestColorViewController new];
            [self.navigationController pushViewController:controller animated:YES];
            break;
        }
        case 4: {
            TestKeyboardViewController *controller = [TestKeyboardViewController new];
            [self.navigationController pushViewController:controller animated:YES];
            
        }
        case 6: {
            TestEventViewController *controller = [TestEventViewController new];
            [self.navigationController pushViewController:controller animated:YES];
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
