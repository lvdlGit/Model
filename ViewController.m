//
//  ViewController.m
//  Model
//
//  Created by lvdl on 16/9/23.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "ViewController.h"
#import "CinemaCell.h"
#import "Cinema.h"

#import <objc/runtime.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *cinemaData;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupCinemaData];
    
    [self setupTableView];
}

- (void)setupCinemaData

{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cinema_list" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:path]];
    
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *jsonDic = json;
    
    NSArray *jsonArr = [jsonDic objectForKey:@"cinemaList"];
    if ([jsonArr isKindOfClass:[NSNull class]]) {
        return;
    }
    
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:2];
    for (NSDictionary *dic in jsonArr) {
        
        Cinema *cinema = [[Cinema alloc] initWithDic:dic];
        [temp addObject:cinema];
    }
    
    _cinemaData = [NSArray arrayWithArray:temp];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.tableHeaderView = [[UIView alloc] init];
    tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mask - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cinemaData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cinemaIdentifier = @"cinemaIdentifier";
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:cinemaIdentifier];
    if (cell == nil) {
        cell = [[CinemaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cinemaIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Cinema *cinema = _cinemaData[indexPath.row];
    [cell layoutCellView:cinema];
    
    return cell;
}

#pragma mask - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
