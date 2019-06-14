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
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 250, 50)];
    [button setTitle:@"默认alert" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(alertAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor blackColor];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 180, 250, 50)];
    [button1 setTitle:@"默认actionSheet" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(actionSheetAction) forControlEvents:UIControlEventTouchUpInside];
    button1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button1];
    button1.layer.cornerRadius = 5;
    button1.layer.masksToBounds = YES;
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
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
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
    cell.backgroundColor = [self p_cellColor:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LEOAlertView *alert = (LEODemoAlertView *)tableView.superview;
    [alert dismiss];
}


- (UIColor *)p_cellColor:(NSInteger)index {
    
    UIColor *color;
    switch (index) {
        case 0:
            color = [UIColor yellowColor];
            break;
        case 1:
            color = [UIColor whiteColor];
            break;
        case 2:
            color = [UIColor greenColor];
            break;
        case 3:
            color = [UIColor orangeColor];
            break;
        default:
            color = [UIColor cyanColor];
            break;
    }
    return color;
}

@end
