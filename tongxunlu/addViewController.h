//
//  addViewController.h
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import <UIKit/UIKit.h>
@class addViewController,jkcontractModel;
@protocol addViewControllerDelegate <NSObject>

@optional
-(void)addContract:(addViewController *)addVc didAddContract:(jkcontractModel *)contract;

@end
@interface addViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *namefield;
@property (weak, nonatomic) IBOutlet UITextField *phonefield;
@property (weak, nonatomic) IBOutlet UIButton *addbutton;
@property (assign,nonatomic)id<addViewControllerDelegate> delegate;

@end
