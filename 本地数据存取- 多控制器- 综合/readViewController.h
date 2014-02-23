//
//  readViewController.h
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "writeViewController.h"

// 声明协议
@protocol readViewControllerGelegate;


@interface readViewController: UITableViewController<writeViewControllerGelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UITextView *jianjieLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;
@property (weak, nonatomic) IBOutlet UILabel *bolgLabel;

// 定义数据
@property(nonatomic, strong) Person *persondata;

// 定义代理
@property(nonatomic, weak) id<readViewControllerGelegate> readGelegate;

@end

// 定义协议
@protocol readViewControllerGelegate <NSObject>

- (void)fromReadReload:(readViewController *)readViewController;

@end