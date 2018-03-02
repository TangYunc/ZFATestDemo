//
//  MineFirstSectionCell.m
//  ZhongFaZhiZao
//
//  Created by 中发 on 2018/3/2.
//  Copyright © 2018年 中发. All rights reserved.
//

#import "MineFirstSectionCell.h"
#import "MineOrderCustomBtn.h"
#import "AccountAndPWLoginViewController.h"

@implementation MineFirstSectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.backgroundView = nil;
        //初始化子视图
        [self initSubviews];
    }
    return self;
}
//初始化子视图
- (void)initSubviews{
    
    NSArray *titles = @[@"待付款",@"待发货",@"待收货",@"退款中"];
    NSArray *imageNames = @[@"MineForThePaymentIcon",@"MineToSendTheGoodsIcon",@"MineForTheGoodsIcon",@"MineRefundingIcon"];
    NSInteger temptCount = titles.count;
    CGFloat itemWidth = kScreenWidth / temptCount;
    CGFloat itemHeight = 72 * KWidth_ScaleH;
    for (int i = 0; i < temptCount; i++) {
        MineOrderCustomBtn *customBtn = [[MineOrderCustomBtn alloc] initWithFrame:CGRectMake(i * itemWidth, 0, itemWidth, itemHeight)];
        
        // 设置标题
        [customBtn setTitle:titles[i]];
        // 设置图片
        [customBtn setTitleImage:[UIImage imageNamed:imageNames[i]]];
        // 设置事件
        customBtn.tag =  10 + i;
        customBtn.layer.borderWidth = 0.5;
        customBtn.layer.borderColor = UIColorFromRGBA(245, 245, 245, 1.0).CGColor;
        [customBtn addTarget:self action:@selector(customBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:customBtn];
    }
    
    //底部的线
    _bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    _bottomView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [self.contentView addSubview:_bottomView];
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    _bottomView.frame = CGRectMake(0, self.height - 10, self.width, 10);
}

#pragma mark -- 按钮事件
- (void)customBtnAction:(UIButton *)button{
    
    if (![KUserDefault objectForKey:@"token"]) {
        
        AccountAndPWLoginViewController *vc = [[AccountAndPWLoginViewController alloc]init];
        [self.viewControler.navigationController pushViewController:vc animated:YES];
    }else{
        
        if (button.tag == 10) {
            NSLog(@"待付款");
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",BaseApi,MineForThePayment_api] title:@"待付款"];
            
            [self.viewControler.navigationController pushViewController:vc animated:YES];
        }else if (button.tag == 11){
            NSLog(@"待发货");
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",BaseApi,MineToSendTheGoods_api] title:@"待发货"];
            
            [self.viewControler.navigationController pushViewController:vc animated:YES];
        }else if (button.tag == 12){
            NSLog(@"待收货");
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",BaseApi,MineForTheGoods_api] title:@"待收货"];
            
            [self.viewControler.navigationController pushViewController:vc animated:YES];
        }else{
            NSLog(@"退款中");
            WKWebViewViewController *vc = [[WKWebViewViewController alloc]initWithUrlStr:[NSString stringWithFormat:@"%@%@",BaseApi,MineRefunding_api] title:@"退款中"];
            
            [self.viewControler.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
