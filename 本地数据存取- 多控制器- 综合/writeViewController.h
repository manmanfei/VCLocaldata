//
//  writeViewController.h
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
// 声明协议。才能定义代理的类型。！！！
@protocol writeViewControllerGelegate;

@interface writeViewController : UITableViewController

- (IBAction)save:(id)sender;

// strong 代表当前这个控制器在，Person的p数据就在。！！！
@property(nonatomic, strong) Person *p;


@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UITextView *jianjie;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UITextField *main;
@property (weak, nonatomic) IBOutlet UITextField *blog;

// 定义代理。！！！
@property(nonatomic, weak) id<writeViewControllerGelegate> saveGelegate;

@end





// 定义协议。负责给遵守 writeViewControllerGelegate协议的类，传消息。
@protocol writeViewControllerGelegate <NSObject>

// 给遵守协议的控制器传值的时候，传的参数是包含数据的控制器。！！！！
- (void)writeViewControllerData:(writeViewController *)writeViewController;

@end