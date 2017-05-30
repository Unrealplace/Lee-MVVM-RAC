//
//  MainViewController.m
//  MVVM-RAC-Demo
//
//  Created by LiYang on 17/5/30.
//  Copyright © 2017年 LiYang. All rights reserved.
//

#import "MainViewController.h"
#import <Masonry.h>
#import "TableViewModel.h"

@interface MainViewController ()

@property(nonatomic,strong)UITableView * showTableView;
@property(nonatomic,strong)UIView          * noDataView;
@property(nonatomic,strong)TableViewModel * ViewModel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.ViewModel requestDataandSetUISuccessBlock:^{
         
        [self.ViewModel handleWithTable:self.showTableView];

    } andErrorBlock:^{
        [self.ViewModel handleWithNoDataView:self.noDataView];
    }];
    
    
    
}

-(UITableView*)showTableView{

    if (!_showTableView) {
        _showTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_showTableView];
        [_showTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self.view);
        }];
       
    }
    return _showTableView;
    
}
-(UIView*)noDataView{

    if (!_noDataView) {
        _noDataView = [UIView new];
        [self.view addSubview:_noDataView];
        _noDataView.backgroundColor = [UIColor redColor];
        [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self.view);
        }];
    }
    return _noDataView;
    
}
-(TableViewModel*)ViewModel{

    if (!_ViewModel) {
        _ViewModel = [[TableViewModel alloc] init];
    }
    return _ViewModel;
    
}

@end
