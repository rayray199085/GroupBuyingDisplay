//
//  ViewController.m
//  GroupBuyingDisplay
//
//  Created by Stephen Cao on 9/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "ViewController.h"
#import "SCGroupItem.h"
#import "SCTableViewCell.h"
#import "SCFooterView.h"
#import "SCHeaderView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,SCFooterViewDelegate>
@property(nonatomic,strong)NSMutableArray *itemGroup;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController
- (NSMutableArray *)itemGroup{
    if(_itemGroup == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempGroup = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCGroupItem *item = [SCGroupItem groupItemWithDictionary:dict];
            [tempGroup addObject:item];
        }
        _itemGroup = tempGroup;
    }
    return _itemGroup;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 60;
    SCFooterView *footerView = [SCFooterView footerView];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
    SCHeaderView *headerView = [SCHeaderView headerView];
    self.tableView.tableHeaderView = headerView;
}
#pragma mark - /***hide status bar***/
- (BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark - /***dataSource Delegate Methods***/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemGroup.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCGroupItem *item = self.itemGroup[indexPath.row];
    SCTableViewCell *cell = [SCTableViewCell tableViewCellWithTableView:tableView];
    cell.item = item;
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"";
}

#pragma mark - SCFooterViewDelegate
- (void)footerViewDidLoadMoreItems:(SCFooterView *)footerView{
    SCGroupItem *newItem = [[SCGroupItem alloc]init];
    newItem.title = @"Sushi Hub";
    newItem.price = @"110";
    newItem.buyCount = @"66";
    newItem.icon = @"d40878ee9d97a53bd4b8778daa11d38d";
    [self.itemGroup addObject:newItem];
    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.itemGroup.count -1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
@end
