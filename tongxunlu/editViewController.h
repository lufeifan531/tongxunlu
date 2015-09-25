//
//  editViewController.h
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jkcontractModel.h"
@class jkcontractModel,editViewController;
@protocol editViewControllerDelegate <NSObject>

@optional
-(void)editViewController:(editViewController *)editvc didSaveContract:(jkcontractModel *)model;
@end
@interface editViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *namefield;
@property (weak, nonatomic) IBOutlet UITextField *phonefield;
@property (weak, nonatomic) IBOutlet UIButton *savebutton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editbutton;
@property (strong,nonatomic) jkcontractModel *contractModel;
@property (assign,nonatomic) id<editViewControllerDelegate> delegate;
@end
