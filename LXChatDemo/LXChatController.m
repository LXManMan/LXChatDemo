//
//  LXChatController.m
//  LXChatDemo
//
//  Created by Lai on 2019/7/5.
//  Copyright © 2019 manman. All rights reserved.
//

#import "LXChatController.h"
#import "LXChatBaseCell.h"
#import "LXChatModel.h"
#import "LXChatImageCell.h"
#import "LXChatMessageTextCell.h"
@interface LXChatController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *dataA;
@end

@implementation LXChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      self.title = @"LXChat";
    [self.view addSubview:self.tableview];
    
    [self configData];
}
-(void)configData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"chat" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [self.dataA removeAllObjects];
    for (NSDictionary *dic in dict[@"data"]) {
        LXChatModel *model =[LXChatModel mj_objectWithKeyValues:dic];
        [self.dataA addObject:model];
    }
    [self.tableview reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataA.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LXChatModel *model = self.dataA[indexPath.row];
    
    NSInteger messageType = [model.messageType integerValue];
    
    if (messageType == 3) {
        LXChatMessageTextCell *cell =[tableView dequeueReusableCellWithIdentifier:@"LXChatMessageTextCell" forIndexPath:indexPath];
        if (!cell) {
            cell =[[LXChatMessageTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LXChatMessageTextCell"];
        }
        
        [cell configureCellWithData:model];
         return cell;
    }else{
        LXChatImageCell *cell =[tableView dequeueReusableCellWithIdentifier:@"LXChatImageCell" forIndexPath:indexPath];
        if (!cell) {
            cell =[[LXChatImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LXChatImageCell"];
        }
        
        [cell configureCellWithData:model];
        return cell;
    }
   
   
    
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        LXRegistCellClass(_tableview, @"UITableViewCell");
        LXRegistCellClass(_tableview, @"LXChatMessageTextCell");
        LXRegistCellClass(_tableview, @"LXChatImageCell");

        
        _tableview.rowHeight = UITableViewAutomaticDimension;
        _tableview.estimatedRowHeight =  60;
        _tableview.tableFooterView =[UIView new];
        _tableview.separatorStyle = 0;
    }
    return _tableview;
}
-(NSMutableArray *)dataA{
    if (!_dataA) {
        _dataA =[NSMutableArray array];
    }
    return _dataA;
}
@end
