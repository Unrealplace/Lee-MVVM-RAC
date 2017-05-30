//
//  LoginViewModel.m
//  MVVM-RAC-Demo
//
//  Created by LiYang on 17/5/30.
//  Copyright © 2017年 LiYang. All rights reserved.
//

#import "LoginViewModel.h"
#import "User.h"

@interface LoginViewModel ()
/** 用户名改变信号 */
@property(nonatomic,strong)RACSignal * userNameSignal;
/** 密码改变信号 */
@property(nonatomic,strong)RACSignal * passwordSignal;
/** 请求数据（模拟） */
@property(nonatomic,strong)NSArray    * requestData;

@end
@implementation LoginViewModel

-(instancetype)init{

    if (self = [super init]) {
        _userNameSignal = RACObserve(self, userName);
        _passwordSignal  = RACObserve(self, passWord);
        _successSubject   = [RACSubject subject];
        _failureSubject     = [RACSubject subject];
        _errorSubject       = [RACSubject subject];
    }
    return self;
}

-(RACSignal*)validSignal{

    RACSignal * validsignal = [RACSignal combineLatest:@[_userNameSignal,_passwordSignal] reduce:^id(NSString * userName,NSString * passWord){
       
        return @(userName.length>=6 && passWord.length>=6);
    }];
    return validsignal;
    
}
-(void)login{

    User * user = [[User alloc] init];
    user.username = self.userName;
    user.password  = self.passWord;
    _requestData = @[user];
    [_successSubject sendNext:_requestData];
    
}


@end
