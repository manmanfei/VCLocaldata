//
//  writeViewController.m
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import "writeViewController.h"

@interface writeViewController ()

@end

@implementation writeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 只有查看编辑的时候会进入！！！
    // 当进入write页面时，数据不为空，说明是从查看编辑时进入的。 所以这时候直接给界面赋值，显示出来。！！！
    if (self.p != nil) {
        self.name.text = self.p.name;
    }
}




- (IBAction)save:(id)sender {
    
    // 懒加载，只初始化一次Person。 当第一次保存person时候初始化。后面几次时候，数据直接覆盖了person。！！！
    if (self.p == nil) {
        self.p = [[Person alloc] init]; 
    }
    
    
    
    // 保存界面信息到person
    self.p.name = self.name.text;
    self.p.sex = self.sex.text;
    self.p.city = self.city.text;
    self.p.jianjie = self.jianjie.text;
    self.p.birthday = self.birthday.text;
    self.p.mail = self.main.text;
    self.p.blog = self.blog.text;
    
    // 代理属性调用协议的里方法，给遵守协议的ViewControll传值。 参数self穿的是当前这个控制器。！！！！
    [self.saveGelegate writeViewControllerData:self];

    
    // 将栈顶控制器弹出
    [self.navigationController popViewControllerAnimated:YES];
}
@end
