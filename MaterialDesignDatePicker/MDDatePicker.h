//
//  MDDatePicker.h
//  MaterialDesignDatePicker
//
//  Created by Nobel on 15/5/27.
//  Copyright (c) 2015年 Nobel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MDDatePickerDelegate

- (void)confirmButtonClicked;
- (void)cancelButtonClicked;

@end

@interface MDDatePicker : UIView

@property(nonatomic,strong)id<MDDatePickerDelegate> delegate;

-(void)show;
-(void)dismiss;

@end
