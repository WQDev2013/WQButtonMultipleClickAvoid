//
//  ViewController.m
//  WQButtonMultipleClickAvoid
//
//  Created by chenweiqiang on 2019/3/21.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+MultipleClickAvoid.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [btn1 setTitle:@"防重复按钮" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    btn1.eventInterval = 2;
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    [btn2 setTitle:@"普通按钮" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor blueColor];
    [btn2 addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnAction
{
    NSLog(@"click!");
}

@end
