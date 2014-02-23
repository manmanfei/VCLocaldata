//
//  Person.m
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - 归档和恢复
// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.city forKey:@"location"];
    [aCoder encodeObject:self.jianjie forKey:@"description"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.mail forKey:@"email"];
    [aCoder encodeObject:self.blog forKey:@"blog"];

}

// 恢复
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.sex = [aDecoder decodeObjectForKey:@"sex"];
    self.city = [aDecoder decodeObjectForKey:@"city"];
    self.jianjie = [aDecoder decodeObjectForKey:@"jianjie"];
    self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
    self.mail = [aDecoder decodeObjectForKey:@"mail"];
    self.blog = [aDecoder decodeObjectForKey:@"blog"];

    return self;
}

@end