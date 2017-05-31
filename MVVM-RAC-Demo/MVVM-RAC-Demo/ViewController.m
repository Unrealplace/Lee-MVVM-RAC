//
//  ViewController.m
//  MVVM-RAC-Demo
//
//  Created by LiYang on 17/5/30.
//  Copyright © 2017年 LiYang. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewModel.h"
#import "User.h"
#import "MainViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UserT;
@property (weak, nonatomic) IBOutlet UITextField *PassT;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (nonatomic,strong)LoginViewModel * viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindModel];
}
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:YES];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
}
-(void)bindModel{

    self.viewModel = [[LoginViewModel alloc] init];
    RAC(self.viewModel,userName) = self.UserT.rac_textSignal;
    RAC(self.viewModel,passWord) = self.PassT.rac_textSignal;
    RAC(self.LoginBtn,enabled)   = [self.viewModel validSignal];
    @weakify(self);
    [self.viewModel.successSubject subscribeNext:^(id x) {
        @strongify(self);
        User * user = x[0];
        NSLog(@"%@--->>%@",user.username,user.password);
        NSLog(@"login success");
        MainViewController * vc = [MainViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    [self.viewModel.failureSubject subscribeNext:^(id x) {
        NSLog(@"login failure");
    }];
    [self.viewModel.errorSubject subscribeNext:^(id x) {
        NSLog(@"login error");
    }];
    [[self.LoginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.viewModel login];
    }];
    
    
}

-(void)dealloc{

    NSLog(@"dealloc");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
