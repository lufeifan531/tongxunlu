//
//  loginViewController.h
//  tongxunlu
//
//  Created by 陆非凡 on 15/8/24.
//  Copyright (c) 2015年 陆非凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *namefield;
@property (weak, nonatomic) IBOutlet UITextField *mimafield;
@property (weak, nonatomic) IBOutlet UISwitch *jizhuswitch;
@property (weak, nonatomic) IBOutlet UIButton *loginbutton;

@end
