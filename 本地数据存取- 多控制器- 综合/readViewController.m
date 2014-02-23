//
//  readViewController.m
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import "readViewController.h"

@interface readViewController ()

@end

@implementation readViewController

#pragma mark 系统自己生产get和set方法。为了方便把数据直接显示在界面上，自己写person的set方法,这样系统就不生产set方法了。
- (void)setPersondata:(Person *)persondata
{
    // 赋值数据. !!!!给成员变量赋值，不能self.persondata 这是调用set方法，会造成死循环
    _persondata = persondata;
    

    // 把数据直接显示在界面上
    self.nameLabel.text = persondata.name;
    self.sexLabel.text = persondata.sex;
    self.cityLabel.text = persondata.city;
    self.jianjieLabel.text = persondata.jianjie;
    self.birthdayLabel.text = persondata.birthday;
    self.mailLabel.text = persondata.mail;
    self.bolgLabel.text = persondata.blog;
    
}


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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // NSLog(@"%@",self.persondata.name);
    
    
}

#pragma mark 执行编辑线之前，把查看的数据传给查看页面，并显示。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    writeViewController *wr = segue.destinationViewController;
    
    wr.p = self.persondata;
    
    // 设置代理是自己。
    wr.saveGelegate = self;
    
}

#pragma mark write视图的代理方法
- (void)writeViewControllerData:(writeViewController *)writeViewController
{
    // 覆盖写好的数据 到查看页面。
    self.persondata = writeViewController.p;
    
    // 在编辑页面给查看页面发送消息更改数据后， 查看页面再把新数据，利用代理把自己传给主页面。
    [self.readGelegate fromReadReload:self];
}


@end
