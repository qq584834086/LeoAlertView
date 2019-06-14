//
//  LEODemoAlertView.m
//  LEOAlertView
//
//  Created by LeoWang on 2019/6/13.
//  Copyright © 2019年 LeoWang. All rights reserved.
//

#import "LEODemoAlertView.h"

@interface LEODemoAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSArray *buttonTitles;
@end

@implementation LEODemoAlertView


- (void)showWithButtonTitles:(NSArray *)titles
                   textTitle:(NSString *)title {
    
    self.buttonTitles = titles;
    self.titleLabel.text = title;
    
    self.contentView = [self customView];
    self.type = LEOAlertViewTypeNormal;
    self.clickBgHidden = YES;
    
    [self show];
}









- (UIView *)customView {
    
    UIView *containView = [UIView new];
    containView.backgroundColor = [UIColor whiteColor];
    containView.frame = CGRectMake(0, 0, 282, 124);
    containView.layer.cornerRadius = 5;
    containView.layer.masksToBounds = YES;

    self.titleLabel.frame = CGRectMake(0, 0, 282, 70);
    [containView addSubview:self.titleLabel];

    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, 282, 0.5)];
    lineView.backgroundColor = [UIColor grayColor];
    [containView addSubview:lineView];
    
    CGFloat buttonWid = containView.frame.size.width / self.buttonTitles.count;
    for (NSInteger index = 0; index < self.buttonTitles.count; index++) {
        
        NSString *title = self.buttonTitles[index];
        UIButton *button = [self createButton];
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = 1000 + index;
        [containView addSubview:button];
        button.frame = CGRectMake(buttonWid * index, 70, buttonWid, 54);
        
        
    }
    
    return containView;
}



-(UILabel *)titleLabel {
    
    if(!_titleLabel) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 282, 70)];
        titleLabel.font = [UIFont systemFontOfSize:19];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (void)buttonClick:(UIButton *)btn {
    
    NSInteger index = btn.tag - 1000;
    if(self.click) {
        
        self.click(self.buttonTitles[index], index);
    }
}



- (UIButton *)createButton {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    return button;
}
@end
