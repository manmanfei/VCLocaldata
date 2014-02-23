//
//  XFViewController.h
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import <UIKit/UIKit.h>

// 引入包含协议的头文件，才能遵守协议
#import "writeViewController.h"
#import "readViewController.h"
@interface XFViewController : UITableViewController<writeViewControllerGelegate ,readViewControllerGelegate>

@end
