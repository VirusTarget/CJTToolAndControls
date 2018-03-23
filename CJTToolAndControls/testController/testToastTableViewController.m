//
//  testToastTableViewController.m
//  CJTToolAndControls
//
//  Created by 陈晋添 on 2018/3/23.
//  Copyright © 2018年 cjt. All rights reserved.
//

#import "testToastTableViewController.h"

#import "toast.h"
@interface testToastTableViewController ()
@property (nonatomic, strong) NSArray *itemArray;
@end

@implementation testToastTableViewController

- (void)viewDidLoad {
    self.itemArray = @[@"普通提示",@"多行提示",@"超长提示"];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    
    cell.textLabel.text = self.itemArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *selectorArray = @[@"showNormalToast",@"showLinesToast",@"showLongToast",@""];
    [self performSelector:NSSelectorFromString(selectorArray[indexPath.row])];
}

- (void)showNormalToast {
    [toast toastString:@"提示"];
}

- (void)showLinesToast {
    [toast toastString:@"多\n行\n提\n式"];
}

- (void)showLongToast {
    [toast toastString:@"3.141592653589793238462643383249901429"];
}

@end
