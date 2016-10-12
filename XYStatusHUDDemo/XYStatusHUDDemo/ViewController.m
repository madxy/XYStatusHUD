//
//  ViewController.m
//  XYStatusHUD
//
//  Created by xuyao on 2016/10/12.
//  Copyright © 2016年 xuyao. All rights reserved.
//

#import "ViewController.h"
#import "XYStatusHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {

    [XYStatusHUD showSuccess:@"成功"];
    
}

- (IBAction)error:(id)sender {
    
    [XYStatusHUD showError:@"失败"];

}

- (IBAction)loading:(id)sender {
    
    [XYStatusHUD showLoading:@"正在加载"];

}

- (IBAction)dismiss:(id)sender {
    
    [XYStatusHUD dismiss];

}

- (IBAction)message:(id)sender {
    
    [XYStatusHUD showMessage:@"测试"];
    
}


@end
