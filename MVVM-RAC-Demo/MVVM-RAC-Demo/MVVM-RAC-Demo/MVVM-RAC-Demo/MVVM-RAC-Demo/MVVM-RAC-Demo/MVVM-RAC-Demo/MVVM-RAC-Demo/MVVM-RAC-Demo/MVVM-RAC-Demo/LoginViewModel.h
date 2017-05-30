//
//  LoginViewModel.h
//  MVVM-RAC-Demo
//
//  Created by LiYang on 17/5/30.
//  Copyright © 2017年 LiYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

@interface LoginViewModel : NSObject
@property(nonatomic,strong)NSString * userName;
@property(nonatomic,strong)NSString * passWord;
@property(nonatomic,strong)RACSubject * successSubject;
@property(nonatomic,strong)RACSubject * failureSubject;
@property(nonatomic,strong)RACSubject * errorSubject;

/**
 *  按钮是否可点信息
 *
 */
-(RACSignal*)validSignal;
/**
 *  登陆操作
 */
-(void)login;

@end
