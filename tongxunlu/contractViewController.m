//
//  contractViewController.m
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import "contractViewController.h"

#define UserNameKey @"name"
#define PwdKey @"pwd"
#define RmbPwdKey @"rmb_pwd"
#define ContactFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"contacts.data"]

@implementation contractViewController
{
    NSMutableArray *_contractarry;
}
- (IBAction)exitbutton:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出" message:@"确定要退出嘛" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contractarry.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" ];
    jkcontractModel *contractModel = self.contractarry[indexPath.row];
    cell.textLabel.text = contractModel.name;
    cell.detailTextLabel.text = contractModel.phoneNumber;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)editViewController:(editViewController *)editvc didSaveContract:(jkcontractModel *)model
{
    [self.tableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.contractarry toFile:ContactFilePath];
}

-(void)addContract:(addViewController *)addVc didAddContract:(jkcontractModel *)contract
{
    
    [self.contractarry addObject:contract];
    [self.tableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.contractarry toFile:ContactFilePath];

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.contractarry removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.contractarry toFile:ContactFilePath];
        
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id vc = segue.destinationViewController;
    if([vc isKindOfClass:[addViewController class]]){
    addViewController *addvc = segue.destinationViewController;
    addvc.delegate =self;
    }
    else if([vc isKindOfClass:[editViewController class]]){
        editViewController *editvc = segue.destinationViewController;
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editvc.contractModel = self.contractarry[path.row];
        editvc.delegate = self;
        
    }
}

#pragma mark - 去掉多余的线
-(void)clearExtraLine:(UITableView *)tableview
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}

-(void)viewDidLoad
{
    if(_contractarry == nil){
        _contractarry =[NSKeyedUnarchiver unarchiveObjectWithFile:ContactFilePath];
        if(_contractarry == nil){
           _contractarry = [[NSMutableArray alloc]init];
        }
    }
    [super viewDidLoad];
    [self clearExtraLine:self.tableView];
}
@end
