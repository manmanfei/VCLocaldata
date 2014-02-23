//
//  XFViewController.m
//  本地数据存取- 多控制器- 综合
//
//  Created by 王小飞您 on 13-7-24.
//  Copyright (c) 2013年 wangxiaofei. All rights reserved.
//

#import "XFViewController.h"
#import "Person.h"

@interface XFViewController ()

// 设置储存person对象的 数组
@property(nonatomic, strong) NSMutableArray *personArray;

@property(nonatomic, strong) NSString *documentPath;

// 查看时候的传值用的view
@property(nonatomic, strong) readViewController *readView;

// 查看进入的行号
@property(nonatomic, assign) NSInteger rowNumber;
@end

@implementation XFViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // 拼接文件全路径
    self.documentPath = [paths[0] stringByAppendingPathComponent:@"personArray.plist"];
    
    // view加载完成时，解档文件。如果为空，下面在保存person到array的时候，会判断数组为nil,懒加载初始化数组。
    // 恢复解档文件，并赋给person对象数组！！！！！
    self.personArray = [NSKeyedUnarchiver unarchiveObjectWithFile:self.documentPath];
    
   // NSLog(@"%d",self.personArray.count);
}


#pragma mark 每当有cell进入视野时调用,返回当前这行显示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 0.用static 修饰的局部变量，只会初始化一次
    static NSString *ID= @"UITableViewCell";
    
    // 1.拿到一个标识先去缓存池中查找对应的 cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有，才需要传入一个标识创建cell UITableViewCellStyleValue1:标题和副标题的类型
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    // 3.(如果缓存池中有已经创建的cell且不在视野范围内)则不用创建新的cell，直接覆盖数据就可以用（标题数据 副标题）
    
    Person *pp = self.personArray[indexPath.row];
    cell.textLabel.text = pp.name;
    
    // 右边的箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}



#pragma mark 在准备执行线之前调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // 这里有2条segue 。所以要根据identifier 区别进入的哪个目的控制器segue.destinationViewController!!!!!!!!!!!!
    
    // isEqualToString,比较两个字符串是否相同
    if ([segue.identifier isEqualToString:@"writeSegue"] ) {
        // 线的目的控制器
        writeViewController *w = segue.destinationViewController;
        
        // 设置当前控制器是 writeViewController控制器的代理。!!!!! 不然无法传数据
        w.saveGelegate = self;
    } else {
        
        self.readView = segue.destinationViewController;
        
        // 设置自己是查看页面的代理
        self.readView.readGelegate = self;
    }
    
}

#pragma mark 实现遵守writeViewControllerGelegate协议的方法。保存writeViewController里的Person数据
- (void)writeViewControllerData:(writeViewController *)writeViewController
{
    // NSLog(@"-----%@",writeViewController.p.name);
    
    // 懒加载，什么时候使用就什么时候创建。
    // 如果没用任何person数据，就初始化创建数组!!!!!!!!!!! 勿忘初始化数组！！！！
    if (self.personArray == nil) {
        self.personArray = [NSMutableArray array];  // 整个程序只会执行一次
    }
    
    // 把新增的person 保存到对象数组。
    [self.personArray addObject:writeViewController.p];
    
    // 归档保存数组
    [NSKeyedArchiver archiveRootObject:self.personArray toFile:self.documentPath];
    
    // 刷新数据。---刷新界面
    [self.tableView reloadData];
}

#pragma mark 实现readViewControllerGelegate协议的方法
- (void)fromReadReload:(readViewController *)readViewController
{
    // 不能新增数据，而是把选中行的数据覆盖掉。
    // 查看回来后，修改选中行的数据
    self.personArray[self.rowNumber] = readViewController.persondata;
    
//    NSLog(@"%@",self.personArray[self.rowNumber]);
    
    // 归档数据
    [NSKeyedArchiver archiveRootObject:self.personArray toFile:self.documentPath];
    
    // 刷新
    [self.tableView reloadData];
    
}

#pragma mark - 代理方法
#pragma mark 选中某一行 就会执行这个方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    // 保存当前选中行的行号，便于编辑改变后覆盖数据
    self.rowNumber = indexPath.row;
    
    // 要把选中行的数据传给readviewcontroller
    Person *cellperson = self.personArray[indexPath.row];
    
    NSLog(@"%@",cellperson.name);   // 执行到这一行,界面还没跳转
    
    self.readView.Persondata = cellperson;
    
        
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    // NSLog(@"%d",self.personArray.count);
    return self.personArray.count;
}



@end
