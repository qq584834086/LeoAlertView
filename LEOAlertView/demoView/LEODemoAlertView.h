//
//  LEODemoAlertView.h
//  LEOAlertView
//
//  Created by LeoWang on 2019/6/13.
//  Copyright © 2019年 LeoWang. All rights reserved.
//

#import "LEOAlertView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^LEODemoAlertViewButtonClick)(NSString *title, NSInteger index);

@interface LEODemoAlertView : LEOAlertView

@property (nonatomic, copy) LEODemoAlertViewButtonClick click;


- (void)showWithButtonTitles:(NSArray*)titles
                textTitle:(NSString*)title;


@end

NS_ASSUME_NONNULL_END
