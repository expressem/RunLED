//
//  ViewController.m
//  跑马灯效果
//
//  Created by apple on 15/12/18.
//  Copyright © 2015年 pxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)  UILabel * label1;
@property (nonatomic,strong)  UILabel * label2;
@property (nonatomic,strong)  UIView * contentView;

@end

@implementation ViewController
- (UILabel *)label1{
    if (_label1 == nil) {
        self.label1 = [[UILabel alloc]init];
    }
    return _label1;
}
- (UILabel *)label2{
    if (_label2 == nil) {
        self.label2 = [[UILabel alloc]init];
    }
    return _label2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    float width = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;

    // Do any additional setup after loading the view, typically from a nib.
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 2*width/3, 44)];
    _contentView.clipsToBounds = YES;
    _contentView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_contentView];
    self.label1 = [UILabel new];
    _label1.frame = CGRectMake(0, 0, 2*width/3, 44);
    _label1.text = @"跑马灯跑马灯跑马灯跑马灯跑马灯";
    _label1.backgroundColor = [UIColor greenColor];
    [_contentView addSubview:_label1];
    
    
    self.label2 = [UILabel new];
    _label2.frame = CGRectMake(CGRectGetMaxX(_label1.frame),0 , 2*width/3, 44);
    _label2.text = @"跑马灯跑马灯跑马灯跑马灯跑马灯";
    _label2.backgroundColor = [UIColor redColor];
    [_contentView addSubview:_label2];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 60, 40);
    [button setTitle:@"Start Run" forState:UIControlStateNormal];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)buttonClicked:(id)sender{
    NSLog(@"buttonClicked");
    [UIView beginAnimations:@"label1" context:nil];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDuration:2.0f];
     [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.label1.center = CGPointMake(-self.contentView.center.x, self.label1.center.y);
    [UIView commitAnimations];
    
    
    [self moveLabel2];
    
    [self performSelector:@selector(reset) withObject:nil afterDelay:2];
    
    
}

- (void)moveLabel2{
    [UIView beginAnimations:@"label2" context:nil];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    [UIView setAnimationDuration:4.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.label2.center = CGPointMake(-self.contentView.center.x, self.label1.center.y);
    [UIView commitAnimations];
}
- (void)reset{
    self.label1.center = CGPointMake(self.contentView.center.x+self.contentView.frame.size.width, self.label1.center.y);
    [UIView beginAnimations:@"label1" context:nil];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    [UIView setAnimationDuration:4.0f];
     [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    self.label1.center = CGPointMake(-self.contentView.center.x, self.label1.center.y);
    [UIView commitAnimations];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
