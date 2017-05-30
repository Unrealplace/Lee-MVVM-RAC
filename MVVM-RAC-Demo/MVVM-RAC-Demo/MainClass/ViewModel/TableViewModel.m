//
//  TableViewModel.m
//  MVVM-RAC-Demo
//
//  Created by LiYang on 17/5/30.
//  Copyright © 2017年 LiYang. All rights reserved.
//

#import "TableViewModel.h"
#import "MainCell.h"
static NSString * mainCellID = @"main";

@interface TableViewModel()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation TableViewModel

-(void)requestDataandSetUISuccessBlock:(LeeGetDataSuccessBlock)successBlock andErrorBlock:(LeeGetDataErrorBlock)errorBlock{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 5000; i++) {
            NSLog(@"jjj");
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            (arc4random() % 10 )> 5 ? (successBlock()):(errorBlock());
        });

    });
}


-(void)handleWithTable:(UITableView*)table{

    table.dataSource = self;
    table.delegate      = self;
    [table registerClass:[MainCell class] forCellReuseIdentifier:mainCellID];
    
}
-(void)handleWithNoDataView:(UIView *)noDataView{

    noDataView.hidden = NO;
    
}
#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MainCell * cell = [tableView dequeueReusableCellWithIdentifier:mainCellID];
    if (!cell) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainCellID];
    }
//    [cell configureCellWith:nil indexPath:indexPath];
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
