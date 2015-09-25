//
//  contractViewController.h
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jkcontractModel.h"
#import "addViewController.h"
#import "editViewController.h"
@interface contractViewController : UITableViewController<UITableViewDataSource,addViewControllerDelegate,UITableViewDelegate,editViewControllerDelegate>
@property (nonatomic,strong) NSMutableArray *contractarry;
@end
