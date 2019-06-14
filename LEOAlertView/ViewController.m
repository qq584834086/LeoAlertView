//
//  ViewController.m
//  LEOAlertView
//
//  Created by LeoWang on 2019/6/13.
//  Copyright © 2019年 LeoWang. All rights reserved.
//

#import "ViewController.h"
#import "LEOAlertView.h"
#import "LEODemoAlertView.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [button setTitle:@"默认alert" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(alertAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor greenColor];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 200, 50)];
    [button1 setTitle:@"默认actionSheet" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(actionSheetAction) forControlEvents:UIControlEventTouchUpInside];
    button1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button1];
}


- (void)alertAction {
    
    
    LEODemoAlertView *alert = [[LEODemoAlertView alloc] init];
    __weak LEODemoAlertView *weakAlert = alert;
    alert.click = ^(NSString * _Nonnull title, NSInteger index) {
        
        NSLog(@"title: %@, index: %ld", title, index);
        [weakAlert dismiss];
    };
    [alert showWithButtonTitles:@[@"取消", @"确定"]
                      textTitle:@"继承LEOAlertView"];
    
}


- (void)actionSheetAction {
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 20, 200)];
    contentView.backgroundColor = [UIColor yellowColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    tableView.backgroundColor = [UIColor yellowColor];

    
    LEOAlertView *alertView = [[LEOAlertView alloc] init];
    alertView.contentView = tableView;
    alertView.type = LEOAlertViewTypeActionSheet;
    alertView.clickBgHidden = YES;
    
    [alertView show];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个选项", indexPath.row];
    cell.detailTextLabel.text = @"demo";
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LEOAlertView *alert = (LEODemoAlertView *)tableView.superview;
    [alert dismiss];
}



@end
