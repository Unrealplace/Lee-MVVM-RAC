//
//  TableViewModel.h
//  MVVM-RAC-Demo
//
//  Created by LiYang on 17/5/30.
//  Copyright © 2017年 LiYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^LeeGetDataSuccessBlock)();
typedef void (^LeeGetDataErrorBlock)();
@interface TableViewModel : NSObject

-(void)handleWithTable:(UITableView*)table;
-(void)handleWithNoDataView:(UIView*)noDataView;

-(void)requestDataandSetUISuccessBlock:(LeeGetDataSuccessBlock)successBlock andErrorBlock:(LeeGetDataErrorBlock)errorBlock;

@end
