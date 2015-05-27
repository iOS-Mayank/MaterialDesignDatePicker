//
//  MDDatePicker.m
//  MaterialDesignDatePicker
//
//  Created by Nobel on 15/5/27.
//  Copyright (c) 2015年 Nobel. All rights reserved.
//

#define nowDevice (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPhone UIUserInterfaceIdiomPhone
#define iPad UIUserInterfaceIdiomPad
#define kinfoColor [UIColor colorWithRed:55/255.0f green:66/255.0f blue:72/255.0f alpha:1]
#define kbackColor [UIColor colorWithRed:30/255.0f green:50/255.0f blue:56/255.0f alpha:1]
#define klightColor [UIColor colorWithRed:131/255.0f green:202/255.0f blue:196/255.0f alpha:1]

#import "MDDatePicker.h"
#import "BFPaperButton.h"

@interface MDDatePicker()

@property(nonatomic,strong) UIView *backView, *infoView, *pickerView, *buttonView, *shadowView;
@property(nonatomic,strong) UILabel *weekLabel;
@property(nonatomic,strong) UIButton *mounthButton, *dayButton, *yearButton;
@property(nonatomic,strong) BFPaperButton *cancelButton, *confirmButton;

@end

@implementation MDDatePicker


-(instancetype)init{
    self = [super init];
    if (self) {
        self.shadowView = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.shadowView];
        self.shadowView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
        self.shadowView.alpha = 0;
        
        self.backView = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.backView];
        self.backView.backgroundColor = kbackColor;
        
        self.infoView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.backView addSubview:self.infoView];
        self.infoView.backgroundColor = kinfoColor;
        
        self.pickerView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.backView addSubview:self.pickerView];
        
        self.buttonView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.backView addSubview:self.buttonView];
        
        self.weekLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.infoView addSubview:self.weekLabel];
        
        self.mounthButton = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.infoView addSubview:self.mounthButton];
        
        self.dayButton = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.infoView addSubview:self.dayButton];
        
        self.yearButton = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.infoView addSubview:self.yearButton];
        
        self.cancelButton = [[BFPaperButton alloc]initWithFrame:CGRectZero];
        self.cancelButton.isRaised = NO;
        [self.backView addSubview:self.cancelButton];
        
        self.confirmButton = [[BFPaperButton alloc]initWithFrame:CGRectZero];
        self.confirmButton.isRaised = NO;
        [self.backView addSubview:self.confirmButton];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

- (void)confirmButtonClicked{
    [self.delegate confirmButtonClicked];
}

- (void)cancelButtonClicked{
    [self.delegate cancelButtonClicked];
}

-(void)show{
    UIViewController *vc = self.delegate;
    self.frame = vc.view.frame;
    self.shadowView.frame = self.frame;
    [vc.view addSubview:self];
    [self.backView setTransform:CGAffineTransformMakeScale(0.995, 0.985)];
    self.backView.center = CGPointMake(vc.view.frame.size.width / 2, vc.view.frame.size.height / 2 - 3);
    [UIView animateWithDuration:0.2 animations:^{
        [self.backView setTransform:CGAffineTransformMakeScale(1, 1)];
        //        self.backView.layer.transform = CATransform3DIdentity;
        self.shadowView.alpha = 1;
        self.backView.alpha = 1;
        self.backView.center = CGPointMake(vc.view.frame.size.width / 2, vc.view.frame.size.height / 2);
    }];
}

-(void)dismiss{
    UIViewController *vc = self.delegate;
    [UIView animateWithDuration:0.2 animations:^{
        self.shadowView.alpha = 0;
        self.backView.alpha = 0;
        self.backView.center = CGPointMake(vc.view.frame.size.width / 2, vc.view.frame.size.height / 2 - 3);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
