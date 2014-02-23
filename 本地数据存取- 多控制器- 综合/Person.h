//
//  Person.h
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import <Foundation/Foundation.h>

// 保存数据的person类
@interface Person : NSObject <NSCoding>

// 姓名
@property (strong, nonatomic) NSString *name;
// 性别
@property (strong, nonatomic) NSString *sex;
// 所在地
@property (strong, nonatomic) NSString *city;
// 简介
@property (strong, nonatomic) NSString *jianjie;
// 生日
@property (strong, nonatomic) NSString *birthday;
// 邮箱
@property (strong, nonatomic) NSString *mail;
// 博客
@property (strong, nonatomic) NSString *blog;

@end
